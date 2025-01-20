@interface WFContentItem(Previewing)
- (uint64_t)shouldUseObjectRepresentation;
- (void)prepareForPresentationWithCompletionHandler:()Previewing;
@end

@implementation WFContentItem(Previewing)

- (void)prepareForPresentationWithCompletionHandler:()Previewing
{
  id v4 = a3;
  if ([a1 shouldUseObjectRepresentation])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__WFContentItem_Previewing__prepareForPresentationWithCompletionHandler___block_invoke;
    v11[3] = &unk_264C50AE8;
    v5 = &v12;
    id v12 = v4;
    id v6 = v4;
    v7 = [a1 preferredObjectType];
    objc_msgSend(a1, "getObjectRepresentation:forClass:", v11, objc_msgSend(v7, "objectClass"));
  }
  else
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    v5 = &v10;
    id v10 = v4;
    id v8 = v4;
    v7 = objc_msgSend(a1, "preferredFileType", v9, 3221225472, __73__WFContentItem_Previewing__prepareForPresentationWithCompletionHandler___block_invoke_2, &unk_264C50B10);
    [a1 getFileRepresentation:&v9 forType:v7];
  }
}

- (uint64_t)shouldUseObjectRepresentation
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 0;
  }
  v3 = [a1 preferredObjectType];
  if (([v3 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v3 conformsToClass:objc_opt_class()] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [a1 internalRepresentationType];
    if ([v5 conformsToClass:objc_opt_class()])
    {
      uint64_t v4 = 1;
    }
    else
    {
      id v6 = [a1 internalRepresentationType];
      uint64_t v4 = [v6 conformsToClass:objc_opt_class()];
    }
  }

  return v4;
}

@end