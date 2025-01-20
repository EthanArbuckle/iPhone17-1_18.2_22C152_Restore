@interface MCDForYouDataSource
- (MCDForYouDataSource)initWithRecommendationGroup:(id)a3;
- (MPModelForYouRecommendationGroup)group;
- (MPPropertySet)subgroupProperties;
- (id)itemProperties;
- (id)recommendationGroup;
- (void)setGroup:(id)a3;
@end

@implementation MCDForYouDataSource

- (MCDForYouDataSource)initWithRecommendationGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDForYouDataSource;
  v6 = [(MCDForYouDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_group, a3);
  }

  return v7;
}

- (MPPropertySet)subgroupProperties
{
  v5[0] = MPModelForYouRecommendationGroupPropertyGroupType;
  v5[1] = MPModelForYouRecommendationGroupPropertyLastUpdatedDate;
  v5[2] = MPModelForYouRecommendationGroupPropertyTitle;
  v5[3] = MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL;
  v5[4] = MPModelForYouRecommendationGroupPropertyHrefURL;
  v5[5] = MPModelForYouRecommendationGroupPropertyRefreshURL;
  v5[6] = MPModelForYouRecommendationGroupPropertyTraits;
  v5[7] = MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay;
  v5[8] = MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay;
  v2 = +[NSArray arrayWithObjects:v5 count:9];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return (MPPropertySet *)v3;
}

- (id)itemProperties
{
  v16[0] = MPModelForYouRecommendationItemPropertyItemType;
  v16[1] = MPModelForYouRecommendationItemPropertyReason;
  v16[2] = MPModelForYouRecommendationItemPropertyUtterance;
  v16[3] = MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay;
  v16[4] = MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay;
  v3 = +[NSArray arrayWithObjects:v16 count:5];
  v4 = [(MCDFuseDataSource *)self albumProperties];
  v15[0] = v4;
  v14[1] = MPModelForYouRecommendationItemRelationshipPlaylist;
  id v5 = [(MCDFuseDataSource *)self playlistProperties];
  v15[1] = v5;
  v14[2] = MPModelForYouRecommendationItemRelationshipSubgroup;
  v6 = [(MCDForYouDataSource *)self subgroupProperties];
  v15[2] = v6;
  v14[3] = MPModelForYouRecommendationItemRelationshipRadioStation;
  v7 = [(MCDFuseDataSource *)self radioStationProperties];
  v15[3] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  objc_super v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  id v10 = objc_alloc((Class)MPPropertySet);
  id v11 = [v9 copy];
  id v12 = [v10 initWithProperties:v3 relationships:v11];

  return v12;
}

- (id)recommendationGroup
{
  return [(MCDForYouDataSource *)self group];
}

- (MPModelForYouRecommendationGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end