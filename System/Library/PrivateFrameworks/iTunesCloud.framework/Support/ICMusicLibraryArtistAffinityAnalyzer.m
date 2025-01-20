@interface ICMusicLibraryArtistAffinityAnalyzer
- (id)_requestItemProperties;
- (id)aggregateLibraryRecommendationMetricsFromSnapshots:(id)a3;
- (id)createFeatureProviderDictionaryFromNewContentResponse:(id)a3 withLibraryArtistSnapshots:(id)a4;
- (void)performLibraryAnalysisFromResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)performLibraryAnalysisWithCompletionHandler:(id)a3;
@end

@implementation ICMusicLibraryArtistAffinityAnalyzer

- (id)_requestItemProperties
{
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v2 = (id *)qword_1001F37B0;
  uint64_t v66 = qword_1001F37B0;
  if (!qword_1001F37B0)
  {
    v3 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v3, "MPModelRelationshipSongArtist");
    qword_1001F37B0 = v64[3];
    v2 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v2)
  {
    v43 = +[NSAssertionHandler currentHandler];
    v44 = +[NSString stringWithUTF8String:"NSString *getMPModelRelationshipSongArtist(void)"];
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"ICMusicLibraryArtistAffinityAnalyzer.m", 34, @"%s", dlerror());

    goto LABEL_44;
  }
  id v4 = *v2;
  v71[0] = v4;
  id v5 = sub_10003C740();
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v6 = (id *)qword_1001F37C0;
  uint64_t v66 = qword_1001F37C0;
  if (!qword_1001F37C0)
  {
    v7 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v7, "MPModelPropertyArtistName");
    qword_1001F37C0 = v64[3];
    v6 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v6)
  {
    v45 = +[NSAssertionHandler currentHandler];
    v46 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertyArtistName(void)"];
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"ICMusicLibraryArtistAffinityAnalyzer.m", 27, @"%s", dlerror());

    goto LABEL_44;
  }
  id v8 = *v6;
  id v70 = v8;
  v9 = +[NSArray arrayWithObjects:&v70 count:1];
  v10 = [v5 propertySetWithProperties:v9];
  v72[0] = v10;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v11 = (id *)qword_1001F37C8;
  uint64_t v66 = qword_1001F37C8;
  if (!qword_1001F37C8)
  {
    v12 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v12, "MPModelRelationshipSongAlbum");
    qword_1001F37C8 = v64[3];
    v11 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v11)
  {
    v47 = +[NSAssertionHandler currentHandler];
    v48 = +[NSString stringWithUTF8String:"NSString *getMPModelRelationshipSongAlbum(void)"];
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"ICMusicLibraryArtistAffinityAnalyzer.m", 35, @"%s", dlerror());

    goto LABEL_44;
  }
  id v13 = *v11;
  v71[1] = v13;
  id v14 = sub_10003C740();
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v15 = (id *)qword_1001F37D0;
  uint64_t v66 = qword_1001F37D0;
  if (!qword_1001F37D0)
  {
    v16 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v16, "MPModelPropertyAlbumTitle");
    qword_1001F37D0 = v64[3];
    v15 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v15)
  {
    v49 = +[NSAssertionHandler currentHandler];
    v50 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertyAlbumTitle(void)"];
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"ICMusicLibraryArtistAffinityAnalyzer.m", 26, @"%s", dlerror());

    goto LABEL_44;
  }
  id v69 = *v15;
  id v17 = v69;
  v18 = +[NSArray arrayWithObjects:&v69 count:1];
  v19 = [v14 propertySetWithProperties:v18];
  v72[1] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];

  id v21 = objc_alloc((Class)sub_10003C740());
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v22 = (id *)qword_1001F37D8;
  uint64_t v66 = qword_1001F37D8;
  if (!qword_1001F37D8)
  {
    v23 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v23, "MPModelPropertySongTitle");
    qword_1001F37D8 = v64[3];
    v22 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v22)
  {
    v51 = +[NSAssertionHandler currentHandler];
    v52 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertySongTitle(void)"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"ICMusicLibraryArtistAffinityAnalyzer.m", 29, @"%s", dlerror());

    goto LABEL_44;
  }
  id v24 = *v22;
  v67[0] = v24;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v25 = (id *)qword_1001F37E0;
  uint64_t v66 = qword_1001F37E0;
  if (!qword_1001F37E0)
  {
    v26 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v26, "MPModelPropertySongPlayCount");
    qword_1001F37E0 = v64[3];
    v25 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v25)
  {
    v53 = +[NSAssertionHandler currentHandler];
    v54 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertySongPlayCount(void)"];
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"ICMusicLibraryArtistAffinityAnalyzer.m", 30, @"%s", dlerror());

    goto LABEL_44;
  }
  id v27 = *v25;
  v67[1] = v27;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v28 = (id *)qword_1001F37E8;
  uint64_t v66 = qword_1001F37E8;
  if (!qword_1001F37E8)
  {
    v29 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v29, "MPModelPropertySongSkipCount");
    qword_1001F37E8 = v64[3];
    v28 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v28)
  {
    v55 = +[NSAssertionHandler currentHandler];
    v56 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertySongSkipCount(void)"];
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, @"ICMusicLibraryArtistAffinityAnalyzer.m", 31, @"%s", dlerror());

    goto LABEL_44;
  }
  id v30 = *v28;
  v67[2] = v30;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v31 = (id *)qword_1001F37F0;
  uint64_t v66 = qword_1001F37F0;
  if (!qword_1001F37F0)
  {
    v32 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v32, "MPModelPropertySongLastDevicePlaybackDate");
    qword_1001F37F0 = v64[3];
    v31 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v31)
  {
    v57 = +[NSAssertionHandler currentHandler];
    v58 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertySongLastDevicePlaybackDate(void)"];
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, @"ICMusicLibraryArtistAffinityAnalyzer.m", 28, @"%s", dlerror());

    goto LABEL_44;
  }
  id v33 = *v31;
  v67[3] = v33;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v34 = (id *)qword_1001F37F8;
  uint64_t v66 = qword_1001F37F8;
  if (!qword_1001F37F8)
  {
    v35 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v35, "MPModelPropertySongLibraryAddedDate");
    qword_1001F37F8 = v64[3];
    v34 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v34)
  {
    v59 = +[NSAssertionHandler currentHandler];
    v60 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertySongLibraryAddedDate(void)"];
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, @"ICMusicLibraryArtistAffinityAnalyzer.m", 32, @"%s", dlerror());

    goto LABEL_44;
  }
  id v36 = *v34;
  v67[4] = v36;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v37 = (id *)qword_1001F3800;
  uint64_t v66 = qword_1001F3800;
  if (!qword_1001F3800)
  {
    v38 = sub_10003C5EC();
    v64[3] = (uint64_t)dlsym(v38, "MPModelPropertySongUserRating");
    qword_1001F3800 = v64[3];
    v37 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v37)
  {
    v61 = +[NSAssertionHandler currentHandler];
    v62 = +[NSString stringWithUTF8String:"NSString *getMPModelPropertySongUserRating(void)"];
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, @"ICMusicLibraryArtistAffinityAnalyzer.m", 33, @"%s", dlerror());

LABEL_44:
    __break(1u);
  }
  id v68 = *v37;
  id v39 = v68;
  v40 = +[NSArray arrayWithObjects:v67 count:6];

  id v41 = [v21 initWithProperties:v40 relationships:v20];

  return v41;
}

- (id)aggregateLibraryRecommendationMetricsFromSnapshots:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v29 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v30 = *(void *)v34;
    id v31 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v9 isValid])
        {
          v10 = [v9 artistMetadataDescriptor];
          v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v10 storeAdamID]);

          v12 = [v4 valueForKey:v11];
          if (v12)
          {
            objc_msgSend(v12, "setCumulativePlayCount:", (char *)objc_msgSend(v9, "playCount") + (void)objc_msgSend(v12, "cumulativePlayCount"));
            objc_msgSend(v12, "setCumulativeSkipCount:", (char *)objc_msgSend(v9, "skipCount") + (void)objc_msgSend(v12, "cumulativeSkipCount"));
            id v13 = [v9 albumMetadataDescriptor];
            id v14 = [v12 uniqueAlbums];
            unsigned __int8 v15 = [v14 containsObject:v13];

            if ((v15 & 1) == 0)
            {
              v16 = [v12 uniqueAlbums];
              [v16 addObject:v13];
            }
            id v17 = [v9 songMetadataDescriptor];
            v18 = [v12 uniqueSongs];
            unsigned __int8 v19 = [v18 containsObject:v17];

            if ((v19 & 1) == 0)
            {
              v20 = [v12 uniqueSongs];
              [v20 addObject:v17];
            }
            id v21 = [v9 libraryAddedDate];
            if (v21)
            {
              v22 = [v29 components:28 fromDate:v21];
              v23 = [v12 uniqueDatesWithAddedContent];
              [v23 addObject:v22];
            }
            id v24 = [v9 lastPlayedDate];
            if (v24)
            {
              v25 = [v12 lastPlayedDate];
              v26 = [v25 laterDate:v24];

              [v12 setLastPlayedDate:v26];
            }

            uint64_t v7 = v30;
            id v4 = v31;
          }
          else
          {
            id v13 = [[ICMusicLibraryArtistAffinitySnapshot alloc] initWithContentItemSnapshot:v9];
            [v4 setValue:v13 forKey:v11];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }

  id v27 = [v4 allValues];

  return v27;
}

- (void)performLibraryAnalysisWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)sub_10003D108());
  [v5 setLabel:@"LibraryRecommendationArtistAffinity"];
  id v6 = [sub_10003D1EC() kindWithVariants:3];
  [v5 setItemKind:v6];

  uint64_t v7 = [(ICMusicLibraryArtistAffinityAnalyzer *)self _requestItemProperties];
  [v5 setItemProperties:v7];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D2D0;
  v9[3] = &unk_1001BA3A0;
  v9[4] = self;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v5 performWithResponseHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)createFeatureProviderDictionaryFromNewContentResponse:(id)a3 withLibraryArtistSnapshots:(id)a4
{
  id v91 = a3;
  id v5 = a4;
  id v6 = +[NSMutableDictionary dictionary];
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v5 objectAtIndex:v7];
      v9 = +[NSNumber numberWithInt:v7];
      id v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 artistAdamID]);
      [v6 setObject:v9 forKey:v10];

      ++v7;
    }
    while ((unint64_t)[v5 count] > v7);
  }
  id v87 = objc_alloc_init((Class)NSMutableArray);
  id v86 = objc_alloc_init((Class)NSMutableArray);
  v88 = v5;
  v76 = v6;
  id obj = (char *)[v91 artistContentsCount];
  if (obj)
  {
    for (i = 0; i != obj; ++i)
    {
      v12 = [v91 artistContentAtIndex:i];
      id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 adamId]);
      id v14 = [v6 objectForKey:v13];
      unsigned __int8 v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v5, "objectAtIndex:", (int)objc_msgSend(v14, "intValue"));
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        v96 = v16;
        id v17 = [v16 uniqueAlbums];
        id v82 = [v17 countByEnumeratingWithState:&v112 objects:v123 count:16];
        if (v82)
        {
          uint64_t v18 = *(void *)v113;
          v92 = v12;
          v89 = v13;
          v84 = v17;
          uint64_t v80 = *(void *)v113;
          do
          {
            unsigned __int8 v19 = 0;
            do
            {
              if (*(void *)v113 != v18) {
                objc_enumerationMutation(v17);
              }
              v20 = *(void **)(*((void *)&v112 + 1) + 8 * (void)v19);
              long long v108 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              id v21 = [v12 catalogContents];
              id v22 = [v21 countByEnumeratingWithState:&v108 objects:v122 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v109;
                while (2)
                {
                  for (j = 0; j != v23; j = (char *)j + 1)
                  {
                    if (*(void *)v109 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v108 + 1) + 8 * (void)j);
                    id v27 = [v20 storeAdamID];
                    if (v27 == [v26 adamId])
                    {

                      id v5 = v88;
                      id v13 = v89;
                      id v6 = v76;
                      v12 = v92;
                      goto LABEL_24;
                    }
                  }
                  id v23 = [v21 countByEnumeratingWithState:&v108 objects:v122 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              unsigned __int8 v19 = (char *)v19 + 1;
              id v17 = v84;
              id v6 = v76;
              v12 = v92;
              id v13 = v89;
              uint64_t v18 = v80;
            }
            while (v19 != v82);
            id v5 = v88;
            id v82 = [v84 countByEnumeratingWithState:&v112 objects:v123 count:16];
          }
          while (v82);
        }

        v28 = +[NSNumber numberWithInt:i];
        [v87 addObject:v28];

        [v86 addObject:v15];
LABEL_24:
      }
    }
  }
  id v29 = v87;
  uint64_t v30 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v87 count]);
  v121[0] = v30;
  v121[1] = &off_1001CBC30;
  uint64_t v31 = +[NSArray arrayWithObjects:v121 count:2];
  id v107 = 0;
  id v85 = [objc_alloc((Class)MLMultiArray) initWithShape:v31 dataType:131104 error:&v107];
  id v32 = v107;
  id v106 = v32;
  id v83 = [objc_alloc((Class)MLMultiArray) initWithShape:v31 dataType:131104 error:&v106];
  id v33 = v106;

  id v105 = v33;
  id v81 = [objc_alloc((Class)MLMultiArray) initWithShape:v31 dataType:131104 error:&v105];
  id v34 = v105;

  id v104 = v34;
  id v79 = [objc_alloc((Class)MLMultiArray) initWithShape:v31 dataType:131104 error:&v104];
  id v35 = v104;

  id v103 = v35;
  v93 = (void *)v31;
  id v78 = [objc_alloc((Class)MLMultiArray) initWithShape:v31 dataType:65600 error:&v103];
  id v97 = v103;

  long long v36 = +[NSMutableDictionary dictionary];
  v77 = v30;
  if ([v30 unsignedLongValue])
  {
    unint64_t v37 = 0;
    do
    {
      v38 = [v29 objectAtIndex:v37];
      signed int v39 = [v38 intValue];

      v90 = [v91 artistContentAtIndex:v39];
      v40 = [v90 catalogContentAtIndex:0];
      id v41 = [v40 contentFeatures];

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id obja = v41;
      id v42 = [obja countByEnumeratingWithState:&v99 objects:v120 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v100;
        do
        {
          for (k = 0; k != v43; k = (char *)k + 1)
          {
            if (*(void *)v100 != v44) {
              objc_enumerationMutation(obja);
            }
            v46 = *(void **)(*((void *)&v99 + 1) + 8 * (void)k);
            v47 = [v46 key];
            if (!v37)
            {
              id v48 = objc_alloc((Class)MLMultiArray);
              id v98 = v97;
              id v49 = [v48 initWithShape:v93 dataType:65600 error:&v98];
              id v50 = v98;

              [v36 setObject:v49 forKey:v47];
              id v97 = v50;
            }
            v51 = [v36 objectForKey:v47];
            [v46 valueAtIndex:0];
            v52 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            [v51 setObject:v52 atIndexedSubscript:v37];
          }
          id v43 = [obja countByEnumeratingWithState:&v99 objects:v120 count:16];
        }
        while (v43);
      }

      v53 = [v86 objectAtIndex:v37];
      signed int v54 = [v53 intValue];

      id v5 = v88;
      v55 = [v88 objectAtIndex:v54];
      v56 = [v55 uniqueDatesWithAddedContent];
      v57 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v56 count]);
      [v85 setObject:v57 atIndexedSubscript:v37];

      v58 = [v55 uniqueAlbums];
      v59 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v58 count]);
      [v83 setObject:v59 atIndexedSubscript:v37];

      v60 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v55 cumulativePlayCount]);
      [v81 setObject:v60 atIndexedSubscript:v37];

      v61 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v55 daysSinceLastPlayedDate]);
      [v79 setObject:v61 atIndexedSubscript:v37];

      [v55 averagePlaysPerItemAdded];
      v62 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v78 setObject:v62 atIndexedSubscript:v37];

      ++v37;
      id v29 = v87;
    }
    while ((unint64_t)[v77 unsignedLongValue] > v37);
  }
  id v63 = [v29 count];
  if (v63 != [v85 count]) {
    __assert_rtn("-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]", "ICMusicLibraryArtistAffinityAnalyzer.m", 163, "releaseIx.count == daysWithAdds.count");
  }
  id v64 = [v29 count];
  if (v64 != [v83 count]) {
    __assert_rtn("-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]", "ICMusicLibraryArtistAffinityAnalyzer.m", 164, "releaseIx.count == albumCount.count");
  }
  id v65 = [v29 count];
  if (v65 != [v81 count]) {
    __assert_rtn("-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]", "ICMusicLibraryArtistAffinityAnalyzer.m", 165, "releaseIx.count == playCount.count");
  }
  id v66 = [v29 count];
  if (v66 != [v79 count]) {
    __assert_rtn("-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]", "ICMusicLibraryArtistAffinityAnalyzer.m", 166, "releaseIx.count == daysSinceLastPlay.count");
  }
  id v67 = [v29 count];
  if (v67 != [v78 count]) {
    __assert_rtn("-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]", "ICMusicLibraryArtistAffinityAnalyzer.m", 167, "releaseIx.count == playsPerItem.count");
  }
  id v68 = +[NSMutableDictionary dictionary];
  id v69 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    id v119 = v85;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ MLModel inputs: unique days with added content: %{public}@", buf, 0x16u);
  }

  [v68 setValue:v85 forKey:@"days_with_adds"];
  id v70 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    id v119 = v83;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ MLModel inputs: number of unique albums: %{public}@", buf, 0x16u);
  }

  [v68 setValue:v83 forKey:@"num_albums"];
  v71 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    id v119 = v81;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ MLModel inputs: cumulative song play count: %{public}@", buf, 0x16u);
  }

  [v68 setValue:v81 forKey:@"num_plays"];
  v72 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    id v119 = v79;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ MLModel inputs: number of days since last play: %{public}@", buf, 0x16u);
  }

  [v68 setValue:v79 forKey:@"days_since_last_play"];
  v73 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    id v119 = v78;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ MLModel inputs: average plays per item added: %{public}@", buf, 0x16u);
  }

  [v68 setValue:v78 forKey:@"plays_per_item"];
  [v68 addEntriesFromDictionary:v36];
  [v68 setValue:v29 forKey:@"release_ix"];

  return v68;
}

- (void)performLibraryAnalysisFromResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)sub_10003D108());
  [v8 setLabel:@"LibraryRecommendationArtistAffinity"];
  v9 = [sub_10003D1EC() kindWithVariants:3];
  [v8 setItemKind:v9];

  id v10 = [(ICMusicLibraryArtistAffinityAnalyzer *)self _requestItemProperties];
  [v8 setItemProperties:v10];

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003E4C0;
  v13[3] = &unk_1001BA378;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v8 performWithResponseHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

@end