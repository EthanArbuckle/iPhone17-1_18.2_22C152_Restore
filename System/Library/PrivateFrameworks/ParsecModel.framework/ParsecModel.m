uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

unint64_t OUTLINED_FUNCTION_0()
{
  return 0xD000000000000013;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_223B5E610();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_223B5E610();
}

id OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  return objc_msgSend(v2, (SEL)(v3 + 1688), v1, a1);
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

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

id static PAREntity.createRequest()()
{
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC1F920);
  (*(void (**)(uint64_t, uint64_t))(v0 + 16))(v1, v0);
  return sub_223B5ABCC();
}

id sub_223B5ABCC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_223B5CBE0();
}

id static PAREntity.createGenericRequest()(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 16))();
  id v2 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v3 = (void *)sub_223B5E610();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  return v4;
}

uint64_t static PAREvent.timestampKeyPath.getter()
{
  return 0x6D617473656D6974;
}

id PAREvent.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

uint64_t type metadata accessor for PAREvent()
{
  return self;
}

id PAREvent.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PAREvent);
}

uint64_t sub_223B5AD6C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PAREvent();
  uint64_t result = sub_223B5E660();
  *a1 = result;
  return result;
}

id sub_223B5ADB0@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

id sub_223B5ADE4(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

void static PARFlushEvent.entityName.getter()
{
}

id PARFlushEvent.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

uint64_t type metadata accessor for PARFlushEvent()
{
  return self;
}

id PARFlushEvent.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PARFlushEvent);
}

uint64_t sub_223B5AEB4()
{
  return 0x6873756C46524150;
}

id sub_223B5AED8()
{
  return objc_msgSend(*v0, sel_type);
}

id sub_223B5AEE8@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_clientIntVal);
  *a2 = result;
  return result;
}

id sub_223B5AF1C(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setClientIntVal_, *a1);
}

id sub_223B5AF30@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_invokedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5AF64(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInvokedDays_, *a1);
}

id sub_223B5AF78@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_zkwEngagedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5AFAC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setZkwEngagedDays_, *a1);
}

id sub_223B5AFC0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_searchedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5AFF4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSearchedDays_, *a1);
}

id sub_223B5B008@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_suggestionOrAppleResultEngagedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5B03C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuggestionOrAppleResultEngagedDays_, *a1);
}

id sub_223B5B050@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_webEngagedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5B084(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWebEngagedDays_, *a1);
}

id sub_223B5B098@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_voiceSearchDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5B0CC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVoiceSearchDays_, *a1);
}

id sub_223B5B0E0@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_numSearchEngagements);
  *a2 = result;
  return result;
}

id sub_223B5B114(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNumSearchEngagements_, *a1);
}

id sub_223B5B128@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_activeDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5B15C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setActiveDays_, *a1);
}

void static PARUsageEvent.entityName.getter()
{
}

uint64_t static PARUsageEvent.clientSearchKeyPath.getter()
{
  return 0x6E49746E65696C63;
}

id PARUsageEvent.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

uint64_t type metadata accessor for PARUsageEvent()
{
  return self;
}

id PARUsageEvent.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PARUsageEvent);
}

uint64_t sub_223B5B248()
{
  return 0x6567617355524150;
}

id sub_223B5B26C()
{
  return objc_msgSend(*v0, sel_clientIntVal);
}

id sub_223B5B27C()
{
  return objc_msgSend(*v0, sel_invokedDays);
}

id sub_223B5B2A0()
{
  return objc_msgSend(*v0, sel_zkwEngagedDays);
}

id sub_223B5B2C4()
{
  return objc_msgSend(*v0, sel_searchedDays);
}

id sub_223B5B2E8()
{
  return objc_msgSend(*v0, sel_suggestionOrAppleResultEngagedDays);
}

id sub_223B5B30C()
{
  return objc_msgSend(*v0, sel_webEngagedDays);
}

id sub_223B5B330()
{
  return objc_msgSend(*v0, sel_voiceSearchDays);
}

id sub_223B5B354()
{
  return objc_msgSend(*v0, sel_numSearchEngagements);
}

id sub_223B5B364()
{
  return objc_msgSend(*v0, sel_activeDays);
}

id sub_223B5B388@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_client);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B3BC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setClient_, *a1);
}

id sub_223B5B3D0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_go);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B404(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGo_, *a1);
}

id sub_223B5B418@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isSuggestion);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5B44C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsSuggestion_, *a1);
}

id sub_223B5B460@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isTopHit);
  *a2 = (_BYTE)result;
  return result;
}

id sub_223B5B494(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsTopHit_, *a1);
}

id sub_223B5B4A8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_tap);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B4DC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTap_, *a1);
}

unint64_t static PARSessionEngagementsByTrigger.entityName.getter()
{
  return 0xD00000000000001ELL;
}

id PARSessionEngagementsByTrigger.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

uint64_t type metadata accessor for PARSessionEngagementsByTrigger()
{
  return self;
}

id PARSessionEngagementsByTrigger.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PARSessionEngagementsByTrigger);
}

uint64_t sub_223B5B5B0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PARSessionEngagementsByTrigger();
  uint64_t result = sub_223B5E660();
  *a1 = result;
  return result;
}

unint64_t sub_223B5B5F0()
{
  return 0xD00000000000001ELL;
}

id sub_223B5B610()
{
  return objc_msgSend(*v0, sel_client);
}

id sub_223B5B634()
{
  return objc_msgSend(*v0, sel_go);
}

id sub_223B5B658()
{
  return objc_msgSend(*v0, sel_isSuggestion);
}

id sub_223B5B67C()
{
  return objc_msgSend(*v0, sel_isTopHit);
}

id sub_223B5B6A0()
{
  return objc_msgSend(*v0, sel_tap);
}

id sub_223B5B6C4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_image);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B6F8(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setImage_, *a1);
}

id sub_223B5B70C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_other);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B740(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOther_, *a1);
}

id sub_223B5B754@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_querySuggestion);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B788(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setQuerySuggestion_, *a1);
}

id sub_223B5B79C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_recentResult);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B7D0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRecentResult_, *a1);
}

id sub_223B5B7E4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_zkw);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5B818(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setZkw_, *a1);
}

unint64_t static PARImagesPropensity.entityName.getter()
{
  return OUTLINED_FUNCTION_0();
}

id PARImagesPropensity.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

uint64_t type metadata accessor for PARImagesPropensity()
{
  return self;
}

id PARImagesPropensity.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PARImagesPropensity);
}

uint64_t sub_223B5B8DC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PARImagesPropensity();
  uint64_t result = sub_223B5E660();
  *a1 = result;
  return result;
}

unint64_t sub_223B5B91C()
{
  return 0xD000000000000013;
}

id sub_223B5B93C()
{
  return objc_msgSend(*v0, sel_image);
}

id sub_223B5B960()
{
  return objc_msgSend(*v0, sel_other);
}

id sub_223B5B984()
{
  return objc_msgSend(*v0, sel_querySuggestion);
}

id sub_223B5B9A8()
{
  return objc_msgSend(*v0, sel_recentResult);
}

id sub_223B5B9CC()
{
  return objc_msgSend(*v0, sel_zkw);
}

id sub_223B5B9F0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_goToSite);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BA24(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGoToSite_, *a1);
}

id sub_223B5BA38@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_localGoto);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BA6C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLocalGoto_, *a1);
}

id sub_223B5BA80@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_localTap);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BAB4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLocalTap_, *a1);
}

id sub_223B5BAC8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecAppStore);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BAFC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecAppStore_, *a1);
}

id sub_223B5BB10@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecGoto);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BB44(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecGoto_, *a1);
}

id sub_223B5BB58@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecMaps);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BB8C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecMaps_, *a1);
}

id sub_223B5BBA0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecNews);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BBD4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecNews_, *a1);
}

id sub_223B5BBE8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecOther);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BC1C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecOther_, *a1);
}

id sub_223B5BC30@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecStocks);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BC64(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecStocks_, *a1);
}

id sub_223B5BC78@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecTap);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BCAC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecTap_, *a1);
}

id sub_223B5BCC0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecWeather);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BCF4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecWeather_, *a1);
}

id sub_223B5BD08@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecWeb);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BD3C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecWeb_, *a1);
}

id sub_223B5BD50@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsecWiki);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BD84(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecWiki_, *a1);
}

id sub_223B5BD98@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_thirdPartyCompletionOrRecentSearch);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BDCC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyCompletionOrRecentSearch_, *a1);
}

id sub_223B5BDE0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_thirdPartyGoto);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BE14(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyGoto_, *a1);
}

id sub_223B5BE28@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_thirdPartyTap);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5BE5C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyTap_, *a1);
}

unint64_t static PARSafariPropensity.entityName.getter()
{
  return OUTLINED_FUNCTION_0();
}

id PARSafariPropensity.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

uint64_t type metadata accessor for PARSafariPropensity()
{
  return self;
}

id PARSafariPropensity.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PARSafariPropensity);
}

uint64_t sub_223B5BF20@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PARSafariPropensity();
  uint64_t result = sub_223B5E660();
  *a1 = result;
  return result;
}

unint64_t sub_223B5BF60()
{
  return 0xD000000000000013;
}

id sub_223B5BF80()
{
  return objc_msgSend(*v0, sel_goToSite);
}

id sub_223B5BFA4()
{
  return objc_msgSend(*v0, sel_localGoto);
}

id sub_223B5BFC8()
{
  return objc_msgSend(*v0, sel_localTap);
}

id sub_223B5BFEC()
{
  return objc_msgSend(*v0, sel_parsecGoto);
}

id sub_223B5C010()
{
  return objc_msgSend(*v0, sel_parsecTap);
}

id sub_223B5C034()
{
  return objc_msgSend(*v0, sel_thirdPartyCompletionOrRecentSearch);
}

id sub_223B5C058()
{
  return objc_msgSend(*v0, sel_thirdPartyGoto);
}

id sub_223B5C07C()
{
  return objc_msgSend(*v0, sel_thirdPartyTap);
}

id sub_223B5C0A0()
{
  return objc_msgSend(*v0, sel_parsecWeb);
}

id sub_223B5C0C4()
{
  return objc_msgSend(*v0, sel_parsecAppStore);
}

id sub_223B5C0E8()
{
  return objc_msgSend(*v0, sel_parsecMaps);
}

id sub_223B5C10C()
{
  return objc_msgSend(*v0, sel_parsecWiki);
}

id sub_223B5C130()
{
  return objc_msgSend(*v0, sel_parsecNews);
}

id sub_223B5C154()
{
  return objc_msgSend(*v0, sel_parsecStocks);
}

id sub_223B5C178()
{
  return objc_msgSend(*v0, sel_parsecWeather);
}

id sub_223B5C19C()
{
  return objc_msgSend(*v0, sel_parsecOther);
}

id sub_223B5C1C0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_appLaunch);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C1F4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAppLaunch_, *a1);
}

id sub_223B5C208@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_onDeviceAddressBookData);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C23C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOnDeviceAddressBookData_, *a1);
}

id sub_223B5C250@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_onDeviceOtherPersonalData);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C284(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOnDeviceOtherPersonalData_, *a1);
}

id sub_223B5C298@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parsec);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C2CC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsec_, *a1);
}

id sub_223B5C2E0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_punchout);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C314(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPunchout_, *a1);
}

id sub_223B5C328@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_siriSuggestions);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C35C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriSuggestions_, *a1);
}

id sub_223B5C370@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_thirdPartyInAppContent);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C3A4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyInAppContent_, *a1);
}

uint64_t sub_223B5C3B8(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_timestamp);
  if (v1)
  {
    id v2 = v1;
    sub_223B5E5F0();
  }
  sub_223B5E600();
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
}

void sub_223B5C42C()
{
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267FBB7B0);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_223B5CB50(v1, (uint64_t)v3);
  uint64_t v4 = *v0;
  uint64_t v5 = sub_223B5E600();
  uint64_t v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v5) != 1)
  {
    uint64_t v6 = (void *)sub_223B5E5E0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  }
  objc_msgSend(v4, sel_setTimestamp_, v6);
}

id sub_223B5C528@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_webSuggestions);
  *a2 = (_WORD)result;
  return result;
}

id sub_223B5C55C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWebSuggestions_, *a1);
}

unint64_t static PARSpotlightPropensity.entityName.getter()
{
  return 0xD000000000000016;
}

id _s11ParsecModel8PAREventC6entity10insertIntoACSo19NSEntityDescriptionC_So22NSManagedObjectContextCSgtcfC_0()
{
  OUTLINED_FUNCTION_2();
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithEntity_insertIntoManagedObjectContext_, v2, v0);

  return v3;
}

id PARSpotlightPropensity.init(entity:insertInto:)()
{
  return sub_223B5C5FC();
}

id sub_223B5C5FC()
{
  OUTLINED_FUNCTION_2();
  v6.receiver = v1;
  v6.super_class = (Class)v3();
  id v4 = objc_msgSendSuper2(&v6, sel_initWithEntity_insertIntoManagedObjectContext_, v2, v0);

  return v4;
}

uint64_t type metadata accessor for PARSpotlightPropensity()
{
  return self;
}

id PARSpotlightPropensity.__deallocating_deinit()
{
  return sub_223B5C6E0(type metadata accessor for PARSpotlightPropensity);
}

id sub_223B5C6E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_223B5C718()
{
  return MEMORY[0x263F8D1F8];
}

uint64_t sub_223B5C72C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PARSpotlightPropensity();
  uint64_t result = sub_223B5E660();
  *a1 = result;
  return result;
}

unint64_t sub_223B5C76C()
{
  return 0xD000000000000016;
}

id sub_223B5C78C()
{
  return objc_msgSend(*v0, sel_appLaunch);
}

id sub_223B5C7B0()
{
  return objc_msgSend(*v0, sel_onDeviceAddressBookData);
}

id sub_223B5C7D4()
{
  return objc_msgSend(*v0, sel_onDeviceOtherPersonalData);
}

id sub_223B5C7F8()
{
  return objc_msgSend(*v0, sel_parsec);
}

id sub_223B5C81C()
{
  return objc_msgSend(*v0, sel_punchout);
}

id sub_223B5C840()
{
  return objc_msgSend(*v0, sel_siriSuggestions);
}

id sub_223B5C864()
{
  return objc_msgSend(*v0, sel_thirdPartyInAppContent);
}

id sub_223B5C888()
{
  return objc_msgSend(*v0, sel_webSuggestions);
}

uint64_t sub_223B5C8AC()
{
  id v1 = objc_msgSend(*v0, sel_timestamp);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_223B5E5F0();
  }
  sub_223B5E600();
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
}

char *keypath_get_selector_timestamp()
{
  return sel_timestamp;
}

char *keypath_get_selector_type()
{
  return sel_type;
}

char *keypath_get_selector_clientIntVal()
{
  return sel_clientIntVal;
}

char *keypath_get_selector_invokedDays()
{
  return sel_invokedDays;
}

char *keypath_get_selector_zkwEngagedDays()
{
  return sel_zkwEngagedDays;
}

char *keypath_get_selector_searchedDays()
{
  return sel_searchedDays;
}

char *keypath_get_selector_suggestionOrAppleResultEngagedDays()
{
  return sel_suggestionOrAppleResultEngagedDays;
}

char *keypath_get_selector_webEngagedDays()
{
  return sel_webEngagedDays;
}

char *keypath_get_selector_voiceSearchDays()
{
  return sel_voiceSearchDays;
}

char *keypath_get_selector_numSearchEngagements()
{
  return sel_numSearchEngagements;
}

char *keypath_get_selector_activeDays()
{
  return sel_activeDays;
}

char *keypath_get_selector_client()
{
  return sel_client;
}

char *keypath_get_selector_go()
{
  return sel_go;
}

char *keypath_get_selector_isSuggestion()
{
  return sel_isSuggestion;
}

char *keypath_get_selector_isTopHit()
{
  return sel_isTopHit;
}

char *keypath_get_selector_tap()
{
  return sel_tap;
}

char *keypath_get_selector_image()
{
  return sel_image;
}

char *keypath_get_selector_other()
{
  return sel_other;
}

char *keypath_get_selector_querySuggestion()
{
  return sel_querySuggestion;
}

char *keypath_get_selector_recentResult()
{
  return sel_recentResult;
}

char *keypath_get_selector_zkw()
{
  return sel_zkw;
}

char *keypath_get_selector_goToSite()
{
  return sel_goToSite;
}

char *keypath_get_selector_localGoto()
{
  return sel_localGoto;
}

char *keypath_get_selector_localTap()
{
  return sel_localTap;
}

char *keypath_get_selector_parsecAppStore()
{
  return sel_parsecAppStore;
}

char *keypath_get_selector_parsecGoto()
{
  return sel_parsecGoto;
}

char *keypath_get_selector_parsecMaps()
{
  return sel_parsecMaps;
}

char *keypath_get_selector_parsecNews()
{
  return sel_parsecNews;
}

char *keypath_get_selector_parsecOther()
{
  return sel_parsecOther;
}

char *keypath_get_selector_parsecStocks()
{
  return sel_parsecStocks;
}

char *keypath_get_selector_parsecTap()
{
  return sel_parsecTap;
}

char *keypath_get_selector_parsecWeather()
{
  return sel_parsecWeather;
}

char *keypath_get_selector_parsecWeb()
{
  return sel_parsecWeb;
}

char *keypath_get_selector_parsecWiki()
{
  return sel_parsecWiki;
}

char *keypath_get_selector_thirdPartyCompletionOrRecentSearch()
{
  return sel_thirdPartyCompletionOrRecentSearch;
}

char *keypath_get_selector_thirdPartyGoto()
{
  return sel_thirdPartyGoto;
}

char *keypath_get_selector_thirdPartyTap()
{
  return sel_thirdPartyTap;
}

char *keypath_get_selector_appLaunch()
{
  return sel_appLaunch;
}

char *keypath_get_selector_onDeviceAddressBookData()
{
  return sel_onDeviceAddressBookData;
}

char *keypath_get_selector_onDeviceOtherPersonalData()
{
  return sel_onDeviceOtherPersonalData;
}

char *keypath_get_selector_parsec()
{
  return sel_parsec;
}

char *keypath_get_selector_punchout()
{
  return sel_punchout;
}

char *keypath_get_selector_siriSuggestions()
{
  return sel_siriSuggestions;
}

char *keypath_get_selector_thirdPartyInAppContent()
{
  return sel_thirdPartyInAppContent;
}

char *keypath_get_selector_webSuggestions()
{
  return sel_webSuggestions;
}

uint64_t dispatch thunk of static PAREntity.entityName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_223B5CB50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267FBB7B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

id sub_223B5CBE0()
{
  id v1 = (void *)sub_223B5E610();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

ParsecModel::PMEntityProperty_optional __swiftcall PMEntityProperty.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  uint64_t v3 = sub_223B5E690();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 26;
  switch(v3)
  {
    case 0:
      goto LABEL_27;
    case 1:
      char v5 = 1;
      goto LABEL_27;
    case 2:
      char v5 = 2;
      goto LABEL_27;
    case 3:
      char v5 = 3;
      goto LABEL_27;
    case 4:
      char v5 = 4;
      goto LABEL_27;
    case 5:
      char v5 = 5;
      goto LABEL_27;
    case 6:
      char v5 = 6;
      goto LABEL_27;
    case 7:
      char v5 = 7;
      goto LABEL_27;
    case 8:
      char v5 = 8;
      goto LABEL_27;
    case 9:
      char v5 = 9;
      goto LABEL_27;
    case 10:
      char v5 = 10;
      goto LABEL_27;
    case 11:
      char v5 = 11;
      goto LABEL_27;
    case 12:
      char v5 = 12;
      goto LABEL_27;
    case 13:
      char v5 = 13;
      goto LABEL_27;
    case 14:
      char v5 = 14;
      goto LABEL_27;
    case 15:
      char v5 = 15;
      goto LABEL_27;
    case 16:
      char v5 = 16;
      goto LABEL_27;
    case 17:
      char v5 = 17;
      goto LABEL_27;
    case 18:
      char v5 = 18;
      goto LABEL_27;
    case 19:
      char v5 = 19;
      goto LABEL_27;
    case 20:
      char v5 = 20;
      goto LABEL_27;
    case 21:
      char v5 = 21;
      goto LABEL_27;
    case 22:
      char v5 = 22;
      goto LABEL_27;
    case 23:
      char v5 = 23;
      goto LABEL_27;
    case 24:
      char v5 = 24;
      goto LABEL_27;
    case 25:
      char v5 = 25;
LABEL_27:
      char v6 = v5;
      break;
    case 26:
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    case 31:
      char v6 = 31;
      break;
    case 32:
      char v6 = 32;
      break;
    case 33:
      char v6 = 33;
      break;
    case 34:
      char v6 = 34;
      break;
    case 35:
      char v6 = 35;
      break;
    case 36:
      char v6 = 36;
      break;
    case 37:
      char v6 = 37;
      break;
    case 38:
      char v6 = 38;
      break;
    case 39:
      char v6 = 39;
      break;
    case 40:
      char v6 = 40;
      break;
    case 41:
      char v6 = 41;
      break;
    case 42:
      char v6 = 42;
      break;
    case 43:
      char v6 = 43;
      break;
    default:
      char v6 = 44;
      break;
  }
  char *v2 = v6;
  return result;
}

void *static PMEntityProperty.allCases.getter()
{
  return &unk_26D746C48;
}

uint64_t PMEntityProperty.rawValue.getter()
{
  uint64_t result = 0x636E75614C707061;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x746E65696C63;
      break;
    case 2:
      uint64_t result = 0x6E49746E65696C63;
      break;
    case 3:
      uint64_t result = 28519;
      break;
    case 4:
      uint64_t result = 0x657469536F546F67;
      break;
    case 5:
      uint64_t result = 0x6567616D69;
      break;
    case 6:
      uint64_t result = 0x4464656B6F766E69;
      break;
    case 7:
      uint64_t result = 0x7365676775537369;
      break;
    case 8:
      uint64_t result = 0x746948706F547369;
      break;
    case 9:
      uint64_t result = 0x746F476C61636F6CLL;
      break;
    case 0xA:
      uint64_t result = 0x7061546C61636F6CLL;
      break;
    case 0xB:
      uint64_t result = 0xD000000000000014;
      break;
    case 0xC:
      uint64_t result = 0xD000000000000017;
      break;
    case 0xD:
      uint64_t result = 0xD000000000000019;
      break;
    case 0xE:
      uint64_t result = 0x726568746FLL;
      break;
    case 0xF:
      uint64_t result = 0x636573726170;
      break;
    case 0x10:
      uint64_t result = 0x7041636573726170;
      break;
    case 0x11:
      uint64_t result = 0x6F47636573726170;
      break;
    case 0x12:
      uint64_t result = 0x614D636573726170;
      break;
    case 0x13:
      uint64_t result = 0x654E636573726170;
      break;
    case 0x14:
      uint64_t result = 0x744F636573726170;
      break;
    case 0x15:
      uint64_t result = 0x7453636573726170;
      break;
    case 0x16:
      uint64_t result = 0x6154636573726170;
      break;
    case 0x17:
      uint64_t result = 0x6557636573726170;
      break;
    case 0x18:
      uint64_t result = 0x6557636573726170;
      break;
    case 0x19:
      uint64_t result = 0x6957636573726170;
      break;
    case 0x1A:
      uint64_t result = 0x74756F68636E7570;
      break;
    case 0x1B:
      uint64_t result = 0x6775537972657571;
      break;
    case 0x1C:
      uint64_t result = 0x6552746E65636572;
      break;
    case 0x1D:
      uint64_t result = 0x6465686372616573;
      break;
    case 0x1E:
      uint64_t result = 0x6767755369726973;
      break;
    case 0x1F:
    case 0x21:
      uint64_t result = 0xD000000000000022;
      break;
    case 0x20:
      uint64_t result = 7364980;
      break;
    case 0x22:
    case 0x24:
      uint64_t result = 0x7261506472696874;
      break;
    case 0x23:
      uint64_t result = 0xD000000000000016;
      break;
    case 0x25:
      uint64_t result = 0x6D617473656D6974;
      break;
    case 0x26:
      uint64_t result = 1701869940;
      break;
    case 0x27:
      uint64_t result = 0x6165536563696F76;
      break;
    case 0x28:
      unsigned int v2 = 1164076407;
      goto LABEL_45;
    case 0x29:
      uint64_t result = 0x6567677553626577;
      break;
    case 0x2A:
      uint64_t result = 7826298;
      break;
    case 0x2B:
      unsigned int v2 = 1165454202;
LABEL_45:
      uint64_t result = v2 | 0x6761676E00000000;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_223B5D4CC()
{
  return sub_223B5D4D8();
}

uint64_t sub_223B5D4D8()
{
  uint64_t v0 = PMEntityProperty.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == PMEntityProperty.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_223B5E680();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

ParsecModel::PMEntityProperty_optional sub_223B5D570(Swift::String *a1)
{
  return PMEntityProperty.init(rawValue:)(*a1);
}

uint64_t sub_223B5D57C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PMEntityProperty.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_223B5D5A8()
{
  unint64_t result = qword_267FBB820;
  if (!qword_267FBB820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FBB820);
  }
  return result;
}

uint64_t sub_223B5D5F4()
{
  return sub_223B5D5FC();
}

uint64_t sub_223B5D5FC()
{
  return sub_223B5D6D0();
}

uint64_t sub_223B5D608()
{
  return sub_223B5D610();
}

uint64_t sub_223B5D610()
{
  PMEntityProperty.rawValue.getter();
  sub_223B5E630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_223B5D670()
{
  return sub_223B5D6D0();
}

unint64_t sub_223B5D67C()
{
  unint64_t result = qword_267FBB828;
  if (!qword_267FBB828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267FBB830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FBB828);
  }
  return result;
}

uint64_t sub_223B5D6D0()
{
  return sub_223B5E6B0();
}

void sub_223B5D734(void *a1@<X8>)
{
  *a1 = &unk_26D746C48;
}

uint64_t dispatch thunk of PMTimestampedEntity.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMFlushEvent.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMUsageEvent.clientIntVal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMUsageEvent.invokedDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PMUsageEvent.zkwEngagedDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PMUsageEvent.searchedDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PMUsageEvent.suggestionOrAppleResultEngagedDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PMUsageEvent.webEngagedDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PMUsageEvent.voiceSearchDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PMUsageEvent.numSearchEngagements.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PMUsageEvent.activeDays.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of PMSessionEngagementsByTrigger.client.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMSessionEngagementsByTrigger.go.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PMSessionEngagementsByTrigger.isSuggestion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PMSessionEngagementsByTrigger.isTopHit.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PMSessionEngagementsByTrigger.tap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PMImagesPropensity.image.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMImagesPropensity.other.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PMImagesPropensity.querySuggestion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PMImagesPropensity.recentResult.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PMImagesPropensity.zkw.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecWeb.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecAppStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecMaps.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecWiki.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecNews.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecStocks.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecWeather.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PMParsecPropensity.parsecOther.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PMSafariPropensity.goToSite.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMSafariPropensity.localGoto.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PMSafariPropensity.localTap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PMSafariPropensity.other.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PMSafariPropensity.parsecGoto.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PMSafariPropensity.parsecTap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PMSafariPropensity.thirdPartyCompletionOrRecentSearch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PMSafariPropensity.thirdPartyGoto.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PMSafariPropensity.thirdPartyTap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.appLaunch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.onDeviceAddressBookData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.onDeviceOtherPersonalData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.other.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.parsec.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.punchout.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.querySuggestion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.siriSuggestions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.thirdPartyInAppContent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.webSuggestions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t getEnumTagSinglePayload for PMEntityProperty(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD5)
  {
    if (a2 + 43 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 43) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 44;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2C;
  int v5 = v6 - 44;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PMEntityProperty(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 43 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 43) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD4)
  {
    unsigned int v6 = ((a2 - 213) >> 8) + 1;
    *unint64_t result = a2 + 43;
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
        JUMPOUT(0x223B5DC58);
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
          *unint64_t result = a2 + 43;
        break;
    }
  }
  return result;
}

uint64_t sub_223B5DC80(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_223B5DC88(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PMEntityProperty()
{
  return &type metadata for PMEntityProperty;
}

void *static PARUsageEventMigration.tracker.getter()
{
  swift_beginAccess();
  uint64_t v0 = off_267FBB838;
  sub_223B5DCF8((uint64_t)off_267FBB838);
  return v0;
}

uint64_t sub_223B5DCF8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t static PARUsageEventMigration.tracker.setter(void *a1, uint64_t a2)
{
  swift_beginAccess();
  unsigned int v4 = off_267FBB838;
  uint64_t v5 = qword_267FBB840;
  off_267FBB838 = a1;
  qword_267FBB840 = a2;
  return sub_223B5DD64((uint64_t)v4, v5);
}

uint64_t sub_223B5DD64(uint64_t result, uint64_t a2)
{
  if (result) {
    return MEMORY[0x270FA0520](a2);
  }
  return result;
}

uint64_t (*static PARUsageEventMigration.tracker.modify())()
{
  return j__swift_endAccess;
}

id sub_223B5DDD0(void *a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_223B5E424(a2);
  if (!v8) {
    goto LABEL_19;
  }
  if (v7 == 0x6567617355524150 && v8 == 0xED0000746E657645)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_223B5E680();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
LABEL_19:
      *(void *)&long long v37 = 0;
      v35.receiver = v3;
      v35.super_class = (Class)type metadata accessor for PARUsageEventMigration();
      unsigned int v27 = objc_msgSendSuper2(&v35, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a1, a2, a3, &v37);
      v28 = (void *)v37;
      if (v27)
      {
        swift_beginAccess();
        v29 = (void (*)(void))off_267FBB838;
        if (off_267FBB838)
        {
          uint64_t v30 = qword_267FBB840;
          id v31 = v28;
          sub_223B5DCF8((uint64_t)v29);
          v29(0);
          return (id)sub_223B5DD64((uint64_t)v29, v30);
        }
        else
        {
          return v28;
        }
      }
      else
      {
        id v33 = (id)v37;
        sub_223B5E5D0();

        return (id)swift_willThrow();
      }
    }
  }
  v11 = (void *)sub_223B5E610();
  id v12 = objc_msgSend(a1, sel_valueForKey_, v11);

  if (v12)
  {
    sub_223B5E650();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v36, 0, sizeof(v36));
  }
  sub_223B5E4AC((uint64_t)v36, (uint64_t)&v37);
  if (!v38)
  {
    sub_223B5E514((uint64_t)&v37);
    goto LABEL_19;
  }
  sub_223B5E584(0, &qword_267FBB850);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_19;
  }
  v13 = (void *)OUTLINED_FUNCTION_0_0();
  id v14 = objc_msgSend(v34, sel_valueForKey_, v13);

  if (!v14)
  {

    goto LABEL_19;
  }
  sub_223B5E650();
  swift_unknownObjectRelease();
  sub_223B5E574(v36, &v37);
  v15 = self;
  v16 = (void *)sub_223B5E610();
  id v17 = objc_msgSend(a3, sel_destinationContext);
  id v18 = objc_msgSend(v15, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v16, v17);

  v19 = (void *)OUTLINED_FUNCTION_1_0();
  id v20 = objc_msgSend(a1, (SEL)0x2646D0698, v19);

  v21 = (void *)OUTLINED_FUNCTION_1_0();
  objc_msgSend(v18, sel_setValue_forKey_, v20, v21);
  swift_unknownObjectRelease();

  __swift_project_boxed_opaque_existential_0(&v37, v38);
  sub_223B5E670();
  uint64_t v22 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(v22);
  swift_unknownObjectRelease();

  sub_223B5E584(0, &qword_267FBB858);
  v23 = (void *)sub_223B5E640();
  uint64_t v24 = sub_223B5E610();
  OUTLINED_FUNCTION_2_0(v24);

  objc_msgSend(a3, sel_associateSourceInstance_withDestinationInstance_forEntityMapping_, a1, v18, a2);
  swift_beginAccess();
  v25 = (void (*)(uint64_t))off_267FBB838;
  if (off_267FBB838)
  {
    uint64_t v26 = qword_267FBB840;
    swift_retain();
    v25(1);

    sub_223B5DD64((uint64_t)v25, v26);
  }
  else
  {

    id v18 = v34;
  }

  return (id)__swift_destroy_boxed_opaque_existential_0(&v37);
}

id PARUsageEventMigration.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PARUsageEventMigration.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PARUsageEventMigration();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PARUsageEventMigration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PARUsageEventMigration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_223B5E424(void *a1)
{
  id v1 = objc_msgSend(a1, sel_destinationEntityName);
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  uint64_t v3 = sub_223B5E620();

  return v3;
}

uint64_t type metadata accessor for PARUsageEventMigration()
{
  return self;
}

uint64_t sub_223B5E4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267FBB848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_223B5E514(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267FBB848);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_223B5E574(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_223B5E584(uint64_t a1, unint64_t *a2)
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

uint64_t sub_223B5E5C0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_223B5E5D0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_223B5E5E0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_223B5E5F0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_223B5E600()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_223B5E610()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_223B5E620()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_223B5E630()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_223B5E640()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_223B5E650()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_223B5E660()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_223B5E670()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_223B5E680()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_223B5E690()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_223B5E6A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_223B5E6B0()
{
  return MEMORY[0x270F9FC90]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}