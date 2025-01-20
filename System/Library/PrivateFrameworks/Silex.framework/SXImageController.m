@interface SXImageController
- (CGSize)sizeConstraintForComponent:(id)a3;
- (CGSize)viewportSize;
- (NSDictionary)image2ResourcesGroupedByImageIdentifier;
- (NSDictionary)imageResourcesGroupedByImageIdentifier;
- (NSMutableDictionary)optimalImageResourcesByID;
- (NSMutableOrderedSet)optimalImageResources;
- (SXColumnLayout)columnLayout;
- (SXDocumentController)documentController;
- (SXImageController)initWithDocumentController:(id)a3 columnCalculator:(id)a4;
- (id)Image2ResourcesForImageIdentifier:(id)a3;
- (id)allImageResources;
- (id)allResourcesForImageIdentifier:(id)a3;
- (id)imageResourceForAudioComponent:(id)a3;
- (id)imageResourceForDataTableComponent:(id)a3;
- (id)imageResourceForGalleryItem:(id)a3;
- (id)imageResourceForIdentifier:(id)a3;
- (id)imageResourceForImageComponent:(id)a3;
- (id)imageResourceForImageFill:(id)a3;
- (id)imageResourceForImageIdentifier:(id)a3 constrainedToSize:(CGSize)a4;
- (id)imageResourceForRepeatableImageFill:(id)a3;
- (id)imageResourceForScalableImageComponent:(id)a3;
- (id)imageResourceForVideoComponent:(id)a3;
- (id)imageResourceForVideoFill:(id)a3;
- (id)imageResourcesForComponent:(id)a3;
- (id)imageResourcesForComponentStyle:(id)a3;
- (id)imageResourcesForGalleryComponent:(id)a3;
- (id)imageResourcesForImageIdentifier:(id)a3;
- (id)taggedEquivalentOfImageResource:(id)a3;
- (void)determineOptimalImagesForComponentStyles:(id)a3;
- (void)determineOptimalImagesForComponents:(id)a3;
- (void)determineOptimalImagesForMetadata;
- (void)prepareImageResources;
@end

@implementation SXImageController

- (CGSize)sizeConstraintForComponent:(id)a3
{
  id v4 = a3;
  v5 = [(SXImageController *)self documentController];
  v6 = [v4 layout];

  v7 = [v5 componentLayoutForIdentifier:v6];

  v8 = [(SXImageController *)self columnLayout];
  uint64_t v9 = [v7 columnRange];
  objc_msgSend(v8, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v9, v10, objc_msgSend(v7, "ignoreDocumentMargin"), objc_msgSend(v7, "ignoreDocumentGutter"), objc_msgSend(v7, "ignoreViewportPadding"));
  double v12 = v11;

  double v13 = 1.79769313e308;
  double v14 = v12;
  result.height = v13;
  result.width = v14;
  return result;
}

- (id)imageResourcesForComponent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForImageComponent:v4];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForScalableImageComponent:v4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForVideoComponent:v4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForAudioComponent:v4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourcesForGalleryComponent:v4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForDataTableComponent:v4];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (id)imageResourceForImageComponent:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self sizeConstraintForComponent:v4];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 imageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  double v11 = (void *)v10;
  if (v10)
  {
    double v14 = v9;
    v15[0] = v10;
    double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)determineOptimalImagesForComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 components];
          [(SXImageController *)self determineOptimalImagesForComponents:v10];
        }
        else
        {
          uint64_t v10 = [(SXImageController *)self imageResourcesForComponent:v9];
          double v11 = [(SXImageController *)self optimalImageResources];
          double v12 = [v10 allValues];
          [v11 addObjectsFromArray:v12];

          double v13 = [(SXImageController *)self optimalImageResourcesByID];
          [v13 addEntriesFromDictionary:v10];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (SXColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (SXImageController)initWithDocumentController:(id)a3 columnCalculator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SXImageController;
  uint64_t v8 = [(SXImageController *)&v23 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(SXImageController *)v8 viewportSize];
    double v11 = v10;
    double v13 = v12;
    objc_storeWeak((id *)&v9->_documentController, v6);
    long long v14 = [v6 document];
    long long v15 = [v14 layout];
    uint64_t v16 = objc_msgSend(v7, "columnLayoutWithViewportSize:constrainedToWidth:documentLayout:contentScaleFactor:", v15, v11, v13, v11, 1.0);
    columnLayout = v9->_columnLayout;
    v9->_columnLayout = (SXColumnLayout *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9B0] orderedSet];
    optimalImageResources = v9->_optimalImageResources;
    v9->_optimalImageResources = (NSMutableOrderedSet *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    optimalImageResourcesByID = v9->_optimalImageResourcesByID;
    v9->_optimalImageResourcesByID = (NSMutableDictionary *)v20;

    [(SXImageController *)v9 prepareImageResources];
  }

  return v9;
}

- (void)prepareImageResources
{
  v3 = [(SXImageController *)self documentController];
  id v4 = [v3 document];
  uint64_t v5 = [v4 components];
  [(SXImageController *)self determineOptimalImagesForComponents:v5];

  id v6 = [(SXImageController *)self documentController];
  id v7 = [v6 document];
  uint64_t v8 = [v7 componentStyles];
  uint64_t v9 = [v8 allObjects];
  [(SXImageController *)self determineOptimalImagesForComponentStyles:v9];

  [(SXImageController *)self determineOptimalImagesForMetadata];
}

- (void)determineOptimalImagesForMetadata
{
  v3 = [(SXImageController *)self documentController];
  id v4 = [v3 document];
  uint64_t v5 = [v4 metadata];
  id v6 = [v5 tabBarAppearance];

  if (v6)
  {
    id v7 = [(SXImageController *)self documentController];
    uint64_t v8 = [v7 document];
    uint64_t v9 = [v8 metadata];
    double v10 = [v9 tabBarAppearance];

    double v11 = objc_msgSend(v10, "icon2xImageIdentifier_v2");

    if (v11)
    {
      double v12 = objc_msgSend(v10, "icon2xImageIdentifier_v2");
      double v13 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v12, 1.79769313e308, 1.79769313e308);

      if (v13)
      {
        long long v14 = [(SXImageController *)self optimalImageResources];
        [v14 addObject:v13];

        long long v15 = [(SXImageController *)self optimalImageResourcesByID];
        uint64_t v16 = objc_msgSend(v10, "icon2xImageIdentifier_v2");
        [v15 setObject:v13 forKey:v16];
      }
    }
    long long v17 = objc_msgSend(v10, "icon3xImageIdentifier_v2");

    if (v17)
    {
      uint64_t v18 = objc_msgSend(v10, "icon3xImageIdentifier_v2");
      uint64_t v19 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v18, 1.79769313e308, 1.79769313e308);

      if (v19)
      {
        uint64_t v20 = [(SXImageController *)self optimalImageResources];
        [v20 addObject:v19];

        v21 = [(SXImageController *)self optimalImageResourcesByID];
        v22 = objc_msgSend(v10, "icon3xImageIdentifier_v2");
        [v21 setObject:v19 forKey:v22];
      }
    }
  }
  objc_super v23 = [(SXImageController *)self documentController];
  v24 = [v23 document];
  v25 = [v24 metadata];
  v26 = [v25 feedNavigationAppearance];

  if (v26)
  {
    v27 = [(SXImageController *)self documentController];
    v28 = [v27 document];
    v29 = [v28 metadata];
    id v36 = [v29 feedNavigationAppearance];

    v30 = [v36 iconImageIdentifier];

    if (v30)
    {
      v31 = [v36 iconImageIdentifier];
      v32 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v31, 1.79769313e308, 1.79769313e308);

      if (v32)
      {
        v33 = [(SXImageController *)self optimalImageResources];
        [v33 addObject:v32];

        v34 = [(SXImageController *)self optimalImageResourcesByID];
        v35 = [v36 iconImageIdentifier];
        [v34 setObject:v32 forKey:v35];
      }
    }
  }
}

- (id)imageResourceForScalableImageComponent:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self viewportSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 imageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  double v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)imageResourcesForGalleryComponent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = objc_msgSend(v4, "items", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [(SXImageController *)self imageResourceForGalleryItem:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v5 addEntriesFromDictionary:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)imageResourceForGalleryItem:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self viewportSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 imageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  double v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)imageResourceForVideoComponent:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self sizeConstraintForComponent:v4];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 stillImageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  double v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)imageResourceForAudioComponent:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self sizeConstraintForComponent:v4];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 stillImageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  double v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)imageResourceForDataTableComponent:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v26 = [MEMORY[0x263EFF9A0] dictionary];
  v27 = v4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v5 = [v4 data];
  double v6 = [v5 recordsUsingSortDescriptors:0];

  id obj = v6;
  uint64_t v24 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        double v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v9 = [v27 data];
        uint64_t v10 = [v9 descriptors];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              if ([v15 dataType] == 6)
              {
                long long v16 = [v15 key];
                long long v17 = [v8 valueForKey:v16];

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v18 = v17;
LABEL_16:
                  uint64_t v19 = v18;
                  if (v18)
                  {
                    [(SXImageController *)self sizeConstraintForComponent:v27];
                    uint64_t v20 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v19);
                    if (v20) {
                      [v26 setObject:v20 forKey:v19];
                    }
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v18 = [v17 objectForKey:@"imageIdentifier"];
                    goto LABEL_16;
                  }
                }

                continue;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }

  return v26;
}

- (void)determineOptimalImagesForComponentStyles:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [(SXImageController *)self imageResourcesForComponentStyle:v9];
        if (v10)
        {
          uint64_t v11 = [(SXImageController *)self optimalImageResources];
          uint64_t v12 = [v10 allValues];
          [v11 addObjectsFromArray:v12];

          uint64_t v13 = [(SXImageController *)self optimalImageResourcesByID];
          [v13 addEntriesFromDictionary:v10];
        }
        long long v14 = [v9 conditional];
        long long v15 = [v14 NSArray];
        [(SXImageController *)self determineOptimalImagesForComponentStyles:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (id)imageResourcesForComponentStyle:(id)a3
{
  id v4 = [a3 fill];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForImageFill:v4];
LABEL_7:
    uint64_t v6 = (void *)v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForVideoFill:v4];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXImageController *)self imageResourceForRepeatableImageFill:v4];
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (id)imageResourceForImageFill:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self viewportSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 imageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)imageResourceForRepeatableImageFill:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self viewportSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 imageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)imageResourceForVideoFill:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXImageController *)self viewportSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 stillImageIdentifier];

  uint64_t v10 = -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    long long v14 = v9;
    v15[0] = v10;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)imageResourceForImageIdentifier:(id)a3 constrainedToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = [(SXImageController *)self imageResourcesForImageIdentifier:v7];
  v41 = self;
  uint64_t v9 = [(SXImageController *)self optimalImageResourcesByID];
  uint64_t v10 = [v9 objectForKey:v7];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v47;
    double v15 = 1.79769313e308;
    BOOL v16 = height == 1.79769313e308 || width >= height;
    if (v16) {
      double height = width;
    }
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v18 dimensions];
        if (v16) {
          double v21 = v19;
        }
        else {
          double v21 = v20;
        }
        v22 = [MEMORY[0x263F1C920] mainScreen];
        [v22 scale];
        double v24 = v21 / v23;

        if (height - v24 >= 0.0) {
          double v25 = height - v24;
        }
        else {
          double v25 = -(height - v24);
        }
        if (v25 < v15)
        {
          id v26 = v18;

          double v15 = v25;
          uint64_t v10 = v26;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v13);
  }

  if (!v10)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v27 = v11;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v10 = 0;
      uint64_t v30 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if (v10)
          {
            [*(id *)(*((void *)&v42 + 1) + 8 * j) dimensions];
            double v34 = v33;
            [v10 dimensions];
            if (v34 <= v35) {
              continue;
            }
          }
          id v36 = v32;

          uint64_t v10 = v36;
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v29);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  if (objc_msgSend(MEMORY[0x263F1C5C0], "sx_isSpectreDevice"))
  {
    v37 = [(SXImageController *)v41 taggedEquivalentOfImageResource:v10];
    uint64_t v38 = v37;
    if (v37)
    {
      id v39 = v37;

      uint64_t v10 = v39;
    }
  }
  return v10;
}

- (id)allResourcesForImageIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF980] array];
  BOOL v16 = v4;
  double v6 = [(SXImageController *)self imageResourcesForImageIdentifier:v4];
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_51];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(MEMORY[0x263F1C5C0], "sx_isSpectreDevice")
          && ([(SXImageController *)self taggedEquivalentOfImageResource:v12],
              (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v14 = (void *)v13;
          [v5 addObject:v13];
        }
        else
        {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v5;
}

uint64_t __52__SXImageController_allResourcesForImageIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 dimensions];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 dimensions];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)taggedEquivalentOfImageResource:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 imageIdentifier];
  double v6 = [(SXImageController *)self Image2ResourcesForImageIdentifier:v5];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "dimensions", (void)v23);
        double v15 = v14;
        double v17 = v16;
        [v4 dimensions];
        if (v15 == v19 && v17 == v18)
        {
          id v21 = v13;

          uint64_t v10 = v21;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  if (*MEMORY[0x263F001B0] == width && *(double *)(MEMORY[0x263F001B0] + 8) == height)
  {
    double v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 bounds];
    double v7 = CGRectGetHeight(v10);
    [v6 bounds];
    double v8 = CGRectGetWidth(v11);
    if (v7 >= v8) {
      double v8 = v7;
    }
    self->_viewportSize.double width = v8;
    self->_viewportSize.double height = v8;

    double width = self->_viewportSize.width;
    double height = self->_viewportSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)allImageResources
{
  v2 = [(SXImageController *)self optimalImageResources];
  v3 = [v2 array];

  return v3;
}

- (id)imageResourceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SXImageController *)self optimalImageResourcesByID];
  double v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)imageResourcesForImageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SXImageController *)self imageResourcesGroupedByImageIdentifier];
  double v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)Image2ResourcesForImageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SXImageController *)self image2ResourcesGroupedByImageIdentifier];
  double v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSDictionary)imageResourcesGroupedByImageIdentifier
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  imageResourcesGroupedByImageIdentifier = self->_imageResourcesGroupedByImageIdentifier;
  if (!imageResourcesGroupedByImageIdentifier)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = [(SXImageController *)self documentController];
    double v6 = [v5 document];
    double v7 = [v6 resources];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
          uint64_t v13 = [(SXImageController *)self documentController];
          double v14 = [v13 document];
          double v15 = [v14 resources];
          double v16 = [v15 objectForKey:v12];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v17 = [v16 imageIdentifier];
            if (v17)
            {
              double v18 = [(NSDictionary *)v4 objectForKey:v17];
              if (!v18)
              {
                double v18 = [MEMORY[0x263EFF980] array];
              }
              [v18 addObject:v16];
              [(NSDictionary *)v4 setObject:v18 forKey:v17];
            }
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    double v19 = self->_imageResourcesGroupedByImageIdentifier;
    self->_imageResourcesGroupedByImageIdentifier = v4;

    imageResourcesGroupedByImageIdentifier = self->_imageResourcesGroupedByImageIdentifier;
  }
  return imageResourcesGroupedByImageIdentifier;
}

- (NSDictionary)image2ResourcesGroupedByImageIdentifier
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  image2ResourcesGroupedByImageIdentifier = self->_image2ResourcesGroupedByImageIdentifier;
  if (!image2ResourcesGroupedByImageIdentifier)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = [(SXImageController *)self documentController];
    double v6 = [v5 document];
    double v7 = [v6 resources];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
          uint64_t v13 = [(SXImageController *)self documentController];
          double v14 = [v13 document];
          double v15 = [v14 resources];
          double v16 = [v15 objectForKey:v12];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v17 = [v16 imageIdentifier];
            if (v17)
            {
              double v18 = [(NSDictionary *)v4 objectForKey:v17];
              if (!v18)
              {
                double v18 = [MEMORY[0x263EFF980] array];
              }
              [v18 addObject:v16];
              [(NSDictionary *)v4 setObject:v18 forKey:v17];
            }
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    double v19 = self->_image2ResourcesGroupedByImageIdentifier;
    self->_image2ResourcesGroupedByImageIdentifier = v4;

    image2ResourcesGroupedByImageIdentifier = self->_image2ResourcesGroupedByImageIdentifier;
  }
  return image2ResourcesGroupedByImageIdentifier;
}

- (SXDocumentController)documentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentController);
  return (SXDocumentController *)WeakRetained;
}

- (NSMutableOrderedSet)optimalImageResources
{
  return self->_optimalImageResources;
}

- (NSMutableDictionary)optimalImageResourcesByID
{
  return self->_optimalImageResourcesByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimalImageResourcesByID, 0);
  objc_storeStrong((id *)&self->_optimalImageResources, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_destroyWeak((id *)&self->_documentController);
  objc_storeStrong((id *)&self->_image2ResourcesGroupedByImageIdentifier, 0);
  objc_storeStrong((id *)&self->_imageResourcesGroupedByImageIdentifier, 0);
}

@end