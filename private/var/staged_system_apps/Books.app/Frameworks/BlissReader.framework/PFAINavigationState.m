@interface PFAINavigationState
- (NSDictionary)metadataDict;
- (NSDictionary)ncxAdditions;
- (NSString)subtitle;
- (NSString)title;
- (PFAINavigationState)initWithEntry:(id)a3 inArchive:(id)a4;
- (PFAIPackageState)packageState;
- (THModelContainerNode)currentContainerNode;
- (THTOCTileModel)currentTocTile;
- (id)additionalPropertiesForNavPointId:(id)a3;
- (id)contentNodeForEntry:(id)a3;
- (id)contentNodeForNodeGUID:(id)a3;
- (void)addContentNodeToCache:(id)a3;
- (void)clearNodesByEntry;
- (void)dealloc;
- (void)setContentNode:(id)a3 forEntry:(id)a4;
- (void)setCurrentContainerNode:(id)a3;
- (void)setCurrentTocTile:(id)a3;
- (void)setMetadataContents:(id)a3 forName:(id)a4;
- (void)setNcxAdditions:(id)a3;
- (void)setPackageState:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PFAINavigationState

- (PFAINavigationState)initWithEntry:(id)a3 inArchive:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PFAINavigationState;
  v4 = [(PFXXmlStreamReaderState *)&v6 initWithEntry:a3 inArchive:a4];
  if (v4)
  {
    v4->mNodesByGuid = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mNodesByAbsoluteEntry = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mMetadataDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAINavigationState;
  [(PFXXmlStreamReaderState *)&v3 dealloc];
}

- (void)setContentNode:(id)a3 forEntry:(id)a4
{
}

- (id)contentNodeForEntry:(id)a3
{
  return [(NSMutableDictionary *)self->mNodesByAbsoluteEntry objectForKey:a3];
}

- (void)clearNodesByEntry
{
  self->mNodesByAbsoluteEntry = 0;
  self->mNodesByAbsoluteEntry = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
}

- (void)addContentNodeToCache:(id)a3
{
  mNodesByGuid = self->mNodesByGuid;
  id v5 = [a3 nodeGUID];

  [(NSMutableDictionary *)mNodesByGuid setObject:a3 forKey:v5];
}

- (id)contentNodeForNodeGUID:(id)a3
{
  return [(NSMutableDictionary *)self->mNodesByGuid objectForKey:a3];
}

- (void)setMetadataContents:(id)a3 forName:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKey:](self->mMetadataDict, "setObject:forKey:");
    }
  }
}

- (id)additionalPropertiesForNavPointId:(id)a3
{
  id v4 = [(NSDictionary *)self->mNcxAdditions objectForKey:@"navMap"];

  return [v4 objectForKey:a3];
}

- (PFAIPackageState)packageState
{
  return self->mPackageState;
}

- (void)setPackageState:(id)a3
{
}

- (THModelContainerNode)currentContainerNode
{
  return self->mCurrentContainerNode;
}

- (void)setCurrentContainerNode:(id)a3
{
}

- (THTOCTileModel)currentTocTile
{
  return self->mCurrentTocTile;
}

- (void)setCurrentTocTile:(id)a3
{
}

- (NSDictionary)ncxAdditions
{
  return self->mNcxAdditions;
}

- (void)setNcxAdditions:(id)a3
{
}

- (NSDictionary)metadataDict
{
  return &self->mMetadataDict->super;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->mSubtitle;
}

- (void)setSubtitle:(id)a3
{
}

@end