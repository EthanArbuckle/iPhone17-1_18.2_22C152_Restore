@interface SFSearchResult(SafariSharedExtras)
+ (id)safari_sfSearchResultWithUniqueIdentifier;
- (id)_firstCardSectionOfClass:()SafariSharedExtras ofCard:;
- (id)safari_firstInlineCardSectionOfClass:()SafariSharedExtras;
- (id)safari_identifierForCaching;
- (id)uuidString;
- (uint64_t)engagementDestination;
- (uint64_t)parsecDomainIdentifier;
@end

@implementation SFSearchResult(SafariSharedExtras)

+ (id)safari_sfSearchResultWithUniqueIdentifier
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
  v1 = [MEMORY[0x1E4F29128] UUID];
  v2 = [v1 UUIDString];
  [v0 setIdentifier:v2];

  return v0;
}

- (id)safari_identifierForCaching
{
  v2 = [a1 identifier];
  v3 = NSNumber;
  v4 = [a1 completedQuery];
  v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v6 = [v5 stringValue];
  v7 = [v2 stringByAppendingString:v6];

  return v7;
}

- (uint64_t)parsecDomainIdentifier
{
  return 0;
}

- (id)uuidString
{
  v2 = objc_getAssociatedObject(a1, sel_uuidString);
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    v2 = [v3 UUIDString];

    objc_setAssociatedObject(a1, sel_uuidString, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)engagementDestination
{
  v2 = [a1 card];
  v3 = [v2 cardSections];
  if ([v3 count])
  {

    return 1;
  }
  v4 = [a1 mapsData];

  if (v4) {
    return 1;
  }
  v6 = [a1 punchout];
  v7 = [v6 urls];
  BOOL v8 = [v7 count] != 0;

  return 2 * v8;
}

- (id)safari_firstInlineCardSectionOfClass:()SafariSharedExtras
{
  v5 = [a1 inlineCard];
  v6 = [a1 _firstCardSectionOfClass:a3 ofCard:v5];

  return v6;
}

- (id)_firstCardSectionOfClass:()SafariSharedExtras ofCard:
{
  id v5 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  id v15 = 0;
  v6 = [v5 cardSections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SFSearchResult_SafariSharedExtras___firstCardSectionOfClass_ofCard___block_invoke;
  v9[3] = &unk_1E5C9C150;
  v9[4] = &v10;
  v9[5] = a3;
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

@end