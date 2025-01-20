@interface PommesSearchService
- (void)invalidateWithCachedResponse:(id)a3;
- (void)searchInfiEntityWithRequest:(_TtC21SiriInformationSearch22PommesSearchRequestXPC *)a3 completionHandler:(id)a4;
@end

@implementation PommesSearchService

- (void)searchInfiEntityWithRequest:(_TtC21SiriInformationSearch22PommesSearchRequestXPC *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in PommesSearchService.searchInfiEntity(request:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTATu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v14);
  swift_release();
}

- (void)invalidateWithCachedResponse:(id)a3
{
  id v3 = a3;
  swift_retain();
  PommesSearchService.invalidate(cachedResponse:)((uint64_t)v3);

  swift_release();
}

@end