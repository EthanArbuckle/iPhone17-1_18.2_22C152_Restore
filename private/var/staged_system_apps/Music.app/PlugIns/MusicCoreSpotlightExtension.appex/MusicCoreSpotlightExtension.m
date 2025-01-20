uint64_t sub_100003BEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100003CD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_sharedMediaLibraryService(void *a1, const char *a2, ...)
{
  return [a1 sharedMediaLibraryService];
}

id objc_msgSend_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 updateSpotlightIndexMetadataForItemsWithIdentifiers:bundleID:withCompletion:];
}