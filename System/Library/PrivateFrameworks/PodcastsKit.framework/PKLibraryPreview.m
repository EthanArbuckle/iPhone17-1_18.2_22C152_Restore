@interface PKLibraryPreview
+ (id)_readFromPodcastsContainerWithDataSource:(id)a3;
+ (id)readFromPodcastsContainer;
+ (id)readPlistWithPath:(id)a3;
- (NSArray)shows;
- (NSArray)stations;
- (PKLibraryPreview)initWithShows:(id)a3 stations:(id)a4;
- (void)setShows:(id)a3;
- (void)setStations:(id)a3;
@end

@implementation PKLibraryPreview

- (PKLibraryPreview)initWithShows:(id)a3 stations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKLibraryPreview;
  v8 = [(PKLibraryPreview *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PKLibraryPreview *)v8 setShows:v6];
    [(PKLibraryPreview *)v9 setStations:v7];
  }

  return v9;
}

+ (id)readPlistWithPath:(id)a3
{
  id v4 = a3;
  v5 = [[PODataSource alloc] initWithPlistPath:v4];

  id v6 = [a1 _readFromPodcastsContainerWithDataSource:v5];

  return v6;
}

+ (id)readFromPodcastsContainer
{
  v3 = objc_alloc_init(PODataSource);
  id v4 = [a1 _readFromPodcastsContainerWithDataSource:v3];

  return v4;
}

+ (id)_readFromPodcastsContainerWithDataSource:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
  v57 = v3;
  id v4 = [v3 podcastCollections];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v66 objects:v75 count:16];
  v59 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v67;
    v8 = &dword_23F08F000;
    uint64_t v58 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v67 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v11 = v10;
          uint64_t v12 = [v11 uuid];
          if (v12
            && (v13 = (void *)v12,
                [v11 uuid],
                v14 = objc_claimAutoreleasedReturnValue(),
                uint64_t v15 = [v14 length],
                v14,
                v13,
                v15))
          {
            v16 = NSString;
            v17 = [(id)objc_opt_class() uriScheme];
            v18 = [v11 uuid];
            v19 = [v16 stringWithFormat:@"%@://device/%@", v17, v18];

            v20 = [PKShowPreview alloc];
            v21 = [v11 title];
            v22 = [v11 storeId];
            [v11 feedUrl];
            v24 = v23 = v8;
            v25 = [(PKShowPreview *)v20 initWithTitle:v21 storeId:v22 feedUrl:v24 uuid:v19];

            v8 = v23;
            [v60 addObject:v25];
            v26 = _MTLogCategorySiri();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = [v11 feedUrl];
              *(_DWORD *)buf = 138412546;
              v72 = (PKStationPreview *)v19;
              __int16 v73 = 2112;
              v74 = v27;
              _os_log_impl(v23, v26, OS_LOG_TYPE_DEFAULT, "Created library preview for podcast %@ - %@", buf, 0x16u);
            }
            uint64_t v7 = v58;
            id v4 = v59;
          }
          else
          {
            v19 = _MTLogCategorySiri();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v30 = [v11 feedUrl];
              v31 = [v11 storeId];
              *(_DWORD *)buf = 138412546;
              v72 = v30;
              __int16 v73 = 2112;
              v74 = v31;
              _os_log_impl(v8, v19, OS_LOG_TYPE_ERROR, "Library Preview: Cannot create show preview because found nil uuid for podcast: %@ - %@", buf, 0x16u);
            }
          }
        }
        else
        {
          objc_super v11 = _MTLogCategorySiri();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v28 = (PKStationPreview *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v72 = v28;
            v29 = v28;
            _os_log_impl(v8, v11, OS_LOG_TYPE_ERROR, "Library Preview: Expected podcast to be of type POPodcastCollection but got type of %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v6);
  }
  id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
  v32 = [v57 podcastStations];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v63 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = v37;
          uint64_t v39 = [v38 uuid];
          if (v39
            && (v40 = (void *)v39,
                [v38 uuid],
                v41 = objc_claimAutoreleasedReturnValue(),
                uint64_t v42 = [v41 length],
                v41,
                v40,
                v42))
          {
            v43 = NSString;
            v44 = [(id)objc_opt_class() uriScheme];
            v45 = [v38 uuid];
            v46 = [v43 stringWithFormat:@"%@://device/%@", v44, v45];

            v47 = [PKStationPreview alloc];
            v48 = [v38 title];
            v49 = [(PKStationPreview *)v47 initWithTitle:v48 uuid:v46];

            [v61 addObject:v49];
            v50 = _MTLogCategorySiri();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v72 = (PKStationPreview *)v46;
              _os_log_impl(&dword_23F08F000, v50, OS_LOG_TYPE_DEFAULT, "Created library preview for station %@", buf, 0xCu);
            }

LABEL_34:
          }
          else
          {
            v46 = _MTLogCategorySiri();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v49 = [v38 title];
              *(_DWORD *)buf = 138412290;
              v72 = v49;
              _os_log_impl(&dword_23F08F000, v46, OS_LOG_TYPE_ERROR, "Library Preview: Cannot create station preview because found nil uuid for station: %@", buf, 0xCu);
              goto LABEL_34;
            }
          }

          goto LABEL_36;
        }
        v38 = _MTLogCategorySiri();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v51 = (PKStationPreview *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v72 = v51;
          v52 = v51;
          _os_log_impl(&dword_23F08F000, v38, OS_LOG_TYPE_ERROR, "Library Preview: Expected station to be of type POPodcastStation but got type of %@", buf, 0xCu);
        }
LABEL_36:
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v34);
  }
  if ([v60 count] || objc_msgSend(v61, "count"))
  {
    v53 = [[PKLibraryPreview alloc] initWithShows:v60 stations:v61];
    v54 = v59;
  }
  else
  {
    v56 = _MTLogCategorySiri();
    v54 = v59;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F08F000, v56, OS_LOG_TYPE_DEFAULT, "Library Preview: Not creating Library Preview because there are no podcasts and no stations.", buf, 2u);
    }

    v53 = 0;
  }

  return v53;
}

- (NSArray)shows
{
  return self->_shows;
}

- (void)setShows:(id)a3
{
}

- (NSArray)stations
{
  return self->_stations;
}

- (void)setStations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_shows, 0);
}

@end