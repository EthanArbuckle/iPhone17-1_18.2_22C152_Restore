uint64_t onEventStreamsUpdated_bounce(uint64_t a1, void *a2)
{
  return [a2 onEventStreamsUpdated];
}

void sub_256D34D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v27 - 112));
  _Unwind_Resume(a1);
}

void sub_256D3618C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x4E0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Block_object_dispose(&STACK[0x570], 8);
  _Block_object_dispose(&STACK[0x590], 8);
  _Block_object_dispose(&STACK[0x5B0], 8);
  _Block_object_dispose(&STACK[0x5D0], 8);
  _Block_object_dispose(&STACK[0x5F0], 8);
  _Block_object_dispose(&STACK[0x610], 8);
  _Block_object_dispose(&STACK[0x630], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void sub_256D36B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256D375EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256D37EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void _MODiagnosticReporter_NotificationHandler(uint64_t a1, uint64_t a2)
{
  v4 = _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _MODiagnosticReporter_NotificationHandler_cold_1(a2, v4);
  }

  v5 = +[MODiagnosticReporter defaultReporter];
  [v5 _notificationHandlerWithNotificationRef:a1 andOptionFlags:a2];
}

void sub_256D3BDC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_256D3C568(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_256D3C714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_256D3C7B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_256D3CB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

id _mo_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_mo_log_facility_prepare);
  }
  uint64_t v2 = (void *)predicate[2];
  return v2;
}

os_log_t _mo_log_facility_prepare(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.MomentsOnboardingAndSettings", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void sub_256D3DDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL isValidString(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v3 = [v1 stringByTrimmingCharactersInSet:v2];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_256D3FBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_256D40230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_256D407AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.onboardingManager()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  return v0;
}

id MOSuggestionSheetOnboardingSettingsViewController.onboardingManager.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager));
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.delegate()
{
  return 0;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.delegate.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.delegate.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.delegate.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion()
{
  return 0;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion);
  swift_beginAccess();
  return *v1;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton()
{
  return 0;
}

void *MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.getter()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(void *a1)
{
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.backButton()
{
  return 0;
}

void *MOSuggestionSheetOnboardingSettingsViewController.backButton.getter()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void MOSuggestionSheetOnboardingSettingsViewController.backButton.setter(void *a1)
{
}

void MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(void *a1, void *a2)
{
  BOOL v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  NSObject *v4 = a1;
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.backButton.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled()
{
  return 0;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled);
  swift_beginAccess();
  return *v1;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled.setter(char a1)
{
  id v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

double variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.tableViewHeight()
{
  return 0.0;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.tableViewHeightConstraint()
{
  return 0;
}

void *closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings()
{
  uint64_t v0 = (void *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v167 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = (void *)MEMORY[0x25A2AF5D0](0xD00000000000001CLL, 0x8000000256D52FF0);
  id v4 = objc_msgSend(self, sel_bundleWithIdentifier_, v3);

  type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = self;
  id v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  v179._countAndFlagsBits = 0xD00000000000002CLL;
  v8._countAndFlagsBits = 0xD0000000000000A0;
  v179._object = (void *)0x8000000256D53660;
  v8._object = (void *)0x8000000256D535B0;
  unint64_t v9 = 0xE000000000000000;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  Swift::String v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v10, v179);

  id v173 = v4;
  id v176 = v6;
  id v177 = v0;
  uint64_t v178 = ObjCClassFromMetadata;
  if (!v4)
  {
    uint64_t v15 = 0;
LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_256D51150;
    uint64_t v18 = MEMORY[0x263F8D310];
    *(void *)(v17 + 56) = MEMORY[0x263F8D310];
    unint64_t v19 = lazy protocol witness table accessor for type String and conformance String();
    *(Swift::String *)(v17 + 32) = v11;
    *(void *)(v17 + 96) = v18;
    *(void *)(v17 + 104) = v19;
    *(void *)(v17 + 64) = v19;
    *(void *)(v17 + 72) = v15;
    *(void *)(v17 + 80) = v9;
    swift_bridgeObjectRetain();
    uint64_t v20 = String.init(format:_:)();
    uint64_t v22 = v21;
    id v23 = objc_allocWithZone(MEMORY[0x263F089B8]);
    v24 = (void *)MEMORY[0x25A2AF5D0](v20, v22);
    id v25 = objc_msgSend(v23, sel_initWithString_, v24);

    id v26 = objc_allocWithZone(NSString);
    uint64_t v27 = (void *)MEMORY[0x25A2AF5D0](v20, v22);
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v26, sel_initWithString_, v27);

    v29 = (void *)MEMORY[0x25A2AF5D0](v15, v9);
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v28, sel_rangeOfString_, v29);
    uint64_t v32 = v31;

    uint64_t v33 = *MEMORY[0x263F81520];
    URL.init(string:)();
    uint64_t v34 = Optional._bridgeToObjectiveC()();
    outlined destroy of URL?((uint64_t)v2);
    id v172 = v25;
    objc_msgSend(v25, sel_addAttribute_value_range_, v33, v34, v30, v32);
    swift_unknownObjectRelease();
    id v175 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), sel_init);
    objc_msgSend(v175, sel_setAttributedText_, v25);
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), (SEL)&selRef_localizedDescription);
    *(void *)&long long v168 = v35;
    id v36 = v176;
    id v37 = objc_msgSend(v176, sel_bundleForClass_, v178);
    v38._countAndFlagsBits = 0xD000000000000018;
    v180._countAndFlagsBits = 0xD000000000000033;
    v180._object = (void *)0x8000000256D536B0;
    v38._object = (void *)0x8000000256D53690;
    v39._countAndFlagsBits = 0;
    v39._object = (void *)0xE000000000000000;
    Swift::String v40 = NSLocalizedString(_:tableName:bundle:value:comment:)(v38, (Swift::String_optional)0, (NSBundle)v37, v39, v180);

    id v41 = objc_allocWithZone(MEMORY[0x263F089B8]);
    v42 = (void *)MEMORY[0x25A2AF5D0](v40._countAndFlagsBits, v40._object);
    swift_bridgeObjectRelease();
    id v43 = objc_msgSend(v41, sel_initWithString_, v42);

    objc_msgSend(v35, sel_setAttributedText_, v43);
    id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), (SEL)&selRef_localizedDescription);
    id v170 = v44;
    uint64_t v45 = v178;
    id v46 = objc_msgSend(v36, (SEL)0x265425F25, v178);
    v181._countAndFlagsBits = 0xD000000000000029;
    v47._countAndFlagsBits = 0xD000000000000044;
    v181._object = (void *)0x8000000256D53740;
    v47._object = (void *)0x8000000256D536F0;
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    Swift::String v49 = NSLocalizedString(_:tableName:bundle:value:comment:)(v47, (Swift::String_optional)0, (NSBundle)v46, v48, v181);

    id v50 = objc_allocWithZone(MEMORY[0x263F089B8]);
    v51 = (void *)MEMORY[0x25A2AF5D0](v49._countAndFlagsBits, v49._object);
    swift_bridgeObjectRelease();
    id v52 = objc_msgSend(v50, sel_initWithString_, v51);

    objc_msgSend(v44, sel_setAttributedText_, v52);
    id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), sel_init);
    id v171 = v53;
    id v54 = objc_msgSend(v36, (SEL)0x265425F25, v45);
    v182._countAndFlagsBits = 0xD00000000000002ALL;
    v182._object = (void *)0x8000000256D53770;
    v55._countAndFlagsBits = 0x502059425241454ELL;
    v55._object = (void *)0xED0000454C504F45;
    v56._countAndFlagsBits = 0;
    v56._object = (void *)0xE000000000000000;
    Swift::String v57 = NSLocalizedString(_:tableName:bundle:value:comment:)(v55, (Swift::String_optional)0, (NSBundle)v54, v56, v182);

    id v58 = objc_allocWithZone(MEMORY[0x263F089B8]);
    v59 = (void *)MEMORY[0x25A2AF5D0](v57._countAndFlagsBits, v57._object);
    swift_bridgeObjectRelease();
    id v60 = objc_msgSend(v58, sel_initWithString_, v59);

    objc_msgSend(v53, sel_setAttributedText_, v60);
    id v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), sel_init);
    id v169 = v61;
    id v62 = objc_msgSend(v36, (SEL)0x265425F25, v45);
    v183._countAndFlagsBits = 0xD000000000000037;
    v183._object = (void *)0x8000000256D53880;
    v63._object = (void *)0x8000000256D537A0;
    v63._countAndFlagsBits = 0x10000000000000DELL;
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    Swift::String v65 = NSLocalizedString(_:tableName:bundle:value:comment:)(v63, (Swift::String_optional)0, (NSBundle)v62, v64, v183);

    id v66 = objc_allocWithZone(MEMORY[0x263F089B8]);
    v67 = (void *)MEMORY[0x25A2AF5D0](v65._countAndFlagsBits, v65._object);
    swift_bridgeObjectRelease();
    id v68 = objc_msgSend(v66, (SEL)0x265425E98, v67);

    objc_msgSend(v61, sel_setAttributedText_, v68);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AppSettingsOptionGroup>);
    uint64_t v174 = swift_allocObject();
    *(_OWORD *)(v174 + 16) = xmmword_256D51160;
    v167[1] = (id)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AppSetting>);
    uint64_t v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_256D51170;
    id v70 = objc_msgSend(v36, (SEL)0x265425F25, v45);
    v184._countAndFlagsBits = 0xD000000000000043;
    v184._object = (void *)0x8000000256D53230;
    v71._countAndFlagsBits = 0x7974697669746341;
    v71._object = (void *)0xE800000000000000;
    v72._countAndFlagsBits = 0;
    v72._object = (void *)0xE000000000000000;
    Swift::String v73 = NSLocalizedString(_:tableName:bundle:value:comment:)(v71, (Swift::String_optional)0, (NSBundle)v70, v72, v184);

    id v74 = objc_msgSend(v36, (SEL)0x265425F25, v45);
    v185._countAndFlagsBits = 0xD00000000000004CLL;
    v185._object = (void *)0x8000000256D538E0;
    v75._object = (void *)0x8000000256D538C0;
    v75._countAndFlagsBits = 0xD00000000000001ALL;
    v76._countAndFlagsBits = 0;
    v76._object = (void *)0xE000000000000000;
    Swift::String v77 = NSLocalizedString(_:tableName:bundle:value:comment:)(v75, (Swift::String_optional)0, (NSBundle)v74, v76, v185);

    id v177 = self;
    id v78 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v74) = objc_msgSend(v78, sel_getStateForSetting_, 1);

    *(Swift::String *)(v69 + 32) = v73;
    *(Swift::String *)(v69 + 48) = v77;
    *(unsigned char *)(v69 + 64) = (_BYTE)v74;
    *(_OWORD *)(v69 + 72) = xmmword_256D51180;
    id v79 = objc_msgSend(v36, sel_bundleForClass_, v45);
    v186._countAndFlagsBits = 0xD000000000000046;
    v186._object = (void *)0x8000000256D53280;
    v80._countAndFlagsBits = 0x616964654DLL;
    v80._object = (void *)0xE500000000000000;
    v81._countAndFlagsBits = 0;
    v81._object = (void *)0xE000000000000000;
    Swift::String v82 = NSLocalizedString(_:tableName:bundle:value:comment:)(v80, (Swift::String_optional)0, (NSBundle)v79, v81, v186);

    id v83 = objc_msgSend(v36, sel_bundleForClass_, v45);
    v84._countAndFlagsBits = 0xD000000000000021;
    v187._countAndFlagsBits = 0xD000000000000028;
    v187._object = (void *)0x8000000256D53960;
    v84._object = (void *)0x8000000256D53930;
    v85._countAndFlagsBits = 0;
    v85._object = (void *)0xE000000000000000;
    Swift::String v86 = NSLocalizedString(_:tableName:bundle:value:comment:)(v84, (Swift::String_optional)0, (NSBundle)v83, v85, v187);

    id v87 = v177;
    id v88 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v53) = objc_msgSend(v88, sel_getStateForSetting_, 2);

    *(Swift::String *)(v69 + 88) = v82;
    *(Swift::String *)(v69 + 104) = v86;
    *(unsigned char *)(v69 + 120) = (_BYTE)v53;
    *(_OWORD *)(v69 + 128) = xmmword_256D51190;
    uint64_t v89 = v178;
    id v90 = objc_msgSend(v36, sel_bundleForClass_, v178);
    v188._countAndFlagsBits = 0xD000000000000065;
    v188._object = (void *)0x8000000256D532D0;
    v91._countAndFlagsBits = 0x73746361746E6F43;
    v91._object = (void *)0xE800000000000000;
    v92._countAndFlagsBits = 0;
    v92._object = (void *)0xE000000000000000;
    Swift::String v93 = NSLocalizedString(_:tableName:bundle:value:comment:)(v91, (Swift::String_optional)0, (NSBundle)v90, v92, v188);

    id v94 = objc_msgSend(v36, (SEL)0x265425F25, v89);
    v95._countAndFlagsBits = 0xD00000000000001BLL;
    v167[0] = (id)0xD00000000000001BLL;
    v189._countAndFlagsBits = 0xD000000000000034;
    v189._object = (void *)0x8000000256D539B0;
    v95._object = (void *)0x8000000256D53990;
    v96._countAndFlagsBits = 0;
    v96._object = (void *)0xE000000000000000;
    Swift::String v97 = NSLocalizedString(_:tableName:bundle:value:comment:)(v95, (Swift::String_optional)0, (NSBundle)v94, v96, v189);

    id v98 = objc_msgSend(v87, sel_sharedInstance);
    LOBYTE(v45) = objc_msgSend(v98, sel_getStateForSetting_, 3);

    *(Swift::String *)(v69 + 144) = v93;
    *(Swift::String *)(v69 + 160) = v97;
    *(unsigned char *)(v69 + 176) = v45;
    *(_OWORD *)(v69 + 184) = xmmword_256D511A0;
    uint64_t v99 = v178;
    id v100 = objc_msgSend(v36, (SEL)0x265425F25, v178);
    v190._countAndFlagsBits = 0xD000000000000039;
    v190._object = (void *)0x8000000256D53340;
    v101._countAndFlagsBits = 0x736F746F6850;
    v101._object = (void *)0xE600000000000000;
    v102._countAndFlagsBits = 0;
    v102._object = (void *)0xE000000000000000;
    Swift::String v103 = NSLocalizedString(_:tableName:bundle:value:comment:)(v101, (Swift::String_optional)0, (NSBundle)v100, v102, v190);

    id v104 = objc_msgSend(v36, (SEL)0x265425F25, v99);
    v105._countAndFlagsBits = 0xD000000000000024;
    v191._countAndFlagsBits = 0xD000000000000047;
    v191._object = (void *)0x8000000256D53A20;
    v105._object = (void *)0x8000000256D539F0;
    v106._countAndFlagsBits = 0;
    v106._object = (void *)0xE000000000000000;
    Swift::String v107 = NSLocalizedString(_:tableName:bundle:value:comment:)(v105, (Swift::String_optional)0, (NSBundle)v104, v106, v191);

    id v108 = objc_msgSend(v87, sel_sharedInstance);
    LOBYTE(v45) = objc_msgSend(v108, sel_getStateForSetting_, 4);

    *(Swift::String *)(v69 + 200) = v103;
    *(Swift::String *)(v69 + 216) = v107;
    *(unsigned char *)(v69 + 232) = v45;
    *(_OWORD *)(v69 + 240) = xmmword_256D511B0;
    id v109 = objc_msgSend(v36, sel_bundleForClass_, v99);
    v110._countAndFlagsBits = 0xD000000000000015;
    v192._countAndFlagsBits = 0xD00000000000004FLL;
    v192._object = (void *)0x8000000256D533A0;
    v110._object = (void *)0x8000000256D53380;
    v111._countAndFlagsBits = 0;
    v111._object = (void *)0xE000000000000000;
    Swift::String v112 = NSLocalizedString(_:tableName:bundle:value:comment:)(v110, (Swift::String_optional)0, (NSBundle)v109, v111, v192);

    v113 = v36;
    v114 = v36;
    uint64_t v115 = v99;
    id v116 = objc_msgSend(v113, sel_bundleForClass_, v99);
    v193._countAndFlagsBits = 0xD000000000000041;
    v193._object = (void *)0x8000000256D53A90;
    v117._object = (void *)0x8000000256D53A70;
    v117._countAndFlagsBits = (uint64_t)v167[0];
    v118._countAndFlagsBits = 0;
    v118._object = (void *)0xE000000000000000;
    Swift::String v119 = NSLocalizedString(_:tableName:bundle:value:comment:)(v117, (Swift::String_optional)0, (NSBundle)v116, v118, v193);

    id v120 = v177;
    id v121 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v53) = objc_msgSend(v121, sel_getStateForSetting_, 5);

    *(Swift::String *)(v69 + 256) = v112;
    *(Swift::String *)(v69 + 272) = v119;
    *(unsigned char *)(v69 + 288) = (_BYTE)v53;
    *(void *)(v69 + 296) = 0x6E6F697461636F6CLL;
    *(void *)(v69 + 304) = 0xE900000000000073;
    id v122 = objc_msgSend(v114, sel_bundleForClass_, v99);
    v194._countAndFlagsBits = 0xD000000000000048;
    v194._object = (void *)0x8000000256D533F0;
    v123._countAndFlagsBits = 0x666F206574617453;
    v123._object = (void *)0xED0000646E694D20;
    v124._countAndFlagsBits = 0;
    v124._object = (void *)0xE000000000000000;
    Swift::String v125 = NSLocalizedString(_:tableName:bundle:value:comment:)(v123, (Swift::String_optional)0, (NSBundle)v122, v124, v194);

    id v126 = objc_msgSend(v114, sel_bundleForClass_, v99);
    v195._countAndFlagsBits = 0xD00000000000003FLL;
    v195._object = (void *)0x8000000256D53B00;
    v127._object = (void *)0x8000000256D53AE0;
    v127._countAndFlagsBits = 0xD00000000000001ALL;
    v128._countAndFlagsBits = 0;
    v128._object = (void *)0xE000000000000000;
    Swift::String v129 = NSLocalizedString(_:tableName:bundle:value:comment:)(v127, (Swift::String_optional)0, (NSBundle)v126, v128, v195);

    id v130 = objc_msgSend(v120, sel_sharedInstance);
    LOBYTE(v53) = objc_msgSend(v130, sel_getStateForSetting_, 9);

    *(Swift::String *)(v69 + 312) = v125;
    *(Swift::String *)(v69 + 328) = v129;
    *(unsigned char *)(v69 + 344) = (_BYTE)v53;
    *(_OWORD *)(v69 + 352) = xmmword_256D511C0;
    v131 = (void *)v168;
    id v132 = (id)v168;
    v167[0] = v132;
    uint64_t v133 = specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(v69, v131, v175);
    uint64_t v135 = v134;
    uint64_t v137 = v136;

    uint64_t v138 = v174;
    *(void *)(v174 + 32) = v133;
    *(void *)(v138 + 40) = v135;
    *(void *)(v138 + 48) = v137;
    uint64_t v139 = swift_allocObject();
    long long v168 = xmmword_256D511D0;
    *(_OWORD *)(v139 + 16) = xmmword_256D511D0;
    id v140 = objc_msgSend(v114, sel_bundleForClass_, v115);
    v141._countAndFlagsBits = 0xD000000000000012;
    v196._countAndFlagsBits = 0xD000000000000045;
    v196._object = (void *)0x8000000256D53B40;
    v141._object = (void *)0x8000000256D53440;
    v142._countAndFlagsBits = 0;
    v142._object = (void *)0xE000000000000000;
    Swift::String v143 = NSLocalizedString(_:tableName:bundle:value:comment:)(v141, (Swift::String_optional)0, (NSBundle)v140, v142, v196);

    id v144 = objc_msgSend(v120, sel_sharedInstance);
    LOBYTE(v61) = objc_msgSend(v144, sel_getStateForSetting_, 10);

    *(Swift::String *)(v139 + 32) = v143;
    *(void *)(v139 + 48) = 0;
    *(void *)(v139 + 56) = 0;
    *(unsigned char *)(v139 + 64) = (_BYTE)v61;
    *(_OWORD *)(v139 + 72) = xmmword_256D511E0;
    v145 = self;
    uint64_t v146 = *MEMORY[0x263F835B8];
    id v147 = v170;
    id v148 = v170;
    id v149 = objc_msgSend(v145, sel_preferredFontForTextStyle_, v146);
    objc_msgSend(v148, sel_setFont_, v149);

    objc_msgSend(v148, sel_setEditable_, 0);
    objc_msgSend(v148, sel_setSelectable_, 1);
    objc_msgSend(v148, sel_setScrollEnabled_, 0);
    objc_msgSend(v148, sel_setDataDetectorTypes_, -1);

    v150 = (void *)v174;
    *(void *)(v174 + 56) = v139;
    v150[8] = 0;
    v150[9] = v147;
    v151 = v150;
    uint64_t v152 = swift_allocObject();
    *(_OWORD *)(v152 + 16) = v168;
    id v153 = objc_msgSend(v176, sel_bundleForClass_, v115);
    v154._countAndFlagsBits = 0xD000000000000020;
    v197._countAndFlagsBits = 0xD00000000000004ELL;
    v197._object = (void *)0x8000000256D53B90;
    v154._object = (void *)0x8000000256D53460;
    v155._countAndFlagsBits = 0;
    v155._object = (void *)0xE000000000000000;
    Swift::String v156 = NSLocalizedString(_:tableName:bundle:value:comment:)(v154, (Swift::String_optional)0, (NSBundle)v153, v155, v197);

    id v157 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v147) = objc_msgSend(v157, sel_getStateForSetting_, 6);

    *(Swift::String *)(v152 + 32) = v156;
    *(void *)(v152 + 48) = 0;
    *(void *)(v152 + 56) = 0;
    *(unsigned char *)(v152 + 64) = (_BYTE)v147;
    *(void *)(v152 + 72) = 0xD000000000000013;
    *(void *)(v152 + 80) = 0x8000000256D53BE0;
    id v158 = v171;
    id v159 = v171;
    id v160 = v169;
    id v161 = v169;
    uint64_t v162 = specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(v152, v158, v160);
    uint64_t v164 = v163;
    uint64_t v166 = v165;

    v151[10] = v162;
    v151[11] = v164;
    v151[12] = v166;

    return v151;
  }
  uint64_t result = objc_msgSend(v4, sel_privacyFlow);
  if (result)
  {
    v13 = result;
    id v14 = objc_msgSend(result, sel_localizedButtonTitle);

    if (v14)
    {
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v9 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      unint64_t v9 = 0xE000000000000000;
    }
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

void MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(coder:)()
{
  uint64_t v1 = objc_allocWithZone(v0);
  uint64_t v2 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager;
  *(void *)&v1[v2] = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate] = 0;
  v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion] = 0;
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton] = 0;
  v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled] = 0;
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight] = 0;
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint] = 0;
  uint64_t v3 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings;
  *(void *)&v1[v3] = closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void MOSuggestionSheetOnboardingSettingsViewController.init(coder:)()
{
  uint64_t v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager;
  *(void *)&v0[v1] = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate] = 0;
  v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion] = 0;
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton] = 0;
  v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled] = 0;
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight] = 0;
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint] = 0;
  uint64_t v2 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings;
  *(void *)&v0[v2] = closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return MOSuggestionSheetOnboardingSettingsViewController.init()();
}

id MOSuggestionSheetOnboardingSettingsViewController.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager;
  uint64_t v2 = self;
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_sharedInstance);
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate] = 0;
  v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion] = 0;
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton] = 0;
  v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled] = 0;
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight] = 0;
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint] = 0;
  uint64_t v4 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings;
  *(void *)&v3[v4] = closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings();

  v5 = (objc_class *)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v27._countAndFlagsBits = 0xD00000000000004ALL;
  v27._object = (void *)0x8000000256D52D60;
  v9._object = (void *)0x8000000256D52D40;
  v9._countAndFlagsBits = 0xD000000000000015;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  Swift::String v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v27);

  v12 = (void *)MEMORY[0x25A2AF5D0](v11._countAndFlagsBits, v11._object);
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v28._countAndFlagsBits = 0xD00000000000003FLL;
  v14._countAndFlagsBits = 0xD000000000000041;
  v28._object = (void *)0x8000000256D52E00;
  v14._object = (void *)0x8000000256D52DB0;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  Swift::String v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v28);

  uint64_t v17 = (void *)MEMORY[0x25A2AF5D0](v16._countAndFlagsBits, v16._object);
  swift_bridgeObjectRelease();
  v26.receiver = v3;
  v26.super_class = v5;
  id v18 = objc_msgSendSuper2(&v26, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v12, v17, 0, 0);

  id v19 = v18;
  id result = objc_msgSend(v19, sel_view);
  if (result)
  {
    uint64_t v21 = result;
    id v22 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v21, sel_setBackgroundColor_, v22);

    id v23 = objc_allocWithZone(MEMORY[0x263F82C78]);
    id v24 = v19;
    id v25 = objc_msgSend(v23, sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v24, sel_setTableView_, v25);

    MOSuggestionSheetOnboardingSettingsViewController.loadSettingsController()();
    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController()
{
  return self;
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v27.receiver = v1;
  v27.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  objc_msgSendSuper2(&v27, sel_viewDidAppear_, a1);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_init);
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v1) + 0xE8))(v3);
  v6 = *(uint64_t (**)(void))((*v4 & *v1) + 0xE0);
  uint64_t v7 = ((uint64_t (*)(uint64_t))v6)(v5);
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    v28._object = (void *)0x8000000256D52E40;
    v11._countAndFlagsBits = 1801675074;
    v11._object = (void *)0xE400000000000000;
    v12._countAndFlagsBits = 0;
    v12._object = (void *)0xE000000000000000;
    v28._countAndFlagsBits = 0xD000000000000038;
    Swift::String v13 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v28);

    Swift::String v14 = (void *)MEMORY[0x25A2AF5D0](v13._countAndFlagsBits, v13._object);
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setTitle_, v14);
  }
  id v15 = objc_msgSend(v1, sel_contentView);
  Swift::String v16 = self;
  id v17 = objc_msgSend(v16, sel_systemBlueColor);
  objc_msgSend(v15, sel_setTintColor_, v17);

  id v18 = objc_msgSend(v1, sel_navigationController);
  if (v18)
  {
    id v19 = v18;
    id v20 = objc_msgSend(v18, sel_navigationBar);

    id v21 = objc_msgSend(v20, sel_backItem);
    if (v21)
    {
      id v22 = (void *)v6();
      objc_msgSend(v21, sel_setBackBarButtonItem_, v22);
    }
  }
  id v23 = objc_msgSend(v1, sel_navigationController);
  if (v23)
  {
    id v24 = v23;
    id v25 = objc_msgSend(v23, sel_navigationBar);

    id v26 = objc_msgSend(v16, sel_systemBlueColor);
    objc_msgSend(v25, sel_setTintColor_, v26);
  }
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()()
{
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.viewDidLayoutSubviews()()
{
  uint64_t v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight;
  double v2 = *(double *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight];
  id v3 = objc_msgSend(v0, sel_tableView);
  if (!v3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_contentSize);
  double v6 = v5;

  if (v2 == v6)
  {
LABEL_9:
    v32.receiver = v0;
    v32.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
    objc_msgSendSuper2(&v32, sel_viewDidLayoutSubviews);
    return;
  }
  id v7 = objc_msgSend(v0, sel_tableView);
  if (!v7) {
    goto LABEL_16;
  }
  id v8 = v7;
  objc_msgSend(v7, sel_contentSize);
  uint64_t v10 = v9;

  *(void *)&v0[v1] = v10;
  id v11 = objc_msgSend(v0, sel_tableView);
  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  Swift::String v12 = v11;
  objc_msgSend(v11, sel_reloadData);

  id v13 = objc_msgSend(v0, sel_view);
  if (!v13)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  Swift::String v14 = v13;
  objc_msgSend(v13, sel_layoutIfNeeded);

  uint64_t v15 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint;
  Swift::String v16 = *(void **)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint];
  if (v16) {
    goto LABEL_7;
  }
  id v22 = objc_msgSend(v0, sel_tableView);
  if (!v22)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v23 = v22;
  id v24 = objc_msgSend(v22, sel_heightAnchor);

  id v25 = objc_msgSend(v0, sel_tableView);
  if (v25)
  {
    id v26 = v25;
    objc_msgSend(v25, sel_contentSize);
    double v28 = v27;

    id v29 = objc_msgSend(v24, sel_constraintEqualToConstant_, v28);
    id v30 = *(void **)&v0[v15];
    *(void *)&v0[v15] = v29;

    uint64_t v31 = *(void **)&v0[v15];
    if (!v31) {
      goto LABEL_9;
    }
    objc_msgSend(v31, sel_setActive_, 1);
    Swift::String v16 = *(void **)&v0[v15];
    if (!v16) {
      goto LABEL_9;
    }
LABEL_7:
    id v17 = v16;
    id v18 = objc_msgSend(v0, sel_tableView);
    if (v18)
    {
      id v19 = v18;
      objc_msgSend(v18, sel_contentSize);
      double v21 = v20;

      objc_msgSend(v17, sel_setConstant_, v21);
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_21:
  __break(1u);
}

void MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(void *a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(v3, sel_tableView);
  if (v10)
  {
    id v11 = v10;
    MEMORY[0x25A2AF4C0](objc_msgSend(a1, sel_tag), a2);
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    id v13 = objc_msgSend(v11, sel_cellForRowAtIndexPath_, isa);

    if (v13)
    {
      type metadata accessor for SwitchCell();
      Swift::String v14 = (void *)swift_dynamicCastClass();
      if (v14)
      {
        uint64_t v15 = (void (*)(id))(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v14) + 0x58))();
        if (v15)
        {
          uint64_t v16 = (uint64_t)v15;
          v15(objc_msgSend(a1, sel_isOn));
          outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(v16);
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void MOSuggestionSheetOnboardingSettingsViewController.setSelectionValue(settingsType:isSwitchOn:)(uint64_t a1, void *a2, char a3)
{
  if (!a2) {
    return;
  }
  type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v8 = self;
  id v9 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v76._countAndFlagsBits = 0xD000000000000043;
  v76._object = (void *)0x8000000256D53230;
  v10._countAndFlagsBits = 0x7974697669746341;
  v10._object = (void *)0xE800000000000000;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  Swift::String v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v76);

  if (v12._countAndFlagsBits == a1 && v12._object == a2)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    id v19 = self;
    id v20 = objc_msgSend(v19, sel_sharedInstance);
    unsigned int v21 = objc_msgSend(v20, sel_getStateForSetting_, 1);

    if (v21 && (a3 & 1) == 0) {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
    }
    id v74 = objc_msgSend(v19, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 1);
    goto LABEL_15;
  }
  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v14) {
    goto LABEL_11;
  }
  id v15 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v77._countAndFlagsBits = 0xD000000000000046;
  v77._object = (void *)0x8000000256D53280;
  v16._countAndFlagsBits = 0x616964654DLL;
  v16._object = (void *)0xE500000000000000;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  Swift::String v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v77);

  if (v18._countAndFlagsBits == a1 && v18._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v22)
  {
LABEL_19:
    id v23 = self;
    id v24 = objc_msgSend(v23, sel_sharedInstance);
    unsigned int v25 = objc_msgSend(v24, sel_getStateForSetting_, 2);

    if (v25 && (a3 & 1) == 0) {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
    }
    id v74 = objc_msgSend(v23, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 2);
    goto LABEL_15;
  }
  id v26 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v78._countAndFlagsBits = 0xD000000000000065;
  v78._object = (void *)0x8000000256D532D0;
  v27._countAndFlagsBits = 0x73746361746E6F43;
  v27._object = (void *)0xE800000000000000;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  Swift::String v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v78);

  if (v29._countAndFlagsBits == a1 && v29._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v30)
  {
LABEL_27:
    uint64_t v31 = self;
    id v32 = objc_msgSend(v31, sel_sharedInstance);
    unsigned int v33 = objc_msgSend(v32, sel_getStateForSetting_, 3);

    if (v33 && (a3 & 1) == 0) {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
    }
    id v74 = objc_msgSend(v31, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 3);
    goto LABEL_15;
  }
  id v34 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v79._countAndFlagsBits = 0xD000000000000039;
  v79._object = (void *)0x8000000256D53340;
  v35._countAndFlagsBits = 0x736F746F6850;
  v35._object = (void *)0xE600000000000000;
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  Swift::String v37 = NSLocalizedString(_:tableName:bundle:value:comment:)(v35, (Swift::String_optional)0, (NSBundle)v34, v36, v79);

  if (v37._countAndFlagsBits == a1 && v37._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v38)
  {
LABEL_35:
    Swift::String v39 = self;
    id v40 = objc_msgSend(v39, sel_sharedInstance);
    unsigned int v41 = objc_msgSend(v40, sel_getStateForSetting_, 4);

    if (v41 && (a3 & 1) == 0) {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
    }
    id v74 = objc_msgSend(v39, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 4);
    goto LABEL_15;
  }
  id v42 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v43._countAndFlagsBits = 0xD000000000000015;
  v80._countAndFlagsBits = 0xD00000000000004FLL;
  v80._object = (void *)0x8000000256D533A0;
  v43._object = (void *)0x8000000256D53380;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  Swift::String v45 = NSLocalizedString(_:tableName:bundle:value:comment:)(v43, (Swift::String_optional)0, (NSBundle)v42, v44, v80);

  if (v45._countAndFlagsBits == a1 && v45._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v46)
  {
LABEL_43:
    Swift::String v47 = self;
    id v48 = objc_msgSend(v47, sel_sharedInstance);
    unsigned int v49 = objc_msgSend(v48, sel_getStateForSetting_, 5);

    if (v49 && (a3 & 1) == 0) {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
    }
    id v74 = objc_msgSend(v47, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 5);
    goto LABEL_15;
  }
  id v50 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v81._object = (void *)0x8000000256D533F0;
  v51._countAndFlagsBits = 0x666F206574617453;
  v51._object = (void *)0xED0000646E694D20;
  v52._countAndFlagsBits = 0;
  v52._object = (void *)0xE000000000000000;
  v81._countAndFlagsBits = 0xD000000000000048;
  Swift::String v53 = NSLocalizedString(_:tableName:bundle:value:comment:)(v51, (Swift::String_optional)0, (NSBundle)v50, v52, v81);

  if (v53._countAndFlagsBits == a1 && v53._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  char v54 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v54)
  {
LABEL_51:
    Swift::String v55 = self;
    id v56 = objc_msgSend(v55, sel_sharedInstance);
    unsigned int v57 = objc_msgSend(v56, sel_getStateForSetting_, 9);

    if (v57 && (a3 & 1) == 0) {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
    }
    id v74 = objc_msgSend(v55, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 9);
    goto LABEL_15;
  }
  id v58 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v59._countAndFlagsBits = 0xD000000000000012;
  v82._object = (void *)0x8000000256D533F0;
  v59._object = (void *)0x8000000256D53440;
  v60._countAndFlagsBits = 0;
  v60._object = (void *)0xE000000000000000;
  v82._countAndFlagsBits = 0xD000000000000048;
  Swift::String v61 = NSLocalizedString(_:tableName:bundle:value:comment:)(v59, (Swift::String_optional)0, (NSBundle)v58, v60, v82);

  if (v61._countAndFlagsBits == a1 && v61._object == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v62 & 1) == 0)
    {
      id v66 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
      v67._countAndFlagsBits = 0xD000000000000020;
      v83._countAndFlagsBits = 0xD000000000000042;
      v83._object = (void *)0x8000000256D53490;
      v67._object = (void *)0x8000000256D53460;
      v68._countAndFlagsBits = 0;
      v68._object = (void *)0xE000000000000000;
      Swift::String v69 = NSLocalizedString(_:tableName:bundle:value:comment:)(v67, (Swift::String_optional)0, (NSBundle)v66, v68, v83);

      if (v69._countAndFlagsBits == a1 && v69._object == a2)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v70 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v70 & 1) == 0) {
          return;
        }
      }
      Swift::String v71 = self;
      id v72 = objc_msgSend(v71, sel_sharedInstance);
      unsigned int v73 = objc_msgSend(v72, sel_getStateForSetting_, 6);

      if (v73 && (a3 & 1) == 0) {
        (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
      }
      id v74 = objc_msgSend(v71, sel_sharedInstance);
      objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 6);
      goto LABEL_15;
    }
  }
  Swift::String v63 = self;
  id v64 = objc_msgSend(v63, sel_sharedInstance);
  unsigned int v65 = objc_msgSend(v64, sel_getStateForSetting_, 10);

  if (v65 && (a3 & 1) == 0) {
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x100))(1);
  }
  id v74 = objc_msgSend(v63, sel_sharedInstance);
  objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 10);
LABEL_15:
}

void MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  double v5 = (void *)MEMORY[0x25A2AF5D0](0xD000000000000026, 0x8000000256D52E80);
  id v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v9[4] = partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:);
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v9[3] = &block_descriptor;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_requestAuthorizationWithOptions_completionHandler_, 6, v8);

  _Block_release(v8);
}

void thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void MOSuggestionSheetOnboardingSettingsViewController.loadSettingsController()()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  double v2 = self;
  id v3 = objc_msgSend(v2, sel_systemBackgroundColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v3);

  id v4 = objc_msgSend(v0, sel_tableView);
  if (!v4)
  {
    __break(1u);
    goto LABEL_25;
  }
  double v5 = v4;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v5, sel_setTableHeaderView_, v6);

  id v7 = objc_msgSend(v0, sel_tableView);
  if (!v7)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, sel_setDelegate_, v0);

  id v9 = objc_msgSend(v0, sel_tableView);
  if (!v9)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  Swift::String v10 = v9;
  objc_msgSend(v9, sel_setDataSource_, v0);

  id v11 = objc_msgSend(v0, sel_tableView);
  if (!v11)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  Swift::String v12 = v11;
  id v13 = objc_msgSend(v2, sel_clearColor);
  objc_msgSend(v12, sel_setBackgroundColor_, v13);

  id v14 = objc_msgSend(v0, sel_tableView);
  if (!v14)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v15 = v14;
  objc_msgSend(v14, sel_setShowsVerticalScrollIndicator_, 0);

  id v16 = objc_msgSend(v0, sel_tableView);
  if (!v16)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  Swift::String v17 = v16;
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v18 = objc_msgSend(v0, sel_tableView);
  if (!v18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v19 = v18;
  id v20 = objc_msgSend(v18, sel_layer);

  objc_msgSend(v20, sel_setCornerRadius_, 10.0);
  id v21 = objc_msgSend(v0, sel_tableView);
  if (!v21)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  char v22 = v21;
  objc_msgSend(v21, sel_setAutomaticallyAdjustsScrollIndicatorInsets_, 0);

  id v23 = objc_msgSend(v0, sel_tableView);
  if (!v23)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v24 = v23;
  objc_msgSend(v23, sel_setContentInsetAdjustmentBehavior_, 2);

  id v25 = objc_msgSend(v0, sel_view);
  if (!v25)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  id v26 = v25;
  objc_msgSend(v25, sel_bounds);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v79.origin.x = v28;
  v79.origin.y = v30;
  v79.size.width = v32;
  v79.size.height = v34;
  CGFloat Width = CGRectGetWidth(v79);
  id v36 = objc_msgSend(v0, sel_view);
  if (!v36)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  Swift::String v37 = v36;
  objc_msgSend(v36, sel_bounds);
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;

  v80.origin.x = v39;
  v80.origin.y = v41;
  v80.size.width = v43;
  v80.size.height = v45;
  CGFloat Height = CGRectGetHeight(v80);
  id v47 = objc_msgSend(v0, sel_tableView);
  if (!v47)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v48 = v47;
  id v49 = objc_msgSend(v0, sel_view);
  if (!v49)
  {
LABEL_36:
    __break(1u);
    return;
  }
  id v50 = v49;
  objc_msgSend(v49, sel_bounds);
  CGFloat v52 = v51;
  CGFloat v54 = v53;

  v81.origin.x = v52;
  v81.origin.y = v54;
  v81.size.width = Width;
  v81.size.height = Height;
  CGRect v82 = CGRectOffset(v81, 0.0, 16.0);
  objc_msgSend(v48, sel_setFrame_, v82.origin.x, v82.origin.y, v82.size.width, v82.size.height);

  type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v56 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v78._countAndFlagsBits = 0xD00000000000002DLL;
  v78._object = (void *)0x8000000256D53580;
  v57._object = (void *)0x8000000256D53560;
  v57._countAndFlagsBits = 0xD00000000000001ELL;
  v58._countAndFlagsBits = 0;
  v58._object = (void *)0xE000000000000000;
  Swift::String v59 = NSLocalizedString(_:tableName:bundle:value:comment:)(v57, (Swift::String_optional)0, (NSBundle)v56, v58, v78);

  id v60 = objc_msgSend(self, sel_boldButton);
  Swift::String v61 = (void *)MEMORY[0x263F8EED0];
  uint64_t v62 = (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))(v60);
  Swift::String v63 = *(uint64_t (**)(void))((*v61 & *v0) + 0xC8);
  uint64_t v64 = ((uint64_t (*)(uint64_t))v63)(v62);
  if (!v64)
  {
    uint64_t v75 = swift_bridgeObjectRelease();
    Swift::String v67 = (void *)((uint64_t (*)(uint64_t))v63)(v75);
    if (!v67) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  unsigned int v65 = (void *)v64;
  id v66 = (void *)MEMORY[0x25A2AF5D0](v59._countAndFlagsBits, v59._object);
  swift_bridgeObjectRelease();
  objc_msgSend(v65, sel_setTitle_forState_, v66, 0);

  Swift::String v67 = (void *)v63();
  if (v67)
  {
LABEL_16:
    Swift::String v68 = v67;
    objc_msgSend(v67, sel_addTarget_action_forControlEvents_, v0, sel_completeOnboardingTapped, 64);
  }
LABEL_17:
  id v69 = objc_msgSend(v0, sel_buttonTray);
  id v70 = objc_msgSend(v2, sel_systemBlueColor);
  objc_msgSend(v69, sel_setTintColor_, v70);

  uint64_t v71 = v63();
  if (v71)
  {
    id v72 = (void *)v71;
    id v73 = objc_msgSend(v0, sel_buttonTray);
    objc_msgSend(v73, sel_addButton_, v72);
  }
  id v74 = objc_msgSend(v0, sel_buttonTray);
  id v76 = objc_msgSend(v2, sel_systemBackgroundColor);
  objc_msgSend(v74, sel_setBackgroundColor_, v76);
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  id v1 = v0;
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    double v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_256D32000, v3, v4, "[MOSuggestionSheetOnboardingSettingsViewController] Turn on Journaling Suggestions tapped", v5, 2u);
    MEMORY[0x25A2AFF90](v5, -1, -1);
  }

  id v6 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xB0))() & 1) == 0)
  {
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_256D32000, v7, v8, "[MOSuggestionSheetOnboardingSettingsViewController] Haven't tapped Turn on Journaling Suggestions before; procee"
        "d with sheet dismissal",
        v9,
        2u);
      MEMORY[0x25A2AFF90](v9, -1, -1);
    }

    uint64_t v10 = (*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xB8))(1);
    id v11 = (void *)(*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xC8))(v10);
    if (v11)
    {
      Swift::String v12 = v11;
      objc_msgSend(v11, sel_setEnabled_, 0);
    }
    id v13 = objc_msgSend(v1, sel_navigationController);
    if (v13)
    {
      id v14 = v13;
      id v15 = objc_msgSend(v13, sel_navigationBar);

      objc_msgSend(v15, sel_setUserInteractionEnabled_, 0);
    }
    objc_msgSend(*(id *)((char *)v1+ OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager), sel_setOnboardingFlowCompletionStatus_, 2);
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v1;
    Swift::String v17 = *(void (**)(uint64_t (*)(), uint64_t))((*v6 & *v1) + 0x178);
    id v18 = v1;
    v17(partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped(), v16);
    swift_release();
  }
}

uint64_t closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UIFont(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  os_log_type_t v8 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped();
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_22;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x25A2AF6A0](0, v7, v3, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x25A2AFFF0](v1);
  id v3 = (void *)MEMORY[0x263F8EED0];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x98))();

    if (v5)
    {
      objc_msgSend(v5, sel_shouldDismissOnboarding);
      swift_unknownObjectRelease();
    }
  }
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x25A2AFFF0](v1);
  if (v6)
  {
    id v7 = v6;
    char v8 = (*(uint64_t (**)(void))((*v3 & *v6) + 0xF8))();

    if (v8)
    {
      id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F56580]), sel_init);
      uint64_t v10 = (void *)MEMORY[0x25A2AF5D0](0xD00000000000002ALL, 0x8000000256D53510);
      v12[4] = closure #1 in closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped();
      v12[5] = 0;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 1107296256;
      v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
      v12[3] = &block_descriptor_25;
      id v11 = _Block_copy(v12);
      objc_msgSend(v9, sel_triggerFeedbackAssistantFlow_handler_, v10, v11);
      _Block_release(v11);
    }
  }
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = (void *)MEMORY[0x25A2AF5D0]();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    Swift::String v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = 0;
    goto LABEL_6;
  }
  Swift::String v12 = (void *)MEMORY[0x25A2AF5D0](a3, a4);
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v13 = (void *)MEMORY[0x25A2AF5D0](a5, a6);
  swift_bridgeObjectRelease();
LABEL_6:
  id v14 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_symbolName_, v11, v12, v13);

  return v14;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:symbolName:)()
{
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:icon:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = (void *)MEMORY[0x25A2AF5D0]();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v11 = (void *)MEMORY[0x25A2AF5D0](a3, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = 0;
  }
  id v12 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_icon_, v10, v11, a5);

  return v12;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:icon:)()
{
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:symbolName:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  char v8 = v7;
  id v14 = (void *)MEMORY[0x25A2AF5D0]();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v15 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  id v15 = (void *)MEMORY[0x25A2AF5D0](a3, a4);
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = (void *)MEMORY[0x25A2AF5D0](a5, a6);
  swift_bridgeObjectRelease();
LABEL_6:
  id v17 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v14, v15, v16, a7 & 1);

  return v17;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:symbolName:adoptTableViewScrollView:)()
{
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:icon:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  id v7 = v6;
  id v12 = (void *)MEMORY[0x25A2AF5D0]();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v13 = (void *)MEMORY[0x25A2AF5D0](a3, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v12, v13, a5, a6 & 1);

  return v14;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:icon:adoptTableViewScrollView:)()
{
}

id MOSuggestionSheetOnboardingSettingsViewController.__deallocating_deinit()
{
  return MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()((SEL *)&selRef_dealloc);
}

id MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

void one-time initialization function for margin()
{
  margin = 0x4020000000000000;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NSAttributedStringKey, UIFont>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  objc_super v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NSAttributedStringKey, Any>);
    uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v30 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v11);
    int64_t v13 = v30 + 1;
    if (!v12)
    {
      int64_t v13 = v30 + 2;
      if (v30 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v29 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v30 + 3;
        if (v30 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v29 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v30 + 4;
          if (v30 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v29 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v30 = v13;
LABEL_28:
    uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v33[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    id v15 = *(void **)&v33[0];
    *(void *)&v32[0] = v16;
    type metadata accessor for UIFont(0, &lazy cache variable for type metadata for UIFont);
    id v17 = v15;
    id v18 = v16;
    swift_dynamicCast();
    uint64_t v19 = *(void *)&v33[0];
    outlined init with take of Any((_OWORD *)((char *)v33 + 8), v31);
    outlined init with take of Any(v31, v33);
    outlined init with take of Any(v33, v32);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v20 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v19;
    uint64_t result = (uint64_t)outlined init with take of Any(v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    outlined consume of [NSAttributedStringKey : UIFont].Iterator._Variant();
    return v2;
  }
  unint64_t v12 = *(void *)(v29 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

Swift::Int __swiftcall MOSuggestionSheetOnboardingSettingsViewController.numberOfSections(in:)(UITableView *in)
{
  return *(void *)(*(void *)(v1
                               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings)
                   + 16);
}

void MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(uint64_t a1, unint64_t a2)
{
}

void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(UIView_optional *__return_ptr retstr, UITableView *_, Swift::Int viewForHeaderInSection)
{
}

id MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForRowAt:)(void *a1)
{
  return objc_msgSend(a1, sel_estimatedRowHeight);
}

void MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(uint64_t a1, unint64_t a2)
{
}

void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(UIView_optional *__return_ptr retstr, UITableView *_, Swift::Int viewForFooterInSection)
{
}

Swift::Int __swiftcall MOSuggestionSheetOnboardingSettingsViewController.tableView(_:numberOfRowsInSection:)(Swift::Int _, Swift::Int numberOfRowsInSection)
{
  if (numberOfRowsInSection < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(v2
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings);
  if (*(void *)(v3 + 16) <= (unint64_t)numberOfRowsInSection)
  {
LABEL_7:
    __break(1u);
    return _;
  }
  uint64_t v4 = *(void *)(v3 + 24 * numberOfRowsInSection + 32);
  if (v4) {
    return *(void *)(v4 + 16);
  }
  else {
    return 0;
  }
}

void *MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(uint64_t a1, uint64_t a2)
{
  return specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(a2);
}

void closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25A2AFFF0](v5);
  if (v6)
  {
    id v7 = (void *)v6;
    outlined init with take of AppSetting?(a3, (uint64_t)&v9);
    if (v10) {
      uint64_t v8 = v9;
    }
    else {
      uint64_t v8 = 0;
    }
    MOSuggestionSheetOnboardingSettingsViewController.setSelectionValue(settingsType:isSwitchOn:)(v8, v10, a1 & 1);
  }
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)()
{
  return specialized MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)();
}

uint64_t variable initialization expression of MOOnboardingNavigationController.onboardingDelegate()
{
  return 0;
}

uint64_t variable initialization expression of MOOnboardingViewController.delegate()
{
  return 0;
}

unint64_t variable initialization expression of MOOnboardingViewController.journalBundleAboutIdentifier()
{
  return 0xD00000000000001CLL;
}

uint64_t variable initialization expression of MOOnboardingViewController.hasTappedOnboardingCompletion()
{
  return 0;
}

uint64_t variable initialization expression of MOOnboardingViewController.turnOnSuggestionsButton()
{
  return 0;
}

uint64_t variable initialization expression of MOOnboardingViewController.notNowButton()
{
  return 0;
}

uint64_t variable initialization expression of SwitchCell.onSwitchChange()
{
  return 0;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x25A2AF5D0](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSAttributedStringKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSAttributedStringKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_256D47534()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:)(unsigned __int8 a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v2 + 16))((a2 == 0) & a1);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_256D475F0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  return closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSAttributedStringKey()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NSAttributedStringKey@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x25A2AF5D0](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSAttributedStringKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (void (*)(uint64_t))type metadata accessor for NSAttributedStringKey);
  uint64_t v3 = lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (void (*)(uint64_t))type metadata accessor for NSAttributedStringKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

double specialized static MOSuggestionSheetOnboardingSettingsViewController.calculateLabelHeight(width:font:text:)(void *a1, uint64_t a2, unint64_t a3, double a4)
{
  uint64_t v4 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v4 = a2 & 0xFFFFFFFFFFFFLL;
  }
  double v5 = 0.0;
  if (v4 && (a2 || a3 != 0xE000000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, UIFont)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_256D511D0;
    char v11 = (void *)*MEMORY[0x263F814F0];
    *(void *)(inited + 32) = *MEMORY[0x263F814F0];
    *(void *)(inited + 40) = a1;
    id v12 = v11;
    id v13 = a1;
    unint64_t v14 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    objc_msgSend(v13, sel_pointSize);
    uint64_t v15 = (void *)MEMORY[0x25A2AF5D0](a2, a3);
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v14);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey();
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (void (*)(uint64_t))type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_boundingRectWithSize_options_attributes_context_, 3, isa, 0, a4, 1.79769313e308);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v26.origin.x = v18;
    v26.origin.y = v20;
    v26.size.width = v22;
    v26.size.height = v24;
    return ceil(CGRectGetHeight(v26));
  }
  return v5;
}

void specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(void *)(v5 + 16) <= a1)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
LABEL_5:
    double v16 = *(double *)&margin;
    id v17 = objc_msgSend(v1, sel_font);
    if (v17)
    {
      if (!v3) {
        goto LABEL_11;
      }
    }
    else
    {
      id v17 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835B8]);
      if (!v3) {
        goto LABEL_11;
      }
    }
    id v18 = objc_msgSend(v1, sel_text);
    if (v18)
    {
      double v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v22 = v21;

LABEL_12:
      specialized static MOSuggestionSheetOnboardingSettingsViewController.calculateLabelHeight(width:font:text:)(v17, v20, v22, Width - (v16 + v16));
      swift_bridgeObjectRelease();

      return;
    }
LABEL_11:
    uint64_t v20 = 0;
    unint64_t v22 = 0xE000000000000000;
    goto LABEL_12;
  }
  uint64_t v3 = *(void **)(v5 + 24 * a1 + 40);
  id v1 = v3;
  id v6 = objc_msgSend(v2, sel_view);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_frame);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v23.origin.x = v9;
    v23.origin.y = v11;
    v23.size.width = v13;
    v23.size.height = v15;
    double Width = CGRectGetWidth(v23);
    if (one-time initialization token for margin == -1) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  __break(1u);
}

id specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(void *)(v8 + 16) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v1 = *(void **)(v8 + 24 * a1 + 40);
  if (!v1) {
    return v1;
  }
  id v3 = v1;
  id result = objc_msgSend(v2, sel_view);
  if (result)
  {
    double v10 = result;
    objc_msgSend(result, sel_bounds);
    CGFloat v4 = v11;
    CGFloat v5 = v12;
    CGFloat v6 = v13;
    CGFloat v7 = v14;

    if (one-time initialization token for margin == -1)
    {
LABEL_6:
      v18.origin.x = v4;
      v18.origin.y = v5;
      v18.size.width = v6;
      v18.size.height = v7;
      CGRect v19 = CGRectInset(v18, *(CGFloat *)&margin, *(CGFloat *)&margin);
      objc_msgSend(v3, sel_setFrame_, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

      objc_msgSend(v3, sel_setDelegate_, v2);
      CGFloat v15 = self;
      id v16 = v3;
      id v17 = objc_msgSend(v15, sel_secondaryLabelColor);
      objc_msgSend(v16, sel_setTextColor_, v17);

      return v1;
    }
LABEL_10:
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

void specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(void *)(v5 + 16) <= a1)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
LABEL_5:
    double v16 = *(double *)&margin;
    id v17 = objc_msgSend(v1, sel_font);
    if (v17)
    {
      if (!v3) {
        goto LABEL_11;
      }
    }
    else
    {
      id v17 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835B8]);
      if (!v3) {
        goto LABEL_11;
      }
    }
    id v18 = objc_msgSend(v1, sel_text);
    if (v18)
    {
      CGRect v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v22 = v21;

LABEL_12:
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 2573;
      v23._object = (void *)0xE200000000000000;
      String.append(_:)(v23);
      swift_bridgeObjectRelease();
      specialized static MOSuggestionSheetOnboardingSettingsViewController.calculateLabelHeight(width:font:text:)(v17, v20, v22, Width - (v16 + v16));

      swift_bridgeObjectRelease();
      return;
    }
LABEL_11:
    uint64_t v20 = 0;
    unint64_t v22 = 0xE000000000000000;
    goto LABEL_12;
  }
  id v3 = *(void **)(v5 + 24 * a1 + 48);
  id v1 = v3;
  id v6 = objc_msgSend(v2, sel_view);
  if (v6)
  {
    CGFloat v7 = v6;
    objc_msgSend(v6, sel_frame);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v24.origin.x = v9;
    v24.origin.y = v11;
    v24.size.width = v13;
    v24.size.height = v15;
    double Width = CGRectGetWidth(v24);
    if (one-time initialization token for margin == -1) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  __break(1u);
}

id specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(void *)(v8 + 16) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v1 = *(void **)(v8 + 24 * a1 + 48);
  if (!v1) {
    return v1;
  }
  id v3 = v1;
  id result = objc_msgSend(v2, sel_view);
  if (result)
  {
    double v10 = result;
    objc_msgSend(result, sel_bounds);
    CGFloat v4 = v11;
    CGFloat v5 = v12;
    CGFloat v6 = v13;
    CGFloat v7 = v14;

    if (one-time initialization token for margin == -1)
    {
LABEL_6:
      v18.origin.x = v4;
      v18.origin.y = v5;
      v18.size.width = v6;
      v18.size.height = v7;
      CGRect v19 = CGRectInset(v18, *(CGFloat *)&margin, *(CGFloat *)&margin);
      objc_msgSend(v3, sel_setFrame_, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

      objc_msgSend(v3, sel_setDelegate_, v2);
      CGFloat v15 = self;
      id v16 = v3;
      id v17 = objc_msgSend(v15, sel_secondaryLabelColor);
      objc_msgSend(v16, sel_setTextColor_, v17);

      return v1;
    }
LABEL_10:
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

void *specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(uint64_t a1)
{
  uint64_t v5 = v1;
  uint64_t v7 = type metadata accessor for UIListContentConfiguration();
  uint64_t v50 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  CGFloat v52 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SwitchCell();
  CGFloat v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v9, sel_setSelectionStyle_, 0);
  uint64_t v10 = *(void *)(v5
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings);
  unint64_t v11 = IndexPath.section.getter();
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v11 >= *(void *)(v10 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v2 = *(void *)(v10 + 24 * v11 + 32);
  uint64_t v49 = a1;
  if (v2)
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = IndexPath.row.getter();
    if ((v12 & 0x8000000000000000) == 0)
    {
      if (v12 < *(void *)(v2 + 16))
      {
        unint64_t v13 = v2 + 56 * v12;
        uint64_t v14 = *(void *)(v13 + 40);
        uint64_t v51 = *(void *)(v13 + 32);
        uint64_t v16 = *(void *)(v13 + 48);
        uint64_t v15 = *(void *)(v13 + 56);
        uint64_t v17 = *(unsigned __int8 *)(v13 + 64);
        uint64_t v18 = v7;
        CGRect v19 = v9;
        uint64_t v20 = *(void *)(v13 + 72);
        uint64_t v21 = *(void *)(v13 + 80);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v2 = v51;
        unint64_t v11 = swift_bridgeObjectRelease();
        uint64_t v22 = v20;
        CGFloat v9 = v19;
        uint64_t v7 = v18;
        goto LABEL_8;
      }
LABEL_33:
      __break(1u);
LABEL_34:
      swift_once();
      goto LABEL_27;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v14 = 0;
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  uint64_t v17 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
LABEL_8:
  uint64_t v47 = v17;
  uint64_t v48 = v5;
  v54[0] = v2;
  v54[1] = v14;
  v54[2] = v16;
  v54[3] = v15;
  v54[4] = v17;
  v54[5] = v22;
  uint64_t v46 = v22;
  v54[6] = v21;
  MEMORY[0x25A2AF680](v11);
  uint64_t v51 = v2;
  if (v14)
  {
    swift_bridgeObjectRetain();
    UIListContentConfiguration.text.setter();
    swift_bridgeObjectRetain();
  }
  else
  {
    UIListContentConfiguration.text.setter();
  }
  Swift::String v23 = v52;
  UIListContentConfiguration.secondaryText.setter();
  CGRect v24 = self;
  id v25 = objc_msgSend(v24, sel_secondaryLabelColor);
  CGRect v26 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v26(v53, 0);
  uint64_t v2 = v7;
  v53[3] = v7;
  v53[4] = MEMORY[0x263F81F20];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v53);
  uint64_t v4 = v50;
  (*(void (**)(uint64_t *, char *, uint64_t))(v50 + 16))(boxed_opaque_existential_1, v23, v7);
  int64_t v28 = v9;
  MEMORY[0x25A2AF670](v53);

  CGFloat v9 = v28;
  id v29 = objc_msgSend(v24, sel_secondarySystemBackgroundColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v29);

  objc_msgSend(v9, sel_setClipsToBounds_, 1);
  id v30 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v30, sel_setMasksToBounds_, 1);

  if (v14 && v21)
  {
    double v31 = v9;
    swift_bridgeObjectRetain();
    CGFloat v32 = (void *)MEMORY[0x25A2AF5D0](v46, v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    double v33 = v9;
    CGFloat v32 = 0;
  }
  uint64_t v34 = v48;
  objc_msgSend(v9, sel_setAccessibilityIdentifier_, v32);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C40]), sel_init);
  objc_msgSend(v3, sel_setTag_, IndexPath.row.getter());
  if (v14)
  {
    swift_bridgeObjectRetain();
    Swift::String v35 = (void *)MEMORY[0x25A2AF5D0](v51, v14);
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setTitle_, v35);

    uint64_t v36 = v47 & 1;
  }
  else
  {
    objc_msgSend(v3, sel_setTitle_, 0);
    uint64_t v36 = 0;
  }
  objc_msgSend(v3, sel_setOn_, v36);
  if (!IndexPath.section.getter())
  {
    Swift::String v37 = sel_switchChanged_top_;
    goto LABEL_24;
  }
  if (IndexPath.section.getter() == 1)
  {
    Swift::String v37 = sel_switchChanged_middle_;
LABEL_24:
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v34, v37, 4096);
    goto LABEL_25;
  }
  if (IndexPath.section.getter() == 2)
  {
    Swift::String v37 = sel_switchChanged_bottom_;
    goto LABEL_24;
  }
  if (one-time initialization token for shared != -1) {
    goto LABEL_34;
  }
LABEL_27:
  uint64_t v42 = type metadata accessor for Logger();
  __swift_project_value_buffer(v42, (uint64_t)static MOOnboardingSettingsLogger.shared);
  CGFloat v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    CGFloat v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)CGFloat v45 = 0;
    _os_log_impl(&dword_256D32000, v43, v44, "Invalid section", v45, 2u);
    MEMORY[0x25A2AFF90](v45, -1, -1);
  }

LABEL_25:
  objc_msgSend(v9, sel_setAccessoryView_, v3);
  uint64_t v38 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v38;
  outlined init with take of AppSetting?((uint64_t)v54, v39 + 24);
  double v40 = *(void (**)(void (*)(char), uint64_t))((*MEMORY[0x263F8EED0] & *v9) + 0x60);
  swift_retain();
  v40(partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:), v39);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v52, v2);
  swift_release();
  return v9;
}

uint64_t specialized MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)()
{
  uint64_t v1 = v0;
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_256D32000, v3, v4, "Privacy About link tapped", v5, 2u);
    MEMORY[0x25A2AFF90](v5, -1, -1);
  }

  if (URL.absoluteString.getter() == 0xD000000000000022 && v6 == 0x8000000256D534E0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  CGFloat v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_256D32000, v9, v10, "URL tapped matches journal privacy string", v11, 2u);
    MEMORY[0x25A2AFF90](v11, -1, -1);
  }

  unint64_t v12 = (void *)MEMORY[0x25A2AF5D0](0xD00000000000001CLL, 0x8000000256D52FF0);
  id v13 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v12);

  if (!v13) {
    return 0;
  }
  objc_msgSend(v13, sel_setPresentingViewController_, v1);
  objc_msgSend(v13, sel_present);

  return 1;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
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

uint64_t sub_256D48BCC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_256D48C04()
{
  swift_release();
  if (*(void *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t outlined init with take of AppSetting?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AppSetting?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

void partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(char a1)
{
  closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(a1, *(void *)(v1 + 16), v1 + 24);
}

void type metadata accessor for NSAttributedStringKey()
{
  if (!lazy cache variable for type metadata for NSAttributedStringKey)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSAttributedStringKey);
    }
  }
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for UIFont(uint64_t a1, unint64_t *a2)
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

void partial apply for closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()(v0);
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
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

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t base witness table accessor for RawRepresentable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (void (*)(uint64_t))type metadata accessor for NSAttributedStringKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (void (*)(uint64_t))type metadata accessor for NSAttributedStringKey);
}

uint64_t base witness table accessor for Equatable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (void (*)(uint64_t))type metadata accessor for NSAttributedStringKey);
}

uint64_t lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(unint64_t *a1, void (*a2)(uint64_t))
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

void MOSuggestionSheetOnboardingSettingsViewController.switchChanged_middle(_:)()
{
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t MOOnboardingNavigationController.onboardingDelegate.getter()
{
  return MOOnboardingNavigationController.onboardingDelegate.getter();
}

{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t MOOnboardingNavigationController.onboardingDelegate.setter(uint64_t a1)
{
  return MOOnboardingNavigationController.onboardingDelegate.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate);
}

uint64_t (*MOOnboardingNavigationController.onboardingDelegate.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

id MOOnboardingNavigationController.__allocating_init(onboardingDelegate:)(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = (char *)objc_allocWithZone(v1);
  uint64_t v5 = &v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(void *)&v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v6 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  char v7 = MOOnboardingViewController.init()();
  uint64_t v8 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v7) + 0x88);
  uint64_t v9 = swift_unknownObjectRetain();
  v8(v9);
  v12.receiver = v4;
  v12.super_class = v2;
  id v10 = objc_msgSendSuper2(&v12, sel_initWithRootViewController_, v7);

  swift_unknownObjectRelease();
  return v10;
}

id MOOnboardingNavigationController.init(onboardingDelegate:)(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = &v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(void *)id v4 = 0;
  swift_beginAccess();
  *(void *)id v4 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v5 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  id v6 = MOOnboardingViewController.init()();
  char v7 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v6) + 0x88);
  uint64_t v8 = swift_unknownObjectRetain();
  v7(v8);
  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for MOOnboardingNavigationController();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithRootViewController_, v6);

  swift_unknownObjectRelease();
  return v9;
}

id MOOnboardingViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return MOOnboardingViewController.init()();
}

uint64_t type metadata accessor for MOOnboardingViewController()
{
  return self;
}

id MOOnboardingNavigationController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void MOOnboardingNavigationController.init(coder:)()
{
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id MOOnboardingNavigationController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void MOOnboardingNavigationController.init(navigationBarClass:toolbarClass:)()
{
}

id MOOnboardingNavigationController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void MOOnboardingNavigationController.init(rootViewController:)()
{
}

id MOOnboardingNavigationController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x25A2AF5D0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void MOOnboardingNavigationController.init(nibName:bundle:)()
{
}

id MOOnboardingNavigationController.__deallocating_deinit()
{
  return MOOnboardingNavigationController.__deallocating_deinit(type metadata accessor for MOOnboardingNavigationController, (SEL *)&selRef_dealloc);
}

id MOOnboardingViewController.onboardingManager.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager));
}

uint64_t MOOnboardingViewController.delegate.getter()
{
  return MOOnboardingNavigationController.onboardingDelegate.getter();
}

uint64_t MOOnboardingViewController.delegate.setter(uint64_t a1)
{
  return MOOnboardingNavigationController.onboardingDelegate.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate);
}

uint64_t MOOnboardingNavigationController.onboardingDelegate.setter(uint64_t a1, void *a2)
{
  id v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MOOnboardingViewController.delegate.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t MOOnboardingViewController.journalBundleAboutIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MOOnboardingViewController.hasTappedOnboardingCompletion.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion);
  swift_beginAccess();
  return *v1;
}

uint64_t MOOnboardingViewController.hasTappedOnboardingCompletion.setter(char a1)
{
  id v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*MOOnboardingViewController.hasTappedOnboardingCompletion.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify;
}

void *MOOnboardingViewController.turnOnSuggestionsButton.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void MOOnboardingViewController.turnOnSuggestionsButton.setter(void *a1)
{
}

uint64_t (*MOOnboardingViewController.turnOnSuggestionsButton.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

void *MOOnboardingViewController.notNowButton.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void MOOnboardingViewController.notNowButton.setter(void *a1)
{
}

uint64_t (*MOOnboardingViewController.notNowButton.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

void MOOnboardingViewController.__allocating_init(coder:)()
{
  uint64_t v1 = objc_allocWithZone(v0);
  uint64_t v2 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager;
  *(void *)&v1[v2] = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate] = 0;
  id v3 = &v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier];
  void *v3 = 0xD00000000000001CLL;
  v3[1] = 0x8000000256D52FF0;
  v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion] = 0;
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void MOOnboardingViewController.init(coder:)()
{
  uint64_t v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager;
  *(void *)&v0[v1] = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier];
  *uint64_t v2 = 0xD00000000000001CLL;
  v2[1] = 0x8000000256D52FF0;
  v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion] = 0;
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id MOOnboardingViewController.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager;
  uint64_t v2 = self;
  id v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_sharedInstance);
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate] = 0;
  id v4 = &v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier];
  *(void *)id v4 = 0xD00000000000001CLL;
  *((void *)v4 + 1) = 0x8000000256D52FF0;
  v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion] = 0;
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton] = 0;

  id v5 = (objc_class *)type metadata accessor for MOOnboardingViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  id v9 = (void *)MEMORY[0x25A2AF5D0](0xD000000000000023, 0x8000000256D53D50);
  id v10 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v9, v8, 0);

  id v11 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v25._countAndFlagsBits = 0xD000000000000027;
  v25._object = (void *)0x8000000256D53DA0;
  v12._object = (void *)0x8000000256D53D80;
  v12._countAndFlagsBits = 0xD000000000000016;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  Swift::String v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v25);

  uint64_t v15 = (void *)MEMORY[0x25A2AF5D0](v14._countAndFlagsBits, v14._object);
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v17._countAndFlagsBits = 0xD000000000000063;
  v26._object = (void *)0x8000000256D53E40;
  v17._object = (void *)0x8000000256D53DD0;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v26._countAndFlagsBits = 0xD000000000000016;
  Swift::String v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v26);

  uint64_t v20 = (void *)MEMORY[0x25A2AF5D0](v19._countAndFlagsBits, v19._object);
  swift_bridgeObjectRelease();
  v24.receiver = v3;
  v24.super_class = v5;
  id v21 = objc_msgSendSuper2(&v24, sel_initWithTitle_detailText_icon_contentLayout_, v15, v20, v10, 2);

  id v22 = v21;
  MOOnboardingViewController.loadInitialController()();

  return v22;
}

uint64_t type metadata accessor for MOOnboardingNavigationController()
{
  return self;
}

Swift::Void __swiftcall MOOnboardingViewController.viewDidLoad()()
{
}

Swift::Void __swiftcall MOOnboardingViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for MOOnboardingViewController();
  objc_msgSendSuper2(&v10, sel_viewDidAppear_, a1);
  id v3 = objc_msgSend(v1, sel_contentView);
  id v4 = self;
  id v5 = objc_msgSend(v4, sel_systemBlueColor);
  objc_msgSend(v3, sel_setTintColor_, v5);

  id v6 = objc_msgSend(v1, sel_navigationController);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(v6, sel_navigationBar);

    id v9 = objc_msgSend(v4, sel_systemBlueColor);
    objc_msgSend(v8, sel_setTintColor_, v9);
  }
}

void MOOnboardingViewController.initNavbar()()
{
  id v1 = objc_msgSend(v0, sel_navigationController);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_navigationBar);

    id v4 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v3, sel_setBackgroundColor_, v4);
  }
  id v5 = objc_msgSend(v0, sel_navigationController);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel_setTranslucent_, 0);
  }
  id v8 = objc_msgSend(v0, sel_navigationController);
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_msgSend(v8, sel_navigationBar);

    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
    objc_msgSend(v10, sel_setShadowImage_, v11);
  }
}

id MOOnboardingViewController.loadInitialController()()
{
  id v1 = v0;
  Swift::String v129 = (void *)type metadata accessor for UIButton.Configuration.Size();
  uint64_t v2 = *(v129 - 1);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v4 = (char *)&v115 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = type metadata accessor for UIButton.Configuration();
  uint64_t v5 = *(void *)(v130 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  Swift::String v128 = (char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v115 - v9;
  MEMORY[0x270FA5388](v8);
  Swift::String v12 = (char *)&v115 - v11;
  MOOnboardingViewController.initNavbar()();
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_31;
  }
  Swift::String v14 = result;
  uint64_t v15 = self;
  id v133 = v15;
  id v16 = objc_msgSend(v15, sel_systemBackgroundColor);
  objc_msgSend(v14, sel_setBackgroundColor_, v16);

  id v17 = objc_msgSend(v1, sel_buttonTray);
  id v18 = objc_msgSend(v15, sel_systemBlueColor);
  objc_msgSend(v17, sel_setTintColor_, v18);

  static UIButton.Configuration.plain()();
  UIButton.Configuration.contentInsets.setter();
  type metadata accessor for MOOnboardingViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v131 = self;
  uint64_t v132 = ObjCClassFromMetadata;
  id v20 = objc_msgSend(v131, sel_bundleForClass_, ObjCClassFromMetadata);
  v21._countAndFlagsBits = 0xD000000000000018;
  v134._countAndFlagsBits = 0xD00000000000002DLL;
  v134._object = (void *)0x8000000256D540B0;
  v21._object = (void *)0x8000000256D54090;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v134);

  UIButton.Configuration.title.setter();
  objc_super v24 = *(void (**)(void))(v2 + 104);
  uint64_t v23 = v2 + 104;
  unsigned int v120 = *MEMORY[0x263F82200];
  Swift::String v119 = (void (*)(char *, void, void *))v24;
  v24(v4);
  UIButton.Configuration.buttonSize.setter();
  uint64_t v25 = type metadata accessor for UIFont(0, &lazy cache variable for type metadata for OBBulletedListItemLinkButton);
  uint64_t v125 = v5;
  Swift::String v26 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 16);
  uint64_t v117 = v5 + 16;
  Swift::String v118 = v26;
  v26((uint64_t)v10, v12, v130);
  uint64_t v27 = type metadata accessor for UIFont(0, &lazy cache variable for type metadata for UIAction);
  swift_allocObject();
  id v126 = v1;
  swift_unknownObjectWeakInit();
  uint64_t v121 = v27;
  UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  uint64_t v122 = v25;
  id v28 = (id)UIButton.init(configuration:primaryAction:)();
  id v29 = objc_msgSend(v133, sel_systemBlueColor);
  objc_msgSend(v28, sel_setTintColor_, v29);

  id v30 = objc_msgSend(v28, sel_titleLabel);
  if (v30)
  {
    double v31 = v30;
    objc_msgSend(v30, sel_setNumberOfLines_, 0);
  }
  Swift::String v123 = v4;
  Swift::String v124 = v12;
  id v127 = v28;
  id v32 = objc_msgSend(v28, sel_titleLabel, v23, v10);
  if (v32)
  {
    double v33 = v32;
    objc_msgSend(v32, sel_setLineBreakMode_, 0);
  }
  id v35 = v131;
  uint64_t v34 = v132;
  id v36 = objc_msgSend(v131, sel_bundleForClass_, v132);
  v135._countAndFlagsBits = 0xD000000000000027;
  v135._object = (void *)0x8000000256D540E0;
  v37._countAndFlagsBits = 0x2064657461727543;
  v37._object = (void *)0xEF756F5920726F66;
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  Swift::String v39 = NSLocalizedString(_:tableName:bundle:value:comment:)(v37, (Swift::String_optional)0, (NSBundle)v36, v38, v135);

  double v40 = (void *)MEMORY[0x25A2AF5D0](v39._countAndFlagsBits, v39._object);
  swift_bridgeObjectRelease();
  id v41 = objc_msgSend(v35, sel_bundleForClass_, v34);
  v136._countAndFlagsBits = 0xD000000000000026;
  v42._countAndFlagsBits = 0xD000000000000074;
  v136._object = (void *)0x8000000256D54190;
  v42._object = (void *)0x8000000256D54110;
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  Swift::String v44 = NSLocalizedString(_:tableName:bundle:value:comment:)(v42, (Swift::String_optional)0, (NSBundle)v41, v43, v136);

  CGFloat v45 = (void *)MEMORY[0x25A2AF5D0](v44._countAndFlagsBits, v44._object);
  swift_bridgeObjectRelease();
  uint64_t v46 = (void *)MEMORY[0x25A2AF5D0](0x6C7562746867696CLL, 0xED000078616D2E62);
  id v47 = objc_msgSend(v133, sel_systemBlueColor);
  uint64_t v48 = v126;
  objc_msgSend(v126, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_linkButton_, v40, v45, v46, v47, v127);

  uint64_t v49 = *(void *)((char *)v48
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  uint64_t v50 = *(void *)((char *)v48
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier
                  + 8);
  swift_bridgeObjectRetain();
  uint64_t v51 = (void *)MEMORY[0x25A2AF5D0](v49, v50);
  swift_bridgeObjectRelease();
  id v52 = objc_msgSend(self, sel_bundleWithIdentifier_, v51);

  if (v52)
  {
    id result = objc_msgSend(v52, sel_privacyFlow);
    double v53 = (SEL *)&unk_265425000;
    if (result)
    {
      CGFloat v54 = result;
      id v55 = objc_msgSend(result, sel_localizedButtonTitle);

      if (v55)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }
      uint64_t v56 = v116;
      Swift::String v57 = v129;
      goto LABEL_12;
    }
LABEL_31:
    __break(1u);
    return result;
  }
  uint64_t v56 = v116;
  Swift::String v57 = v129;
  double v53 = (SEL *)&unk_265425000;
LABEL_12:
  Swift::String v58 = v128;
  static UIButton.Configuration.plain()();
  UIButton.Configuration.contentInsets.setter();
  UIButton.Configuration.title.setter();
  v119(v123, v120, v57);
  UIButton.Configuration.buttonSize.setter();
  v118(v56, v58, v130);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v59 = (id)UIButton.init(configuration:primaryAction:)();
  id v60 = objc_msgSend(v133, sel_systemBlueColor);
  objc_msgSend(v59, sel_setTintColor_, v60);

  id v61 = objc_msgSend(v59, sel_titleLabel);
  if (v61)
  {
    uint64_t v62 = v61;
    objc_msgSend(v61, v53[253], 0);
  }
  Swift::String v129 = v52;
  id v63 = objc_msgSend(v59, sel_titleLabel);
  if (v63)
  {
    uint64_t v64 = v63;
    objc_msgSend(v63, sel_setLineBreakMode_, 0);
  }
  id v66 = v131;
  uint64_t v65 = v132;
  id v67 = objc_msgSend(v131, sel_bundleForClass_, v132);
  v68._countAndFlagsBits = 0xD000000000000017;
  v137._countAndFlagsBits = 0xD000000000000028;
  v137._object = (void *)0x8000000256D541E0;
  v68._object = (void *)0x8000000256D541C0;
  v69._countAndFlagsBits = 0;
  v69._object = (void *)0xE000000000000000;
  Swift::String v70 = NSLocalizedString(_:tableName:bundle:value:comment:)(v68, (Swift::String_optional)0, (NSBundle)v67, v69, v137);

  uint64_t v71 = (void *)MEMORY[0x25A2AF5D0](v70._countAndFlagsBits, v70._object);
  swift_bridgeObjectRelease();
  id v72 = objc_msgSend(v66, sel_bundleForClass_, v65);
  v138._countAndFlagsBits = 0xD000000000000027;
  v73._countAndFlagsBits = 0xD000000000000069;
  v138._object = (void *)0x8000000256D54280;
  v73._object = (void *)0x8000000256D54210;
  v74._countAndFlagsBits = 0;
  v74._object = (void *)0xE000000000000000;
  Swift::String v75 = NSLocalizedString(_:tableName:bundle:value:comment:)(v73, (Swift::String_optional)0, (NSBundle)v72, v74, v138);

  id v76 = (void *)MEMORY[0x25A2AF5D0](v75._countAndFlagsBits, v75._object);
  swift_bridgeObjectRelease();
  Swift::String v77 = (void *)MEMORY[0x25A2AF5D0](0x6961722E646E6168, 0xEB00000000646573);
  id v78 = objc_msgSend(v133, sel_systemBlueColor);
  objc_msgSend(v48, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_linkButton_, v71, v76, v77, v78, v59);

  id v79 = objc_msgSend(self, sel_boldButton);
  CGRect v80 = (void *)MEMORY[0x263F8EED0];
  uint64_t v81 = (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v48) + 0xB8))(v79);
  CGRect v82 = *(uint64_t (**)(void))((*v80 & *v48) + 0xB0);
  Swift::String v83 = (void *)((uint64_t (*)(uint64_t))v82)(v81);
  if (v83)
  {
    Swift::String v84 = v83;
    objc_msgSend(v83, sel_addTarget_action_forControlEvents_, v48, sel_turnOnSuggestionsButtonTapped, 64);
  }
  uint64_t v85 = v82();
  if (v85)
  {
    Swift::String v86 = (void *)v85;
    id v87 = objc_msgSend(v131, sel_bundleForClass_, v132);
    v139._countAndFlagsBits = 0xD000000000000031;
    v139._object = (void *)0x8000000256D542B0;
    v88._object = (void *)0x8000000256D53560;
    v88._countAndFlagsBits = 0xD00000000000001ELL;
    v89._countAndFlagsBits = 0;
    v89._object = (void *)0xE000000000000000;
    Swift::String v90 = NSLocalizedString(_:tableName:bundle:value:comment:)(v88, (Swift::String_optional)0, (NSBundle)v87, v89, v139);

    Swift::String v91 = (void *)MEMORY[0x25A2AF5D0](v90._countAndFlagsBits, v90._object);
    CGRect v80 = (void *)MEMORY[0x263F8EED0];
    swift_bridgeObjectRelease();
    objc_msgSend(v86, sel_setTitle_forState_, v91, 0);
  }
  uint64_t v92 = v82();
  if (v92)
  {
    Swift::String v93 = (void *)v92;
    id v94 = objc_msgSend(v48, sel_buttonTray);
    objc_msgSend(v94, sel_addButton_, v93);
  }
  id v95 = objc_msgSend(self, sel_linkButton);
  uint64_t v96 = (*(uint64_t (**)(id))((*v80 & *v48) + 0xD0))(v95);
  Swift::String v97 = *(uint64_t (**)(void))((*v80 & *v48) + 0xC8);
  id v98 = (void *)((uint64_t (*)(uint64_t))v97)(v96);
  if (v98)
  {
    uint64_t v99 = v98;
    objc_msgSend(v98, sel_addTarget_action_forControlEvents_, v48, sel_notNowCloseSheet, 64);
  }
  uint64_t v100 = v97();
  if (v100)
  {
    Swift::String v101 = (void *)v100;
    id v102 = objc_msgSend(v131, sel_bundleForClass_, v132);
    v140._object = (void *)0x8000000256D542F0;
    v103._countAndFlagsBits = 0x776F4E20746F4ELL;
    v103._object = (void *)0xE700000000000000;
    v104._countAndFlagsBits = 0;
    v104._object = (void *)0xE000000000000000;
    v140._countAndFlagsBits = 0xD00000000000001ELL;
    Swift::String v105 = NSLocalizedString(_:tableName:bundle:value:comment:)(v103, (Swift::String_optional)0, (NSBundle)v102, v104, v140);

    Swift::String v106 = (void *)MEMORY[0x25A2AF5D0](v105._countAndFlagsBits, v105._object);
    swift_bridgeObjectRelease();
    objc_msgSend(v101, sel_setTitle_forState_, v106, 0);
  }
  uint64_t v107 = v97();
  uint64_t v108 = v130;
  id v109 = v124;
  if (v107)
  {
    Swift::String v110 = (void *)v107;
    id v111 = objc_msgSend(v48, sel_buttonTray);
    objc_msgSend(v111, sel_addButton_, v110);

    id v112 = v110;
    id v59 = v111;
    uint64_t v113 = v125;
  }
  else
  {
    uint64_t v113 = v125;
    id v112 = v129;
  }

  v114 = *(void (**)(char *, uint64_t))(v113 + 8);
  v114(v128, v108);
  return (id)((uint64_t (*)(char *, uint64_t))v114)(v109, v108);
}

void closure #1 in MOOnboardingViewController.loadInitialController()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x25A2AFFF0](v2);
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x120))();
  }
}

void closure #2 in MOOnboardingViewController.loadInitialController()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x25A2AFFF0](v2);
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x108))();
  }
}

void MOOnboardingViewController.requestNotificationPermissions(completion:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  uint64_t v5 = (void *)MEMORY[0x25A2AF5D0](0xD000000000000026, 0x8000000256D52E80);
  id v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v9[4] = partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:);
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v9[3] = &block_descriptor_0;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_requestAuthorizationWithOptions_completionHandler_, 6, v8);

  _Block_release(v8);
}

Swift::Void __swiftcall MOOnboardingViewController.privacyAboutTapped()()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  uint64_t v2 = *(void *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier
                 + 8);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)MEMORY[0x25A2AF5D0](v1, v2);
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4)
  {
    objc_msgSend(v4, sel_setPresentingViewController_, v0);
    objc_msgSend(v4, sel_present);
  }
}

void MOOnboardingViewController.notNowCloseSheet()()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))() & 1) == 0)
  {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F56580]), sel_init);
    uint64_t v3 = (void *)MEMORY[0x25A2AF5D0](0xD00000000000002BLL, 0x8000000256D54050);
    v6[4] = closure #1 in closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped();
    v6[5] = 0;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    v6[3] = &block_descriptor_8;
    id v4 = _Block_copy(v6);
    objc_msgSend(v2, sel_triggerFeedbackAssistantFlow_handler_, v3, v4);
    _Block_release(v4);

    uint64_t v5 = (void *)(*(uint64_t (**)(id))((*v1 & *v0) + 0x80))(objc_msgSend(*(id *)((char *)v0+ OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager), sel_setOnboardingFlowCompletionStatus_, 1));
    if (v5)
    {
      objc_msgSend(v5, sel_shouldDismissOnboarding);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

Swift::Void __swiftcall MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  uint64_t v1 = v0;
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_256D32000, v3, v4, "[MOSuggestionSheetOnboardingViewController] Turn on Journaling Suggestions tapped", v5, 2u);
    MEMORY[0x25A2AFF90](v5, -1, -1);
  }

  id v6 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98))() & 1) == 0)
  {
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_256D32000, v7, v8, "[MOSuggestionSheetOnboardingViewController] Haven't tapped Turn on Journaling Suggestions before; proceed with sheet dismissal",
        v9,
        2u);
      MEMORY[0x25A2AFF90](v9, -1, -1);
    }

    uint64_t v10 = (*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xA0))(1);
    uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xB0))(v10);
    if (v11)
    {
      Swift::String v12 = v11;
      objc_msgSend(v11, sel_setEnabled_, 0);
    }
    Swift::String v13 = (void *)(*(uint64_t (**)(void))((*v6 & *v1) + 0xC8))();
    if (v13)
    {
      Swift::String v14 = v13;
      objc_msgSend(v13, sel_setEnabled_, 0);
    }
    specialized static MOSettingsOptions.setDefaultSettings()();
    objc_msgSend(*(id *)((char *)v1 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager), sel_setOnboardingFlowCompletionStatus_, 2);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v1;
    id v16 = *(void (**)(uint64_t (*)(), uint64_t))((*v6 & *v1) + 0x100);
    id v17 = v1;
    v16(partial apply for closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped(), v15);
    swift_release();
  }
}

uint64_t closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UIFont(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  os_log_type_t v8 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped();
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_14;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x25A2AF6A0](0, v7, v3, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x25A2AFFF0](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x80))();

    if (v4)
    {
      objc_msgSend(v4, sel_shouldDismissOnboarding);
      swift_unknownObjectRelease();
    }
  }
}

Swift::Void __swiftcall MOOnboardingViewController.customizeButtonTapped()()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))() & 1) == 0)
  {
    specialized static MOSettingsOptions.setDefaultSettings()();
    id v2 = objc_allocWithZone((Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController());
    uint64_t v6 = MOSuggestionSheetOnboardingSettingsViewController.init()();
    uint64_t v3 = (*(uint64_t (**)(void))((*v1 & *v0) + 0x80))();
    (*(void (**)(uint64_t))((*v1 & *v6) + 0xA0))(v3);
    id v4 = objc_msgSend(v0, sel_navigationController);
    if (v4)
    {
      uint64_t v5 = v4;
      objc_msgSend(v4, sel_pushViewController_animated_, v6, 1);
    }
  }
}

id MOOnboardingViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  os_log_type_t v8 = v7;
  Swift::String v14 = (void *)MEMORY[0x25A2AF5D0]();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v15 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = 0;
    goto LABEL_6;
  }
  uint64_t v15 = (void *)MEMORY[0x25A2AF5D0](a3, a4);
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v16 = (void *)MEMORY[0x25A2AF5D0](a5, a6);
  swift_bridgeObjectRelease();
LABEL_6:
  id v17 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v14, v15, v16, a7);

  return v17;
}

void MOOnboardingViewController.init(title:detailText:symbolName:contentLayout:)()
{
}

id MOOnboardingViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  Swift::String v12 = (void *)MEMORY[0x25A2AF5D0]();
  swift_bridgeObjectRelease();
  if (a4)
  {
    Swift::String v13 = (void *)MEMORY[0x25A2AF5D0](a3, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v12, v13, a5, a6);

  return v14;
}

void MOOnboardingViewController.init(title:detailText:icon:contentLayout:)()
{
}

id MOOnboardingViewController.__deallocating_deinit()
{
  return MOOnboardingNavigationController.__deallocating_deinit(type metadata accessor for MOOnboardingViewController, (SEL *)&selRef_dealloc);
}

id MOOnboardingNavigationController.__deallocating_deinit(uint64_t (*a1)(void), SEL *a2)
{
  v5.receiver = v2;
  v5.super_class = (Class)a1();
  return objc_msgSendSuper2(&v5, *a2);
}

UIFont __swiftcall UIFont.withTraits(traits:)(UIFontDescriptorSymbolicTraits traits)
{
  uint64_t v2 = *(void *)&traits;
  id v3 = objc_msgSend(v1, sel_fontDescriptor);
  id v4 = objc_msgSend(v3, sel_fontDescriptorWithSymbolicTraits_, v2);

  if (v4)
  {
    id v6 = objc_msgSend(self, sel_fontWithDescriptor_size_, v4, 0.0);

    return (UIFont)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

UIFont __swiftcall UIFont.bold()()
{
  id v1 = objc_msgSend(v0, sel_fontDescriptor);
  id v2 = objc_msgSend(v1, sel_fontDescriptorWithSymbolicTraits_, 2);

  if (v2)
  {
    id v4 = objc_msgSend(self, sel_fontWithDescriptor_size_, v2, 0.0);

    return (UIFont)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_256D4C48C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_256D4C4DC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  return closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()();
}

uint64_t sub_256D4C51C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()(v0);
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

void partial apply for closure #1 in MOOnboardingViewController.loadInitialController()(uint64_t a1)
{
  closure #1 in MOOnboardingViewController.loadInitialController()(a1, v1);
}

void partial apply for closure #2 in MOOnboardingViewController.loadInitialController()(uint64_t a1)
{
  closure #2 in MOOnboardingViewController.loadInitialController()(a1, v1);
}

id static MOSettingsOptions.healthAndActivitySuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(1);
}

id static MOSettingsOptions.mediaSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(2);
}

id static MOSettingsOptions.contactsSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(3);
}

id static MOSettingsOptions.photosSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(4);
}

id static MOSettingsOptions.locationsSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(5);
}

id static MOSettingsOptions.stateOfMindSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(9);
}

id static MOSettingsOptions.reflectionSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(10);
}

id static MOSettingsOptions.nearbyPeopleSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(6);
}

id static MOSettingsOptions.healthAndActivitySuggestions.getter(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  id v3 = objc_msgSend(v2, sel_getStateForSetting_, a1);

  return v3;
}

void static MOSettingsOptions.healthAndActivitySuggestions.setter(char a1)
{
}

void static MOSettingsOptions.mediaSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.contactsSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.photosSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.locationsSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.stateOfMindSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.reflectionSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.nearbyPeopleSuggestions.setter(char a1)
{
}

void static MOSettingsOptions.healthAndActivitySuggestions.setter(char a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v4, sel_setState_forSetting_, a1 & 1, a2);
}

void (*static MOSettingsOptions.healthAndActivitySuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 1);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.healthAndActivitySuggestions.modify;
}

void static MOSettingsOptions.healthAndActivitySuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.mediaSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 2);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.mediaSuggestions.modify;
}

void static MOSettingsOptions.mediaSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.contactsSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 3);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.contactsSuggestions.modify;
}

void static MOSettingsOptions.contactsSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.photosSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 4);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.photosSuggestions.modify;
}

void static MOSettingsOptions.photosSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.locationsSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 5);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.locationsSuggestions.modify;
}

void static MOSettingsOptions.locationsSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.stateOfMindSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 9);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.stateOfMindSuggestions.modify;
}

void static MOSettingsOptions.stateOfMindSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.reflectionSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 10);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.reflectionSuggestions.modify;
}

void static MOSettingsOptions.reflectionSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void (*static MOSettingsOptions.nearbyPeopleSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = self;
  *(void *)a1 = v2;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  unsigned __int8 v4 = objc_msgSend(v3, sel_getStateForSetting_, 6);

  *(unsigned char *)(a1 + 8) = v4;
  return static MOSettingsOptions.nearbyPeopleSuggestions.modify;
}

void static MOSettingsOptions.nearbyPeopleSuggestions.modify(uint64_t a1, uint64_t a2)
{
}

void static MOSettingsOptions.healthAndActivitySuggestions.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 8);
  id v5 = objc_msgSend(*(id *)a1, sel_sharedInstance);
  objc_msgSend(v5, sel_setState_forSetting_, v4, a3);
}

uint64_t MOSettingsOptions.deinit()
{
  return v0;
}

uint64_t MOSettingsOptions.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t MOSettingsOptions.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t MOSettingsOptions.init()()
{
  return v0;
}

void specialized static MOSettingsOptions.setDefaultSettings()()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v1, sel_setState_forSetting_, 1, 1);

  id v2 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v2, sel_setState_forSetting_, 1, 2);

  id v3 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v3, sel_setState_forSetting_, 1, 3);

  id v4 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v4, sel_setState_forSetting_, 1, 4);

  id v5 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v5, sel_setState_forSetting_, 1, 5);

  id v6 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v6, sel_setState_forSetting_, 1, 6);

  id v7 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v7, sel_setState_forSetting_, 1, 10);

  id v8 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v8, sel_setState_forSetting_, 0, 9);
}

uint64_t type metadata accessor for MOSettingsOptions()
{
  return self;
}

void __swiftcall MOOnboardingManagerUI.createSheetOnboardingViewController()(OBNavigationController *__return_ptr retstr)
{
  id v1 = (objc_class *)type metadata accessor for MOOnboardingNavigationController();
  id v2 = (char *)objc_allocWithZone(v1);
  id v3 = &v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(void *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(void *)id v3 = 0;
  swift_unknownObjectRelease();
  id v4 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  id v5 = MOOnboardingViewController.init()();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x88))(0);
  v6.receiver = v2;
  v6.super_class = v1;
  [(OBNavigationController *)&v6 initWithRootViewController:v5];
}

id MOOnboardingManagerUI.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id MOOnboardingManagerUI.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOOnboardingManagerUI();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MOOnboardingManagerUI.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOOnboardingManagerUI();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id specialized MOOnboardingManagerUI.createSheetOnboardingViewController(with:)(uint64_t a1)
{
  objc_super v2 = (objc_class *)type metadata accessor for MOOnboardingNavigationController();
  id v3 = (char *)objc_allocWithZone(v2);
  id v4 = &v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(void *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(void *)id v4 = a1;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  id v5 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  objc_super v6 = MOOnboardingViewController.init()();
  id v7 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v6) + 0x88);
  uint64_t v8 = swift_unknownObjectRetain();
  v7(v8);
  v11.receiver = v3;
  v11.super_class = v2;
  id v9 = objc_msgSendSuper2(&v11, sel_initWithRootViewController_, v6);

  swift_unknownObjectRelease();
  return v9;
}

uint64_t type metadata accessor for MOOnboardingManagerUI()
{
  return self;
}

uint64_t MOOnboardingSettingsLogger.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MOOnboardingSettingsLogger.shared);
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static MOOnboardingSettingsLogger.shared);
  __swift_project_value_buffer(v0, (uint64_t)static MOOnboardingSettingsLogger.shared);
  return Logger.init(subsystem:category:)();
}

uint64_t static MOOnboardingSettingsLogger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t MOOnboardingSettingsLogger.deinit()
{
  return v0;
}

uint64_t MOOnboardingSettingsLogger.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t MOOnboardingSettingsLogger.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t MOOnboardingSettingsLogger.init()()
{
  return v0;
}

uint64_t type metadata accessor for MOOnboardingSettingsLogger()
{
  return self;
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

void __swiftcall AppSetting.init(title:subtitle:enableSwitch:accessibilityIdentifier:)(MomentsOnboardingAndSettings::AppSetting *__return_ptr retstr, Swift::String title, Swift::String_optional subtitle, Swift::Bool_optional enableSwitch, Swift::String_optional accessibilityIdentifier)
{
  retstr->title = title;
  retstr->subtitle = subtitle;
  retstr->enableSwitch = enableSwitch;
  retstr->accessibilityIdentifier = accessibilityIdentifier;
}

uint64_t AppSettingsOptionGroup.init(appSettings:header:footer:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(a1, a2, a3);

  return v4;
}

uint64_t AppSetting.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSetting.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSetting.enableSwitch.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t AppSetting.accessibilityIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

void *AppSettingsOptionGroup.header.getter(uint64_t a1, void *a2)
{
  id v3 = a2;
  return a2;
}

void *AppSettingsOptionGroup.footer.getter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  return a3;
}

uint64_t key path getter for SwitchCell.onSwitchChange : SwitchCell@<X0>(void **a1@<X0>, uint64_t (**a2)(unsigned __int8 *a1)@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x58))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    id v7 = partial apply for thunk for @escaping @callee_guaranteed (@unowned Bool) -> ();
  }
  else
  {
    id v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(unsigned __int8 *))result;
  return result;
}

uint64_t key path setter for SwitchCell.onSwitchChange : SwitchCell(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Bool) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = *(uint64_t (**)(uint64_t (*)(char), uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x60);
  outlined copy of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t SwitchCell.onSwitchChange.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
  swift_beginAccess();
  uint64_t v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(*v1);
  return v2;
}

uint64_t SwitchCell.onSwitchChange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(v6);
}

uint64_t (*SwitchCell.onSwitchChange.modify())()
{
  return MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify;
}

id SwitchCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x25A2AF5D0](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id SwitchCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = &v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x25A2AF5D0](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SwitchCell();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id SwitchCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SwitchCell.init(coder:)(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange];
  uint64_t v4 = (objc_class *)type metadata accessor for SwitchCell();
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id SwitchCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id ContentSizedTableView.contentSize.getter()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_contentSize);
}

id ContentSizedTableView.contentSize.setter(double a1, double a2)
{
  v6.receiver = v2;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_setContentSize_, a1, a2);
  return objc_msgSend(v2, sel_invalidateIntrinsicContentSize);
}

void (*ContentSizedTableView.contentSize.modify(objc_super **a1))(double **a1, char a2)
{
  id v3 = (objc_super *)malloc(0x50uLL);
  *a1 = v3;
  v3[4].receiver = v1;
  uint64_t ObjectType = swift_getObjectType();
  v3[4].super_class = (Class)ObjectType;
  v3[1].receiver = v1;
  v3[1].super_class = (Class)ObjectType;
  objc_msgSendSuper2(v3 + 1, sel_contentSize);
  v3->receiver = v5;
  v3->super_class = v6;
  return ContentSizedTableView.contentSize.modify;
}

void ContentSizedTableView.contentSize.modify(double **a1, char a2)
{
  objc_super v2 = *a1;
  double v3 = **a1;
  double v4 = (*a1)[1];
  objc_super v6 = (void *)*((void *)*a1 + 8);
  id v5 = (objc_class *)*((void *)*a1 + 9);
  objc_super v7 = (objc_super *)*a1;
  if (a2)
  {
    v7[2].receiver = v6;
    v7[2].super_class = v5;
    objc_msgSendSuper2(v7 + 2, sel_setContentSize_, v3, v4);
  }
  else
  {
    v7[3].receiver = v6;
    v7[3].super_class = v5;
    objc_msgSendSuper2(v7 + 3, sel_setContentSize_, v3, v4);
    objc_msgSend(v6, sel_invalidateIntrinsicContentSize);
  }
  free(v2);
}

double ContentSizedTableView.intrinsicContentSize.getter()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  objc_msgSend(v0, sel_layoutIfNeeded);
  double v2 = *MEMORY[0x263F83C20];
  v4.receiver = v0;
  v4.super_class = ObjectType;
  objc_msgSendSuper2(&v4, sel_contentSize);
  return v2;
}

id ContentSizedTableView.__allocating_init(frame:style:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return objc_msgSend(v11, sel_initWithFrame_style_, a1, a2, a3, a4, a5);
}

id ContentSizedTableView.init(frame:style:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v12.receiver = v5;
  v12.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_style_, a1, a2, a3, a4, a5);
}

id ContentSizedTableView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ContentSizedTableView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(uint64_t a1, void *a2, void *a3)
{
  objc_super v5 = (SEL *)&unk_265425000;
  if (!a2)
  {
    id v14 = a3;
    if (!a3) {
      return a1;
    }
    goto LABEL_3;
  }
  objc_super v7 = self;
  uint64_t v8 = *MEMORY[0x263F835D0];
  id v9 = a3;
  id v10 = a2;
  objc_super v5 = (SEL *)&unk_265425000;
  id v11 = objc_msgSend(v7, sel_preferredFontForTextStyle_, v8);
  objc_msgSend(v10, sel_setFont_, v11);

  objc_msgSend(v10, (SEL)&selRef_setCornerRadius_, 0);
  objc_msgSend(v10, (SEL)&selRef_settingsManagerDelegate + 3, 1);
  objc_msgSend(v10, (SEL)&selRef_setProperty_forKey_, 0);
  objc_msgSend(v10, (SEL)&selRef_dictionaryWithObjects_forKeys_count_, -1);
  if (a3)
  {
LABEL_3:
    id v12 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835B8]);
    objc_msgSend(a3, v5[248], v12);

    objc_msgSend(a3, sel_setEditable_, 0);
    objc_msgSend(a3, sel_setSelectable_, 1);
    objc_msgSend(a3, sel_setScrollEnabled_, 0);
    objc_msgSend(a3, sel_setDataDetectorTypes_, -1);
  }
  return a1;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for SwitchCell()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for AppSetting(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppSetting()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppSetting(uint64_t a1, uint64_t a2)
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

uint64_t assignWithCopy for AppSetting(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AppSetting(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for AppSetting(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSetting(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSetting()
{
  return &type metadata for AppSetting;
}

void destroy for AppSettingsOptionGroup(uint64_t a1)
{
  swift_bridgeObjectRelease();

  unint64_t v2 = *(void **)(a1 + 16);
}

void *initializeBufferWithCopyOfBuffer for AppSettingsOptionGroup(void *a1, void *a2)
{
  long long v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void *assignWithCopy for AppSettingsOptionGroup(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[1];
  id v5 = (void *)a2[1];
  a1[1] = v5;
  id v6 = v5;

  objc_super v7 = (void *)a1[2];
  uint64_t v8 = (void *)a2[2];
  a1[2] = v8;
  id v9 = v8;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppSettingsOptionGroup(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSettingsOptionGroup(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
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

uint64_t storeEnumTagSinglePayload for AppSettingsOptionGroup(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSettingsOptionGroup()
{
  return &type metadata for AppSettingsOptionGroup;
}

uint64_t type metadata accessor for ContentSizedTableView()
{
  return self;
}

uint64_t sub_256D4E80C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Bool) -> (@out ())(char a1)
{
  unint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned Bool) -> ()(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

objc_class *one-time initialization function for resourceBundle()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  __n128 result = (objc_class *)objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.Class isa = result;
  return result;
}

uint64_t one-time initialization function for journalingSuggestionsIcon80Masked(uint64_t a1)
{
  return one-time initialization function for journalingSuggestionsIcon80Masked(a1, static ImageResource.journalingSuggestionsIcon80Masked, 0xD000000000000023, 0x8000000256D53D50);
}

uint64_t ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor()
{
  return ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor(&one-time initialization token for journalingSuggestionsIcon80Masked, (uint64_t)static ImageResource.journalingSuggestionsIcon80Masked);
}

uint64_t static ImageResource.journalingSuggestionsIcon80Masked.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.journalingSuggestionsIcon80Masked.getter(&one-time initialization token for journalingSuggestionsIcon80Masked, (uint64_t)static ImageResource.journalingSuggestionsIcon80Masked, a1);
}

uint64_t one-time initialization function for momentsPrivacy80Masked(uint64_t a1)
{
  return one-time initialization function for journalingSuggestionsIcon80Masked(a1, static ImageResource.momentsPrivacy80Masked, 0xD000000000000018, 0x8000000256D54600);
}

uint64_t one-time initialization function for journalingSuggestionsIcon80Masked(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1) {
    swift_once();
  }
  return MEMORY[0x25A2AF4F0](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.momentsPrivacy80Masked.unsafeMutableAddressor()
{
  return ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor(&one-time initialization token for momentsPrivacy80Masked, (uint64_t)static ImageResource.momentsPrivacy80Masked);
}

uint64_t ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.momentsPrivacy80Masked.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.journalingSuggestionsIcon80Masked.getter(&one-time initialization token for momentsPrivacy80Masked, (uint64_t)static ImageResource.momentsPrivacy80Masked, a1);
}

uint64_t static ImageResource.journalingSuggestionsIcon80Masked.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void _MODiagnosticReporter_NotificationHandler_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedLong:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_256D32000, a2, OS_LOG_TYPE_DEBUG, "_MODiagnosticReporter_NotificationHandler with flags %@", (uint8_t *)&v4, 0xCu);
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = MEMORY[0x270EEEEC0](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)MEMORY[0x270EF16E0]();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1700]();
}

uint64_t IndexPath.row.getter()
{
  return MEMORY[0x270F816F8]();
}

uint64_t IndexPath.init(item:section:)()
{
  return MEMORY[0x270F81700]();
}

uint64_t IndexPath.section.getter()
{
  return MEMORY[0x270F81740]();
}

uint64_t type metadata accessor for IndexPath()
{
  return MEMORY[0x270EF1738]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t UIListContentConfiguration.secondaryText.setter()
{
  return MEMORY[0x270F81D68]();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return MEMORY[0x270F81DC8]();
}

uint64_t UIListContentConfiguration.secondaryTextProperties.modify()
{
  return MEMORY[0x270F81E50]();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return MEMORY[0x270F824A0]();
}

uint64_t UITableViewCell.defaultContentConfiguration()()
{
  return MEMORY[0x270F824B8]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return MEMORY[0x270F82960]();
}

uint64_t UIButton.Configuration.buttonSize.setter()
{
  return MEMORY[0x270F82998]();
}

uint64_t UIButton.Configuration.contentInsets.setter()
{
  return MEMORY[0x270F829F8]();
}

uint64_t type metadata accessor for UIButton.Configuration.Size()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t static UIButton.Configuration.plain()()
{
  return MEMORY[0x270F82B00]();
}

uint64_t UIButton.Configuration.title.setter()
{
  return MEMORY[0x270F82B18]();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return MEMORY[0x270F82B58]();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return MEMORY[0x270F82B60]();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}