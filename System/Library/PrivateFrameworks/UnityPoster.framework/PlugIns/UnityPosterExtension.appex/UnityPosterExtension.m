void sub_100001E38(id a1)
{
  uint64_t vars8;

  qword_10000D340 = +[UIColor colorWithRed:0.953 green:0.0 blue:0.066 alpha:1.0];
  _objc_release_x1();
}

void sub_100001EE4(id a1)
{
  qword_10000D350 = +[UIColor colorWithRed:0.0 green:0.559 blue:0.23 alpha:1.0];
  _objc_release_x1();
}

void sub_100001F90(id a1)
{
  qword_10000D360 = +[UIColor colorWithRed:0.98 green:0.8 blue:0.0 alpha:1.0];
  _objc_release_x1();
}

void sub_10000203C(id a1)
{
  qword_10000D370 = +[UIColor colorWithRed:0.477 green:0.0 blue:0.039 alpha:1.0];
  _objc_release_x1();
}

void sub_1000020E8(id a1)
{
  qword_10000D380 = +[UIColor colorWithRed:0.0 green:0.281 blue:0.117 alpha:1.0];
  _objc_release_x1();
}

void sub_100002194(id a1)
{
  qword_10000D390 = +[UIColor colorWithRed:0.49 green:0.396 blue:0.0 alpha:1.0];
  _objc_release_x1();
}

id sub_100003010(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updateQuiltsWithIdentifier:a2 deviceInterfaceOrientation:*(void *)(a1 + 32) unlockProgress:*(double *)(a1 + 40)];
}

void sub_10000356C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setTimeColor:v2];
  [v3 setHandlesWakeAnimation:1];
  id v4 = +[UIColor colorWithRed:1.0 green:0.2667 blue:0.2275 alpha:1.0];
  [v3 setPreferredProminentColor:v4];
}

uint64_t sub_1000045AC@<X0>(uint64_t *a1@<X8>)
{
  sub_100004C10();
  swift_allocObject();
  sub_100004C20();
  sub_100004BE0();
  swift_allocObject();
  swift_retain();
  sub_100004BF0();
  sub_100004A50(&qword_10000D288);
  sub_100004BA0();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100005F50;
  sub_100004A94(&qword_10000D290, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100004B90();
  sub_100004A94(&qword_10000D298, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100004B90();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_1000047D4()
{
  id v0 = objc_allocWithZone((Class)UnityPoster);
  return [v0 init];
}

uint64_t sub_100004810()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000496C()
{
  unint64_t result = qword_10000D268;
  if (!qword_10000D268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000D268);
  }
  return result;
}

uint64_t sub_1000049C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnityPosterExtension()
{
  return &type metadata for UnityPosterExtension;
}

uint64_t sub_100004A18()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100004A50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004A94(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004ADC()
{
  return sub_100004B10(&qword_10000D2A0);
}

uint64_t sub_100004B10(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000049C0(&qword_10000D278);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004B5C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100004B90()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100004BA0()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100004BB0()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100004BC0()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100004BD0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100004BE0()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100004BF0()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100004C00()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100004C10()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100004C20()
{
  return PRRenderingConfiguration.init(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

id objc_msgSend__alternateGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 _alternateGreenColor];
}

id objc_msgSend__alternateRedColor(void *a1, const char *a2, ...)
{
  return _[a1 _alternateRedColor];
}

id objc_msgSend__alternateYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 _alternateYellowColor];
}

id objc_msgSend__backlightLuminance(void *a1, const char *a2, ...)
{
  return _[a1 _backlightLuminance];
}

id objc_msgSend__greenColor(void *a1, const char *a2, ...)
{
  return _[a1 _greenColor];
}

id objc_msgSend__redColor(void *a1, const char *a2, ...)
{
  return _[a1 _redColor];
}

id objc_msgSend__setupConfigurationWithBounds_upperQuiltView_lowerQuiltView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupConfigurationWithBounds:upperQuiltView:lowerQuiltView:");
}

id objc_msgSend__setupLowerQuiltViewsIfNecessaryInParentView_lookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupLowerQuiltViewsIfNecessaryInParentView:lookIdentifier:");
}

id objc_msgSend__setupQuiltViewIfNecessaryInParentView_lookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupQuiltViewIfNecessaryInParentView:lookIdentifier:");
}

id objc_msgSend__setupUpperQuiltViewsIfNecessaryInParentView_lookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupUpperQuiltViewsIfNecessaryInParentView:lookIdentifier:");
}

id objc_msgSend__setupViewsInBackgroundView_foregroundView_lookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupViewsInBackgroundView:foregroundView:lookIdentifier:");
}

id objc_msgSend__solveForInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_solveForInput:");
}

id objc_msgSend__timeLayoutRect(void *a1, const char *a2, ...)
{
  return _[a1 _timeLayoutRect];
}

id objc_msgSend__updateColorsForIdentifier_upperQuiltView_lowerQuiltView_progress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateColorsForIdentifier:upperQuiltView:lowerQuiltView:progress:");
}

id objc_msgSend__yellowColor(void *a1, const char *a2, ...)
{
  return _[a1 _yellowColor];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundView];
}

id objc_msgSend_backlightProgress(void *a1, const char *a2, ...)
{
  return _[a1 backlightProgress];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_cleanupQuiltViews(void *a1, const char *a2, ...)
{
  return _[a1 cleanupQuiltViews];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return _[a1 contents];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLook(void *a1, const char *a2, ...)
{
  return _[a1 currentLook];
}

id objc_msgSend_currentLowerQuiltViewForLookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLowerQuiltViewForLookIdentifier:");
}

id objc_msgSend_currentUpperQuiltViewForLookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUpperQuiltViewForLookIdentifier:");
}

id objc_msgSend_descriptorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 descriptorIdentifier];
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 deviceOrientation];
}

id objc_msgSend_deviceOrientationFromEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceOrientationFromEnvironment:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _[a1 foregroundView];
}

id objc_msgSend_frameForElements_variant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameForElements:variant:");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRed:green:blue:alpha:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:identifier:");
}

id objc_msgSend_initWithIdentifier_displayName_initialTimeFontConfiguration_initialTitleColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:");
}

id objc_msgSend_initWithLUTIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLUTIdentifier:");
}

id objc_msgSend_initWithRandomizationSeedValue_viewport_timeBounds_lineVariance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRandomizationSeedValue:viewport:timeBounds:lineVariance:");
}

id objc_msgSend_initWithTimeFontIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeFontIdentifier:");
}

id objc_msgSend_interpolatedColorForIdentifier_progress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interpolatedColorForIdentifier:progress:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLUTBackedColor(void *a1, const char *a2, ...)
{
  return _[a1 isLUTBackedColor];
}

id objc_msgSend_isLowLuminance(void *a1, const char *a2, ...)
{
  return _[a1 isLowLuminance];
}

id objc_msgSend_isPreview(void *a1, const char *a2, ...)
{
  return _[a1 isPreview];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_loadUserInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadUserInfoWithError:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lowBrightness(void *a1, const char *a2, ...)
{
  return _[a1 lowBrightness];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableDescriptorWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableDescriptorWithIdentifier:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preferredTitleColors(void *a1, const char *a2, ...)
{
  return _[a1 preferredTitleColors];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_setAllowsSystemSuggestedComplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSystemSuggestedComplications:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBottomLeftQuiltColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomLeftQuiltColor:");
}

id objc_msgSend_setBottomRightQuiltColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomRightQuiltColor:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setHandlesWakeAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlesWakeAnimation:");
}

id objc_msgSend_setIntersectionPieceColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntersectionPieceColor:");
}

id objc_msgSend_setLandscapeWidgetRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLandscapeWidgetRect:");
}

id objc_msgSend_setLowBrightness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowBrightness:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPreferredProminentColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredProminentColor:");
}

id objc_msgSend_setPreferredTimeFontConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredTimeFontConfigurations:");
}

id objc_msgSend_setPreferredTitleColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredTitleColors:");
}

id objc_msgSend_setQuiltViewDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuiltViewDelegate:");
}

id objc_msgSend_setTimeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeColor:");
}

id objc_msgSend_setTimeRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeRect:");
}

id objc_msgSend_setTopQuiltColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopQuiltColor:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setupFullscreenConstraintsForView_container_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupFullscreenConstraintsForView:container:");
}

id objc_msgSend_sourceContents(void *a1, const char *a2, ...)
{
  return _[a1 sourceContents];
}

id objc_msgSend_storeGalleryOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeGalleryOptions:error:");
}

id objc_msgSend_storeUserInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeUserInfo:error:");
}

id objc_msgSend_targetConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 targetConfiguration];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_unlockProgress(void *a1, const char *a2, ...)
{
  return _[a1 unlockProgress];
}

id objc_msgSend_updateCurrentLowerQuiltView_lookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentLowerQuiltView:lookIdentifier:");
}

id objc_msgSend_updateCurrentQuiltView_forLookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentQuiltView:forLookIdentifier:");
}

id objc_msgSend_updateCurrentQuiltViewsForLookIdentifier_interfaceOrientation_unlockProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentQuiltViewsForLookIdentifier:interfaceOrientation:unlockProgress:");
}

id objc_msgSend_updateCurrentUpperQuiltView_lookIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentUpperQuiltView:lookIdentifier:");
}

id objc_msgSend_updatePreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePreferences:");
}

id objc_msgSend_updateQuiltsWithIdentifier_deviceInterfaceOrientation_unlockProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateQuiltsWithIdentifier:deviceInterfaceOrientation:unlockProgress:");
}

id objc_msgSend_updateQuiltsWithUnlockProgress_wakeProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateQuiltsWithUnlockProgress:wakeProgress:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_wantsLowBrightness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wantsLowBrightness:");
}