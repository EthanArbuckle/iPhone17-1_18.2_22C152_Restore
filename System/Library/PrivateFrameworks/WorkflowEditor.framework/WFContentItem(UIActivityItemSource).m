@interface WFContentItem(UIActivityItemSource)
- (__CFString)activityViewController:()UIActivityItemSource subjectForActivityType:;
- (id)activityViewController:()UIActivityItemSource dataTypeIdentifierForActivityType:;
- (id)activityViewController:()UIActivityItemSource itemForActivityType:;
- (id)activityViewControllerLinkMetadata:()UIActivityItemSource;
- (id)activityViewControllerPlaceholderItem:()UIActivityItemSource;
@end

@implementation WFContentItem(UIActivityItemSource)

- (id)activityViewControllerLinkMetadata:()UIActivityItemSource
{
  v2 = objc_opt_new();
  if ([a1 shouldUseObjectRepresentation])
  {
    v3 = [a1 preferredObjectType];
    int v4 = [v3 conformsToClass:objc_opt_class()];

    if (v4)
    {
      v5 = objc_opt_new();
      v6 = [a1 name];
      [v5 setName:v6];

      v7 = (id *)MEMORY[0x263F1DC20];
LABEL_11:
      v20 = [*v7 identifier];
      [v5 setType:v20];

      [v2 setSpecialization:v5];
      goto LABEL_12;
    }
    v14 = [a1 preferredObjectType];
    int v15 = [v14 conformsToClass:objc_opt_class()];

    if (!v15)
    {
      v16 = [a1 internalRepresentationType];
      if ([v16 conformsToClass:objc_opt_class()])
      {
      }
      else
      {
        v17 = [a1 internalRepresentationType];
        int v18 = [v17 conformsToClass:objc_opt_class()];

        if (!v18) {
          goto LABEL_13;
        }
      }
      v5 = objc_opt_new();
      v19 = [a1 name];
      [v5 setName:v19];

      v7 = (id *)MEMORY[0x263F1DB18];
      goto LABEL_11;
    }
    v5 = [a1 objectForClass:objc_opt_class()];
    [v2 setURL:v5];
  }
  else
  {
    v8 = [a1 preferredFileType];
    v5 = [a1 fileRepresentationForType:v8];

    v9 = objc_opt_new();
    v10 = [v5 wfName];
    [v9 setName:v10];

    v11 = [v5 wfType];
    v12 = [v11 utType];
    v13 = [v12 identifier];
    [v9 setType:v13];

    objc_msgSend(v9, "setSize:", objc_msgSend(v5, "fileSize"));
    [v2 setSpecialization:v9];
  }
LABEL_12:

LABEL_13:
  return v2;
}

- (__CFString)activityViewController:()UIActivityItemSource subjectForActivityType:
{
  id v5 = a4;
  v6 = [a1 name];
  int v7 = [v5 isEqualToString:*MEMORY[0x263F1CFC8]];

  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([a1 string],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 hasPrefix:v6],
        v8,
        (v9 & 1) != 0))
  {
    v10 = &stru_26E7AB6D0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)activityViewController:()UIActivityItemSource itemForActivityType:
{
  if ([a1 shouldUseObjectRepresentation])
  {
    v2 = [a1 preferredObjectType];
    uint64_t v3 = objc_msgSend(a1, "objectForClass:", objc_msgSend(v2, "objectClass"));
  }
  else
  {
    int v4 = [a1 preferredFileType];
    v2 = [a1 fileRepresentationForType:v4];

    if ([v2 representationType]) {
      [v2 fileURL];
    }
    else {
    uint64_t v3 = [v2 data];
    }
  }
  id v5 = (void *)v3;

  return v5;
}

- (id)activityViewController:()UIActivityItemSource dataTypeIdentifierForActivityType:
{
  if ([a1 shouldUseObjectRepresentation])
  {
    v2 = [a1 preferredObjectType];
    if ([v2 conformsToClass:objc_opt_class()])
    {
      uint64_t v3 = (id *)MEMORY[0x263F1DD08];
LABEL_7:
      uint64_t v4 = [*v3 identifier];
      goto LABEL_10;
    }
    if (([v2 conformsToClass:objc_opt_class()] & 1) != 0
      || [v2 conformsToClass:objc_opt_class()])
    {
      uint64_t v3 = (id *)MEMORY[0x263F1DB18];
      goto LABEL_7;
    }
  }
  v2 = [a1 preferredFileType];
  uint64_t v4 = [v2 string];
LABEL_10:
  id v5 = (void *)v4;

  return v5;
}

- (id)activityViewControllerPlaceholderItem:()UIActivityItemSource
{
  if ([a1 shouldUseObjectRepresentation])
  {
    v2 = [a1 preferredObjectType];
    uint64_t v3 = objc_msgSend(a1, "objectForClass:", objc_msgSend(v2, "objectClass"));
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EFF8F8] data];
  }
  return v3;
}

@end