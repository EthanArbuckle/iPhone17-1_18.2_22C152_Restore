@interface NUDocumentSectionBlueprintProvider
- (FCObservable)tempObservableContentOverlayBlueprintData;
- (FCObservable)tempObservableFooterBlueprint;
- (FCObservable)tempObservableHeaderBlueprint;
- (NUDocumentSectionBlueprintProvider)init;
@end

@implementation NUDocumentSectionBlueprintProvider

- (NUDocumentSectionBlueprintProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)NUDocumentSectionBlueprintProvider;
  v2 = [(NUDocumentSectionBlueprintProvider *)&v10 init];
  if (v2)
  {
    v3 = (FCObservable *)objc_alloc_init(MEMORY[0x263F59588]);
    tempObservableHeaderBlueprint = v2->_tempObservableHeaderBlueprint;
    v2->_tempObservableHeaderBlueprint = v3;

    v5 = (FCObservable *)objc_alloc_init(MEMORY[0x263F59588]);
    tempObservableFooterBlueprint = v2->_tempObservableFooterBlueprint;
    v2->_tempObservableFooterBlueprint = v5;

    v7 = (FCObservable *)objc_alloc_init(MEMORY[0x263F59588]);
    tempObservableContentOverlayBlueprintData = v2->_tempObservableContentOverlayBlueprintData;
    v2->_tempObservableContentOverlayBlueprintData = v7;
  }
  return v2;
}

- (FCObservable)tempObservableHeaderBlueprint
{
  return self->_tempObservableHeaderBlueprint;
}

- (FCObservable)tempObservableFooterBlueprint
{
  return self->_tempObservableFooterBlueprint;
}

- (FCObservable)tempObservableContentOverlayBlueprintData
{
  return self->_tempObservableContentOverlayBlueprintData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempObservableContentOverlayBlueprintData, 0);
  objc_storeStrong((id *)&self->_tempObservableFooterBlueprint, 0);

  objc_storeStrong((id *)&self->_tempObservableHeaderBlueprint, 0);
}

@end