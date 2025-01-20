@interface SXDocumentController
- (BOOL)requiresLinkedContentForLayout;
- (NSArray)additions;
- (NSArray)orderedImageIdentifiers;
- (NSArray)requiredNonImageResourceURLs;
- (NSArray)requiredResourceURLs;
- (NSMutableDictionary)componentStyles;
- (NSString)shareURL;
- (SXDocument)document;
- (SXDocumentController)initWithDocument:(id)a3 shareURL:(id)a4;
- (SXImageController)imageController;
- (SXJSONObjectMerger)componentStyleMerger;
- (SXMetadata)metadata;
- (UIColor)documentBackgroundColor;
- (UIColor)topBackgroundColor;
- (id)additionsForComponents:(id)a3;
- (id)allResourcesForImageIdentifier:(id)a3;
- (id)componentIdentifierUsingThumbnail;
- (id)componentIdentifierUsingThumbnailInComponents:(id)a3;
- (id)componentLayoutForIdentifier:(id)a3;
- (id)componentStyleForComponent:(id)a3;
- (id)filterImageResources;
- (id)imageResourceForIdentifier:(id)a3;
- (id)mergedObjectsWithIdentifiers:(id)a3 fromDictionary:(id)a4 merger:(id)a5;
- (id)resourceForIdentifier:(id)a3;
- (void)setComponentStyles:(id)a3;
- (void)setImageController:(id)a3;
@end

@implementation SXDocumentController

- (id)componentLayoutForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SXDocumentController *)self document];
  v6 = [v5 componentLayouts];
  v7 = [v6 objectForKey:v4];

  return v7;
}

- (SXDocumentController)initWithDocument:(id)a3 shareURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SXDocumentController;
  v9 = [(SXDocumentController *)&v19 init];
  if (v9)
  {
    v10 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:0];
    componentStyleMerger = v9->_componentStyleMerger;
    v9->_componentStyleMerger = v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    componentStyles = v9->_componentStyles;
    v9->_componentStyles = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong((id *)&v9->_shareURL, a4);
    v14 = [SXImageController alloc];
    v15 = objc_alloc_init(SXColumnCalculator);
    uint64_t v16 = [(SXImageController *)v14 initWithDocumentController:v9 columnCalculator:v15];
    imageController = v9->_imageController;
    v9->_imageController = (SXImageController *)v16;
  }
  return v9;
}

- (NSArray)additions
{
  additions = self->_additions;
  if (!additions)
  {
    id v4 = [(SXDocumentController *)self document];
    v5 = [v4 components];
    v6 = [(SXDocumentController *)self additionsForComponents:v5];
    id v7 = self->_additions;
    self->_additions = v6;

    additions = self->_additions;
  }
  return additions;
}

- (id)componentStyleForComponent:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF980];
  v6 = [v4 classification];
  id v7 = [v6 defaultComponentStyleIdentifiers];
  id v8 = [v5 arrayWithArray:v7];

  v9 = [v4 style];

  if (v9)
  {
    v10 = [v4 style];
    [v8 addObject:v10];
  }
  v11 = [(SXDocumentController *)self document];
  uint64_t v12 = [v11 componentStyles];
  v13 = [(SXDocumentController *)self componentStyleMerger];
  v14 = [(SXDocumentController *)self mergedObjectsWithIdentifiers:v8 fromDictionary:v12 merger:v13];

  return v14;
}

- (id)resourceForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SXDocumentController *)self document];
  v6 = [v5 resources];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (BOOL)requiresLinkedContentForLayout
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SXDocumentController *)self document];
  v3 = [v2 components];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) requiresLinkedContent])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)imageResourceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXDocumentController *)self imageController];
  v6 = [v5 imageResourceForIdentifier:v4];

  return v6;
}

- (id)allResourcesForImageIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXDocumentController *)self imageController];
  v6 = [v5 allResourcesForImageIdentifier:v4];

  return v6;
}

- (NSArray)orderedImageIdentifiers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(SXDocumentController *)self imageController];
  v3 = [v2 allImageResources];

  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "imageIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)requiredResourceURLs
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(SXDocumentController *)self filterImageResources];
  id v4 = [(SXDocumentController *)self imageController];
  id v5 = [v4 allImageResources];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "URL", (void)v16);

        if (v13)
        {
          long long v14 = [v12 URL];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (NSArray)requiredNonImageResourceURLs
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(SXDocumentController *)self filterImageResources];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "URL", (void)v13);

        if (v10)
        {
          long long v11 = [v9 URL];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)filterImageResources
{
  v3 = (void *)MEMORY[0x263F08A98];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 predicateWithFormat:@"(class = %@) OR (class = %@)", v4, objc_opt_class()];
  uint64_t v6 = [(SXDocumentController *)self document];
  uint64_t v7 = [v6 resources];
  uint64_t v8 = [v7 allObjects];
  uint64_t v9 = [v8 filteredArrayUsingPredicate:v5];

  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  long long v11 = [(SXDocumentController *)self document];
  long long v12 = [v11 resources];
  long long v13 = [v12 allObjects];
  long long v14 = [v10 arrayWithArray:v13];

  [v14 removeObjectsInArray:v9];
  return v14;
}

- (id)componentIdentifierUsingThumbnail
{
  v3 = [(SXDocumentController *)self document];
  uint64_t v4 = [v3 components];
  uint64_t v5 = [(SXDocumentController *)self componentIdentifierUsingThumbnailInComponents:v4];

  return v5;
}

- (id)componentIdentifierUsingThumbnailInComponents:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38 = self;
  uint64_t v5 = [(SXDocumentController *)self metadata];
  uint64_t v6 = [v5 thumbnailImageIdentifier];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v8) {
    goto LABEL_27;
  }
  uint64_t v9 = v8;
  uint64_t v10 = off_26464F000;
  uint64_t v39 = *(void *)v41;
  v36 = v6;
  id v37 = v7;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v41 != v39) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v13 = v12;
        long long v14 = [v13 imageIdentifier];
        goto LABEL_9;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        long long v14 = [v13 stillImageIdentifier];
LABEL_9:
        long long v15 = v14;
        int v16 = [v14 isEqualToString:v6];

        if (v16)
        {
          v32 = [v13 identifier];
          goto LABEL_29;
        }
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = v10;
        id v18 = v12;
        long long v19 = [v18 items];
        v20 = [v19 firstObject];

        uint64_t v21 = v20;
        v22 = [v20 imageIdentifier];
        uint64_t v6 = v36;
        int v23 = objc_msgSend(v22, "isEqualToString:");

        if (v23)
        {
          v32 = [v18 identifier];

          id v7 = v37;
          goto LABEL_29;
        }
        uint64_t v10 = v17;
        id v7 = v37;
        goto LABEL_25;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v12;
        uint64_t v21 = -[SXDocumentController componentStyleForComponent:](v38, "componentStyleForComponent:");
        uint64_t v24 = [v21 fill];
        if (v24)
        {
          v25 = (void *)v24;
          v26 = [v21 fill];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          uint64_t v10 = off_26464F000;
          if (isKindOfClass)
          {
            v28 = [v21 fill];
            v29 = [v28 imageIdentifier];
            int v30 = [v29 isEqualToString:v6];

            if (v30)
            {
              v32 = [v35 identifier];

LABEL_35:
LABEL_29:

              goto LABEL_30;
            }

            uint64_t v10 = off_26464F000;
          }
        }
        v31 = [v35 components];
        v32 = [(SXDocumentController *)v38 componentIdentifierUsingThumbnailInComponents:v31];

        if (v32) {
          goto LABEL_35;
        }

LABEL_25:
LABEL_10:
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v33 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
    uint64_t v9 = v33;
  }
  while (v33);
LABEL_27:
  v32 = 0;
LABEL_30:

  return v32;
}

- (SXMetadata)metadata
{
  v2 = [(SXDocumentController *)self document];
  v3 = [v2 metadata];

  return (SXMetadata *)v3;
}

- (UIColor)documentBackgroundColor
{
  v2 = [(SXDocumentController *)self document];
  v3 = [v2 documentStyle];
  id v4 = [v3 backgroundColor];

  return (UIColor *)v4;
}

- (UIColor)topBackgroundColor
{
  v2 = [(SXDocumentController *)self document];
  v3 = [v2 documentStyle];
  id v4 = [v3 topBackgroundColor];

  return (UIColor *)v4;
}

- (id)mergedObjectsWithIdentifiers:(id)a3 fromDictionary:(id)a4 merger:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  long long v17 = [v9 mergeObjects:v10];

  return v17;
}

- (id)additionsForComponents:(id)a3
{
  id v18 = self;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = objc_msgSend(v9, "additions", v18);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              [v4 addObject:*(void *)(*((void *)&v20 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v15 = [v9 components];
          int v16 = [(SXDocumentController *)v18 additionsForComponents:v15];
          [v4 addObjectsFromArray:v16];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (SXDocument)document
{
  return self->_document;
}

- (SXJSONObjectMerger)componentStyleMerger
{
  return self->_componentStyleMerger;
}

- (SXImageController)imageController
{
  return self->_imageController;
}

- (void)setImageController:(id)a3
{
}

- (NSMutableDictionary)componentStyles
{
  return self->_componentStyles;
}

- (void)setComponentStyles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStyles, 0);
  objc_storeStrong((id *)&self->_imageController, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end