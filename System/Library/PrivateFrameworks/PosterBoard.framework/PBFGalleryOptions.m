@interface PBFGalleryOptions
- (ATXFaceGalleryItem)suggestedGalleryItem;
- (NSNumber)modeSemanticTypeToCreate;
- (NSString)modeSymbolImageName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setModeSemanticTypeToCreate:(id)a3;
- (void)setModeSymbolImageName:(id)a3;
- (void)setSuggestedGalleryItem:(id)a3;
@end

@implementation PBFGalleryOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setModeSemanticTypeToCreate:self->_modeSemanticTypeToCreate];
  [v4 setSuggestedGalleryItem:self->_suggestedGalleryItem];
  return v4;
}

- (NSNumber)modeSemanticTypeToCreate
{
  return self->_modeSemanticTypeToCreate;
}

- (void)setModeSemanticTypeToCreate:(id)a3
{
}

- (NSString)modeSymbolImageName
{
  return self->_modeSymbolImageName;
}

- (void)setModeSymbolImageName:(id)a3
{
}

- (ATXFaceGalleryItem)suggestedGalleryItem
{
  return self->_suggestedGalleryItem;
}

- (void)setSuggestedGalleryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedGalleryItem, 0);
  objc_storeStrong((id *)&self->_modeSymbolImageName, 0);
  objc_storeStrong((id *)&self->_modeSemanticTypeToCreate, 0);
}

@end