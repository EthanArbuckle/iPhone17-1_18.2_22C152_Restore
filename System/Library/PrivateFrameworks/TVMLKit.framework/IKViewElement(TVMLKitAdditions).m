@interface IKViewElement(TVMLKitAdditions)
- (id)itemElementsOfType:()TVMLKitAdditions;
- (id)tv_associatedViewElementWithDefaultClass:()TVMLKitAdditions;
- (int64_t)tv_semanticContentAttribute;
- (uint64_t)tv_associatedViewElement;
- (uint64_t)tv_isParsedOnce;
- (uint64_t)tv_scaleMode;
- (uint64_t)tv_scaleModeWithDefaultMode:()TVMLKitAdditions;
- (void)retrievePresentationDocumentWithResponder:()TVMLKitAdditions completionHandler:;
- (void)tv_dispatchEvent:()TVMLKitAdditions canBubble:isCancelable:extraInfo:targetResponder:completionBlock:;
- (void)tv_setParsedOnce:()TVMLKitAdditions;
@end

@implementation IKViewElement(TVMLKitAdditions)

- (uint64_t)tv_associatedViewElement
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(a1, "tv_associatedViewElementWithDefaultClass:", v2);
}

- (id)tv_associatedViewElementWithDefaultClass:()TVMLKitAdditions
{
  v5 = objc_getAssociatedObject(a1, "TVAssociatedViewElement");
  if (!v5)
  {
    v6 = +[TVElementFactory classForElementType:](TVElementFactory, "classForElementType:", [a1 elementType]);
    if (!v6) {
      v6 = a3;
    }
    v5 = (void *)[[v6 alloc] initWithViewElement:a1];
    objc_setAssociatedObject(a1, "TVAssociatedViewElement", v5, (void *)0x301);
  }
  return v5;
}

- (id)itemElementsOfType:()TVMLKitAdditions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [a1 children];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "tv_elementType") == 49)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          v11 = [v10 children];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                if (objc_msgSend(v16, "tv_elementType") == a3) {
                  [v5 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v13);
          }
        }
        else if (objc_msgSend(v10, "tv_elementType") == a3)
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

- (int64_t)tv_semanticContentAttribute
{
  v1 = [a1 appDocument];
  uint64_t v2 = [v1 templateElement];

  int64_t v3 = +[TVMLUtilities semanticContentAttributeForTemplateElement:v2];
  return v3;
}

- (uint64_t)tv_scaleModeWithDefaultMode:()TVMLKitAdditions
{
  id v5 = [a1 attributes];
  uint64_t v6 = [v5 objectForKey:@"contentsMode"];

  if ([v6 length])
  {
    if ([v6 isEqualToString:@"aspectFit"])
    {
      a3 = 1;
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"aspectFill"])
    {
      a3 = 3;
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"aspectFitBB"])
    {
      a3 = 2;
      goto LABEL_12;
    }
    BOOL v10 = [v6 isEqualToString:@"aspectFitHeight"] == 0;
    uint64_t v11 = 4;
  }
  else
  {
    uint64_t v7 = [a1 attributes];
    uint64_t v8 = [v7 objectForKey:@"aspectFill"];
    int v9 = [v8 BOOLValue];

    BOOL v10 = v9 == 0;
    uint64_t v11 = 3;
  }
  if (!v10) {
    a3 = v11;
  }
LABEL_12:

  return a3;
}

- (uint64_t)tv_scaleMode
{
  return objc_msgSend(a1, "tv_scaleModeWithDefaultMode:", 1);
}

- (void)tv_setParsedOnce:()TVMLKitAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"tv_parsedOnce"];
}

- (uint64_t)tv_isParsedOnce
{
  v1 = [a1 objectForKeyedSubscript:@"tv_parsedOnce"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)tv_dispatchEvent:()TVMLKitAdditions canBubble:isCancelable:extraInfo:targetResponder:completionBlock:
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  v18 = [a1 appDocument];
  id v22 = v15;
  char v19 = objc_msgSend(v18, "tv_handleEvent:targetResponder:viewElement:extraInfo:", v14, v17, a1, &v22);

  id v20 = v22;
  if (v19)
  {
    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
  else
  {
    long long v21 = [NSString stringWithFormat:@"on%@", v14];
    [a1 dispatchEvent:v14 eventAttribute:v21 canBubble:a4 isCancelable:a5 extraInfo:v20 completionBlock:v16];
  }
}

- (void)retrievePresentationDocumentWithResponder:()TVMLKitAdditions completionHandler:
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 appDocument];
  int v9 = [v8 appContext];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke;
  v19[3] = &unk_264BA7B78;
  id v20 = v9;
  id v21 = v8;
  id v22 = a1;
  id v10 = v6;
  id v23 = v10;
  id v11 = v8;
  id v12 = v9;
  uint64_t v13 = (void *)MEMORY[0x230FC9DC0](v19);
  long long v24 = @"presentDocument";
  id v14 = (void *)MEMORY[0x230FC9DC0]();
  v25[0] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_4;
  v17[3] = &unk_264BA7BA0;
  id v18 = v10;
  id v16 = v10;
  objc_msgSend(a1, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"contextmenu", 1, 1, v15, v7, v17);
}

@end