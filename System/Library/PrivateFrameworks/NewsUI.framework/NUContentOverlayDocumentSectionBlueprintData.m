@interface NUContentOverlayDocumentSectionBlueprintData
- (NUContentOverlayDocumentSectionBlueprintData)initWithBlueprint:(id)a3 topOffset:(double)a4;
- (SXDocumentSectionBlueprint)blueprint;
- (double)topOffset;
@end

@implementation NUContentOverlayDocumentSectionBlueprintData

- (NUContentOverlayDocumentSectionBlueprintData)initWithBlueprint:(id)a3 topOffset:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUContentOverlayDocumentSectionBlueprintData;
  v8 = [(NUContentOverlayDocumentSectionBlueprintData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_blueprint, a3);
    v9->_topOffset = a4;
  }

  return v9;
}

- (SXDocumentSectionBlueprint)blueprint
{
  return self->_blueprint;
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void).cxx_destruct
{
}

@end