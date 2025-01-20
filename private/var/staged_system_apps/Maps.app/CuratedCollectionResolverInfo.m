@interface CuratedCollectionResolverInfo
- (CuratedCollectionResolverInfo)initWithCollectionItems:(id)a3 mediaIntegration:(id)a4 mediaIntegrationCollectionItemIndex:(int64_t)a5 mediaIntegrationPosition:(unint64_t)a6 thirdPartyLinks:(id)a7;
- (GEOAppleMediaServicesResult)mediaIntegration;
- (NSArray)collectionItems;
- (NSArray)thirdPartyLinks;
- (int64_t)mediaIntegrationCollectionItemIndex;
- (unint64_t)mediaIntegrationPosition;
@end

@implementation CuratedCollectionResolverInfo

- (CuratedCollectionResolverInfo)initWithCollectionItems:(id)a3 mediaIntegration:(id)a4 mediaIntegrationCollectionItemIndex:(int64_t)a5 mediaIntegrationPosition:(unint64_t)a6 thirdPartyLinks:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CuratedCollectionResolverInfo;
  v15 = [(CuratedCollectionResolverInfo *)&v21 init];
  if (v15)
  {
    v16 = (NSArray *)[v12 copy];
    collectionItems = v15->_collectionItems;
    v15->_collectionItems = v16;

    objc_storeStrong((id *)&v15->_mediaIntegration, a4);
    v15->_mediaIntegrationPosition = a6;
    v15->_mediaIntegrationCollectionItemIndex = a5;
    v18 = (NSArray *)[v14 copy];
    thirdPartyLinks = v15->_thirdPartyLinks;
    v15->_thirdPartyLinks = v18;
  }
  return v15;
}

- (NSArray)collectionItems
{
  return self->_collectionItems;
}

- (GEOAppleMediaServicesResult)mediaIntegration
{
  return self->_mediaIntegration;
}

- (unint64_t)mediaIntegrationPosition
{
  return self->_mediaIntegrationPosition;
}

- (int64_t)mediaIntegrationCollectionItemIndex
{
  return self->_mediaIntegrationCollectionItemIndex;
}

- (NSArray)thirdPartyLinks
{
  return self->_thirdPartyLinks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);
  objc_storeStrong((id *)&self->_mediaIntegration, 0);

  objc_storeStrong((id *)&self->_collectionItems, 0);
}

@end