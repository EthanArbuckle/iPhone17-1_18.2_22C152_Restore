@interface MCDBrowseDataSource
- (MCDBrowseDataSource)initWithParentSection:(id)a3;
- (MPModelStoreBrowseSection)section;
- (id)itemProperties;
- (id)sectionProperties;
- (void)setSection:(id)a3;
@end

@implementation MCDBrowseDataSource

- (MCDBrowseDataSource)initWithParentSection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDBrowseDataSource;
  v6 = [(MCDBrowseDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_section, a3);
  }

  return v7;
}

- (id)sectionProperties
{
  v5[0] = MPModelStoreBrowseSectionPropertyTitle;
  v5[1] = MPModelStoreBrowseSectionPropertyType;
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)itemProperties
{
  id v3 = objc_alloc((Class)MPPropertySet);
  uint64_t v15 = MPModelStoreBrowseContentItemPropertyItemType;
  v4 = +[NSArray arrayWithObjects:&v15 count:1];
  id v5 = [(MCDFuseDataSource *)self albumProperties];
  v14[0] = v5;
  v13[1] = MPModelStoreBrowseContentItemRelationshipCurator;
  v6 = [(MCDFuseDataSource *)self curatorProperties];
  v14[1] = v6;
  v13[2] = MPModelStoreBrowseContentItemRelationshipPlaylist;
  v7 = [(MCDFuseDataSource *)self playlistProperties];
  v14[2] = v7;
  v13[3] = MPModelStoreBrowseContentItemRelationshipRadioStation;
  v8 = [(MCDFuseDataSource *)self radioStationProperties];
  v14[3] = v8;
  v13[4] = MPModelStoreBrowseContentItemRelationshipSong;
  objc_super v9 = [(MCDFuseDataSource *)self songProperties];
  v14[4] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
  id v11 = [v3 initWithProperties:v4 relationships:v10];

  return v11;
}

- (MPModelStoreBrowseSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end