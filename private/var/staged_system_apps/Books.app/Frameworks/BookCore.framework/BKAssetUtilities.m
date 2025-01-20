@interface BKAssetUtilities
+ (BOOL)filenameForAsset:(id)a3 matches:(id)a4;
+ (BOOL)isAggregateContentType:(signed __int16)a3;
+ (BOOL)isAudiobookTrackContentType:(signed __int16)a3;
+ (BOOL)requiresAggregateContentType:(signed __int16)a3;
+ (BOOL)supportsRestorationSnapshots:(signed __int16)a3;
+ (id)aggregateIdentifierFromAsset:(id)a3;
+ (id)aggregateIdentifierFromAssetID:(id)a3 assetURL:(id)a4 contentType:(signed __int16)a5;
+ (id)descriptionForAsset:(id)a3;
+ (id)dictionaryRepresentationForAsset:(id)a3;
+ (id)localizedAssetKindForContentType:(signed __int16)a3;
+ (id)pathExtensionForContentType:(signed __int16)a3;
+ (id)utiTypeForContentType:(signed __int16)a3;
+ (signed)assetContentTypeForBKAssetContentType:(id)a3;
+ (signed)assetContentTypeForContentType:(signed __int16)a3;
+ (signed)contentTypeForBKAssetContentType:(signed __int16)a3;
+ (signed)contentTypeForExtension:(id)a3;
+ (signed)contentTypeForPath:(id)a3;
@end

@implementation BKAssetUtilities

+ (signed)contentTypeForBKAssetContentType:(signed __int16)a3
{
  uint64_t v3 = a3 - 1;
  if (v3 > 0x12) {
    return -1;
  }
  else {
    return word_2A22A0[v3];
  }
}

+ (signed)assetContentTypeForContentType:(signed __int16)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return word_2A22C6[a3];
  }
}

+ (signed)assetContentTypeForBKAssetContentType:(id)a3
{
  id v3 = a3;
  if (v3
    && ([&off_2E79E8 objectForKeyedSubscript:v3],
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    signed __int16 v6 = (unsigned __int16)[v4 integerValue];
  }
  else
  {
    signed __int16 v6 = 0;
  }

  return v6;
}

+ (signed)contentTypeForExtension:(id)a3
{
  id v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"epub"])
  {
    signed __int16 v4 = 1;
  }
  else if ([v3 isEqualToString:@"pdf"])
  {
    signed __int16 v4 = 3;
  }
  else if ([v3 isEqualToString:@"ibooks"])
  {
    signed __int16 v4 = 4;
  }
  else if ([v3 isEqualToString:@"m4a"])
  {
    signed __int16 v4 = 7;
  }
  else if (([v3 isEqualToString:@"m4b"] & 1) != 0 {
         || ([v3 isEqualToString:@"m4p"] & 1) != 0)
  }
  {
    signed __int16 v4 = 8;
  }
  else if ([v3 isEqualToString:@"aa"])
  {
    signed __int16 v4 = 9;
  }
  else if ([v3 isEqualToString:@"aax"])
  {
    signed __int16 v4 = 10;
  }
  else if ([v3 isEqualToString:@"mp3"])
  {
    signed __int16 v4 = 11;
  }
  else if ([v3 isEqualToString:@"mp4"])
  {
    signed __int16 v4 = 19;
  }
  else if (([v3 isEqualToString:@"aac"] & 1) != 0 {
         || ([v3 isEqualToString:@"adts"] & 1) != 0)
  }
  {
    signed __int16 v4 = 12;
  }
  else if ([v3 isEqualToString:@"ac3"])
  {
    signed __int16 v4 = 13;
  }
  else if (([v3 isEqualToString:@"aif"] & 1) != 0 {
         || ([v3 isEqualToString:@"aiff"] & 1) != 0
  }
         || ([v3 isEqualToString:@"aifc"] & 1) != 0)
  {
    signed __int16 v4 = 14;
  }
  else if ([v3 isEqualToString:@"caf"])
  {
    signed __int16 v4 = 15;
  }
  else if (([v3 isEqualToString:@"snd"] & 1) != 0 {
         || ([v3 isEqualToString:@"au"] & 1) != 0)
  }
  {
    signed __int16 v4 = 17;
  }
  else if ([v3 isEqualToString:@"sd2"])
  {
    signed __int16 v4 = 16;
  }
  else if ([v3 isEqualToString:@"wav"])
  {
    signed __int16 v4 = 18;
  }
  else
  {
    signed __int16 v4 = 0;
  }

  return v4;
}

+ (id)pathExtensionForContentType:(signed __int16)a3
{
  uint64_t v3 = a3 - 1;
  if (v3 > 0x12) {
    return 0;
  }
  else {
    return *(&off_2C8030 + v3);
  }
}

+ (id)utiTypeForContentType:(signed __int16)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1:
      signed __int16 v4 = (id *)&UTTypeEPUB;
      goto LABEL_7;
    case 2:
      signed __int16 v4 = (id *)&UTTypeText;
      goto LABEL_7;
    case 3:
      signed __int16 v4 = (id *)&UTTypePDF;
      goto LABEL_7;
    case 4:
      uint64_t v3 = @"com.apple.ibooks-container";
      break;
    case 6:
      signed __int16 v4 = (id *)&UTTypeDirectory;
LABEL_7:
      uint64_t v3 = [*v4 identifier];
      break;
    case 7:
      uint64_t v3 = @"com.apple.m4a-audio";
      break;
    case 8:
      uint64_t v3 = @"com.apple.protected-mpeg-4-audio";
      break;
    case 9:
      uint64_t v3 = @"com.audible.aa-audiobook";
      break;
    case 10:
      uint64_t v3 = @"com.audible.aax-audiobook";
      break;
    case 11:
      uint64_t v3 = @"public.mp3";
      break;
    case 12:
      uint64_t v3 = @"public.aac-audio";
      break;
    case 13:
      uint64_t v3 = @"public.ac3-audio";
      break;
    case 14:
      uint64_t v3 = @"public.aiff-audio";
      break;
    case 15:
      uint64_t v3 = @"com.apple.coreaudio-format";
      break;
    case 16:
      uint64_t v3 = @"com.digidesign.sd2-audio";
      break;
    case 17:
      uint64_t v3 = @"public.au-audio";
      break;
    case 18:
      uint64_t v3 = @"com.microsoft.waveform-audio";
      break;
    case 19:
      uint64_t v3 = @"public.mpeg-4";
      break;
    default:
      break;
  }

  return v3;
}

+ (BOOL)supportsRestorationSnapshots:(signed __int16)a3
{
  return a3 == 1;
}

+ (BOOL)isAggregateContentType:(signed __int16)a3
{
  return a3 == 6;
}

+ (BOOL)requiresAggregateContentType:(signed __int16)a3
{
  return +[BKAssetUtilities isAudiobookTrackContentType:a3];
}

+ (BOOL)isAudiobookTrackContentType:(signed __int16)a3
{
  return (unsigned __int16)a3 - 7 < 0xD;
}

+ (id)aggregateIdentifierFromAsset:(id)a3
{
  id v3 = a3;
  signed __int16 v4 = [v3 assetID];
  v5 = [v3 url];
  id v6 = [v3 contentType];

  v7 = +[BKAssetUtilities aggregateIdentifierFromAssetID:v4 assetURL:v5 contentType:v6];

  return v7;
}

+ (id)aggregateIdentifierFromAssetID:(id)a3 assetURL:(id)a4 contentType:(signed __int16)a5
{
  uint64_t v5 = a5;
  id v7 = a4;
  id v8 = [a3 copy];
  if (+[BKAssetUtilities requiresAggregateContentType:v5])
  {
    v9 = [v7 lastPathComponent];
    if ([v9 length])
    {
      uint64_t v10 = +[NSString stringWithFormat:@"%@-%@", v8, v9];

      id v8 = (id)v10;
    }
  }

  return v8;
}

+ (BOOL)filenameForAsset:(id)a3 matches:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v7 = [v6 filenameMatches:v5];
  }
  else
  {
    id v8 = [v6 url];

    v9 = [v8 lastPathComponent];
    unsigned __int8 v7 = [v9 isEqualToString:v5];

    id v6 = v8;
  }

  return v7;
}

+ (signed)contentTypeForPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pathExtension];
  id v6 = [v5 lowercaseString];

  if ([v6 length])
  {
    signed __int16 v7 = (unsigned __int16)[a1 contentTypeForExtension:v6];
  }
  else if ([v4 length])
  {
    id v8 = +[NSURL fileURLWithPath:v4];
    if (objc_msgSend(v8, "bu_isFolder"))
    {
      v9 = +[NSFileManager defaultManager];
      uint64_t v10 = [v9 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:0 options:4 error:0];

      if ([v10 count])
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12)
        {
          id v13 = v12;
          v19 = v10;
          uint64_t v14 = *(void *)v21;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) pathExtension];
              v17 = [v16 lowercaseString];

              LODWORD(v16) = [a1 isAudiobookTrackContentType:[a1 contentTypeForExtension:v17]];
              if (!v16)
              {
                signed __int16 v7 = 0;
                goto LABEL_18;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          signed __int16 v7 = 6;
LABEL_18:
          uint64_t v10 = v19;
        }
        else
        {
          signed __int16 v7 = 6;
        }
      }
      else
      {
        signed __int16 v7 = 0;
      }
    }
    else
    {
      signed __int16 v7 = 0;
    }
  }
  else
  {
    signed __int16 v7 = 0;
  }

  return v7;
}

+ (id)localizedAssetKindForContentType:(signed __int16)a3
{
  switch(a3)
  {
    case 0:
    case 5:
      id v6 = &stru_2CE418;
      break;
    case 1:
    case 4:
      id v3 = IMCommonCoreBundle();
      id v4 = v3;
      CFStringRef v5 = @"Book";
      goto LABEL_3;
    case 2:
      id v3 = IMCommonCoreBundle();
      id v4 = v3;
      CFStringRef v5 = @"Text";
      goto LABEL_3;
    case 3:
      id v3 = IMCommonCoreBundle();
      id v4 = v3;
      CFStringRef v5 = @"PDF document";
      goto LABEL_3;
    case 6:
      id v3 = IMCommonCoreBundle();
      id v4 = v3;
      CFStringRef v5 = @"Audiobook";
      goto LABEL_3;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      id v3 = IMCommonCoreBundle();
      id v4 = v3;
      CFStringRef v5 = @"Audiobook Track";
LABEL_3:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (id)dictionaryRepresentationForAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v5 = [v3 accountID];

  if (v5)
  {
    id v6 = [v3 accountID];
    [v4 setObject:v6 forKeyedSubscript:@"accountID"];
  }
  signed __int16 v7 = [v3 assetID];

  if (v7)
  {
    id v8 = [v3 assetID];
    [v4 setObject:v8 forKeyedSubscript:@"assetID"];
  }
  v9 = [v3 temporaryAssetID];

  if (v9)
  {
    uint64_t v10 = [v3 temporaryAssetID];
    [v4 setObject:v10 forKeyedSubscript:@"temporaryAssetID"];
  }
  id v11 = [v3 storeID];

  if (v11)
  {
    id v12 = [v3 storeID];
    [v4 setObject:v12 forKeyedSubscript:@"storeID"];
  }
  id v13 = [v3 author];

  if (v13)
  {
    uint64_t v14 = [v3 author];
    [v4 setObject:v14 forKeyedSubscript:@"author"];
  }
  if (objc_opt_respondsToSelector())
  {
    v15 = [v3 authorCount];

    if (v15)
    {
      v16 = [v3 authorCount];
      [v4 setObject:v16 forKeyedSubscript:@"authorCount"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v17 = [v3 authorNames];

    if (v17)
    {
      v18 = [v3 authorNames];
      [v4 setObject:v18 forKeyedSubscript:@"authorNames"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v19 = [v3 hasTooManyAuthors];

    if (v19)
    {
      long long v20 = [v3 hasTooManyAuthors];
      [v4 setObject:v20 forKeyedSubscript:@"hasTooManyAuthors"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v21 = [v3 narratorCount];

    if (v21)
    {
      long long v22 = [v3 narratorCount];
      [v4 setObject:v22 forKeyedSubscript:@"narratorCount"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v23 = [v3 narratorNames];

    if (v23)
    {
      v24 = [v3 narratorNames];
      [v4 setObject:v24 forKeyedSubscript:@"narratorNames"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v25 = [v3 hasTooManyNarrators];

    if (v25)
    {
      v26 = [v3 hasTooManyNarrators];
      [v4 setObject:v26 forKeyedSubscript:@"hasTooManyNarrators"];
    }
  }
  v27 = [v3 title];

  if (v27)
  {
    v28 = [v3 title];
    [v4 setObject:v28 forKeyedSubscript:@"title"];
  }
  v29 = [v3 sortTitle];

  if (v29)
  {
    v30 = [v3 sortTitle];
    [v4 setObject:v30 forKeyedSubscript:@"sortTitle"];
  }
  v31 = [v3 url];

  if (v31)
  {
    v32 = [v3 url];
    v33 = [v32 absoluteString];
    [v4 setObject:v33 forKeyedSubscript:@"url"];
  }
  v34 = [v3 genre];

  if (v34)
  {
    v35 = [v3 genre];
    [v4 setObject:v35 forKeyedSubscript:@"genre"];
  }
  if (objc_opt_respondsToSelector())
  {
    v36 = [v3 genres];

    if (v36)
    {
      v37 = [v3 genres];
      [v4 setObject:v37 forKeyedSubscript:@"genres"];
    }
  }
  v38 = [v3 dataSourceIdentifier];

  if (v38)
  {
    v39 = [v3 dataSourceIdentifier];
    [v4 setObject:v39 forKeyedSubscript:@"dataSourceIdentifier"];
  }
  v40 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 generation]);
  [v4 setObject:v40 forKeyedSubscript:@"generation"];

  v41 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 fileSize]);
  [v4 setObject:v41 forKeyedSubscript:@"fileSize"];

  v42 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v3 contentType]);
  [v4 setObject:v42 forKeyedSubscript:@"contentType"];

  v43 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v3 state]);
  [v4 setObject:v43 forKeyedSubscript:@"state"];

  v44 = [v3 dataSourceInsertionDate];

  if (v44)
  {
    v45 = [v3 dataSourceInsertionDate];
    [v4 setObject:v45 forKeyedSubscript:@"dataSourceInsertionDate"];
  }
  v46 = [v3 releaseDate];

  if (v46)
  {
    v47 = [v3 releaseDate];
    [v4 setObject:v47 forKeyedSubscript:@"releaseDate"];
  }
  v48 = [v3 purchaseDate];

  if (v48)
  {
    v49 = [v3 purchaseDate];
    [v4 setObject:v49 forKeyedSubscript:@"purchaseDate"];
  }
  v50 = [v3 expectedDate];

  if (v50)
  {
    v51 = [v3 expectedDate];
    [v4 setObject:v51 forKeyedSubscript:@"expectedDate"];
  }
  v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 shouldDisableOptimizeSpeed]);
  [v4 setObject:v52 forKeyedSubscript:@"shouldDisableOptimizeSpeed"];

  v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 shouldDisableTouchEmulation]);
  [v4 setObject:v53 forKeyedSubscript:@"shouldDisableTouchEmulation"];

  v54 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v3 desktopSupportLevel]);
  [v4 setObject:v54 forKeyedSubscript:@"desktopSupportLevel"];

  v55 = [v3 scrollDirection];

  if (v55)
  {
    v56 = [v3 scrollDirection];
    [v4 setObject:v56 forKeyedSubscript:@"scrollDirection"];
  }
  v57 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 pageCount]);
  [v4 setObject:v57 forKeyedSubscript:@"pageCount"];

  v58 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 rating]);
  [v4 setObject:v58 forKeyedSubscript:@"rating"];

  v59 = [v3 updateDate];

  if (v59)
  {
    v60 = [v3 updateDate];
    [v4 setObject:v60 forKeyedSubscript:@"updateDate"];
  }
  v61 = [v3 versionNumber];

  if (v61)
  {
    v62 = [v3 versionNumber];
    [v4 setObject:v62 forKeyedSubscript:@"versionNumber"];
  }
  v63 = [v3 bookDescription];

  if (v63)
  {
    v64 = [v3 bookDescription];
    [v4 setObject:v64 forKeyedSubscript:@"bookDescription"];
  }
  v65 = [v3 comments];

  if (v65)
  {
    v66 = [v3 comments];
    [v4 setObject:v66 forKeyedSubscript:@"comments"];
  }
  v67 = [v3 kind];

  if (v67)
  {
    v68 = [v3 kind];
    [v4 setObject:v68 forKeyedSubscript:@"kind"];
  }
  v69 = [v3 year];

  if (v69)
  {
    v70 = [v3 year];
    [v4 setObject:v70 forKeyedSubscript:@"year"];
  }
  v71 = [v3 grouping];

  if (v71)
  {
    v72 = [v3 grouping];
    [v4 setObject:v72 forKeyedSubscript:@"grouping"];
  }
  v73 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 computedRating]);
  [v4 setObject:v73 forKeyedSubscript:@"computedRating"];

  v74 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 metadataMigrationVersion]);
  [v4 setObject:v74 forKeyedSubscript:@"metadataMigrationVersion"];

  if (objc_opt_respondsToSelector())
  {
    v75 = [v3 assetIsHidden];

    if (v75)
    {
      v76 = [v3 assetIsHidden];
      [v4 setObject:v76 forKeyedSubscript:@"assetIsHidden"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v77 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 storeFrontID]);
    [v4 setObject:v77 forKeyedSubscript:@"storeFrontID"];
  }
  if (objc_opt_respondsToSelector())
  {
    v78 = [v3 coverAspectRatio];

    if (v78)
    {
      v79 = [v3 coverAspectRatio];
      [v4 setObject:v79 forKeyedSubscript:@"coverAspectRatio"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v80 = [v3 seriesIsHidden];

    if (v80)
    {
      v81 = [v3 seriesIsHidden];
      [v4 setObject:v81 forKeyedSubscript:@"seriesIsHidden"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v82 = [v3 seriesIsCloudOnly];

    if (v82)
    {
      v83 = [v3 seriesIsCloudOnly];
      [v4 setObject:v83 forKeyedSubscript:@"seriesIsCloudOnly"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v84 = [v3 seriesIsOrdered];

    if (v84)
    {
      v85 = [v3 seriesIsOrdered];
      [v4 setObject:v85 forKeyedSubscript:@"seriesIsOrdered"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v86 = [v3 sequenceDisplayName];

    if (v86)
    {
      v87 = [v3 sequenceDisplayName];
      [v4 setObject:v87 forKeyedSubscript:@"sequenceDisplayName"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v88 = [v3 sequenceNumber];

    if (v88)
    {
      v89 = [v3 sequenceNumber];
      [v4 setObject:v89 forKeyedSubscript:@"sequenceNumber"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v90 = [v3 seriesID];

    if (v90)
    {
      v91 = [v3 seriesID];
      [v4 setObject:v91 forKeyedSubscript:@"seriesID"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v92 = [v3 isStoreAudiobook];

    if (v92)
    {
      v93 = [v3 isStoreAudiobook];
      [v4 setObject:v93 forKeyedSubscript:@"isStoreAudiobook"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v94 = [v3 mappedAssetID];

    if (v94)
    {
      v95 = [v3 mappedAssetID];
      [v4 setObject:v95 forKeyedSubscript:@"mappedAssetID"];
    }
  }
  v96 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v3 mappedAssetContentType]);
  [v4 setObject:v96 forKeyedSubscript:@"mappedAssetContentType"];

  if (objc_opt_respondsToSelector())
  {
    v97 = [v3 hasRACSupport];

    if (v97)
    {
      v98 = [v3 hasRACSupport];
      [v4 setObject:v98 forKeyedSubscript:@"hasRACSupport"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v99 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isSupplementalContent]);
    [v4 setObject:v99 forKeyedSubscript:@"isSupplementalContent"];
  }
  if (objc_opt_respondsToSelector())
  {
    v100 = [v3 storePlaylistID];

    if (v100)
    {
      v101 = [v3 storePlaylistID];
      [v4 setObject:v101 forKeyedSubscript:@"storePlaylistID"];
    }
  }
  id v102 = v4;

  return v102;
}

+ (id)descriptionForAsset:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  CFStringRef v5 = NSStringFromClass(v4);
  id v6 = +[NSMutableString stringWithFormat:@"\n%@: <%p>", v5, v3];

  uint64_t v7 = [v3 assetID];
  id v8 = (void *)v7;
  if (v7) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"assetID", v7];
  }

  uint64_t v9 = [v3 title];
  uint64_t v10 = (void *)v9;
  if (v9) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"title", v9];
  }

  uint64_t v11 = [v3 sortTitle];
  id v12 = (void *)v11;
  if (v11) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"sortTitle", v11];
  }

  uint64_t v13 = [v3 author];
  uint64_t v14 = (void *)v13;
  if (v13) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"author", v13];
  }

  uint64_t v15 = [v3 sortAuthor];
  v16 = (void *)v15;
  if (v15) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"sortAuthor", v15];
  }

  uint64_t v17 = [v3 storeID];
  v18 = (void *)v17;
  if (v17) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"storeID", v17];
  }

  uint64_t v19 = [v3 temporaryAssetID];
  long long v20 = (void *)v19;
  if (v19) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"temporaryAssetID", v19];
  }

  uint64_t v21 = [v3 accountID];
  long long v22 = (void *)v21;
  if (v21) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"accountID", v21];
  }

  if ([v3 contentType])
  {
    long long v23 = BKStringFromAssetContentType([v3 contentType]);
    [v6 appendFormat:@"\n\tcontentType :  %@", v23];
  }
  if ([v3 state])
  {
    unsigned int v24 = [v3 state];
    if (v24 > 6) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = (uint64_t)*(&off_2C8168 + (int)v24);
    }
    [v6 appendFormat:@"\n\tstate :  %@", v25];
  }
  uint64_t v26 = [v3 genre];
  v27 = (void *)v26;
  if (v26) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"genre", v26];
  }

  uint64_t v28 = [v3 dataSourceIdentifier];
  v29 = (void *)v28;
  if (v28) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"dataSourceIdentifier", v28];
  }

  uint64_t v30 = [v3 bookDescription];
  v31 = (void *)v30;
  if (v30) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"bookDescription", v30];
  }

  uint64_t v32 = [v3 comments];
  v33 = (void *)v32;
  if (v32) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"comments", v32];
  }

  uint64_t v34 = [v3 kind];
  v35 = (void *)v34;
  if (v34) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"kind", v34];
  }

  uint64_t v36 = [v3 isExplicit];
  v37 = (void *)v36;
  if (v36) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"isExplicit", v36];
  }

  uint64_t v38 = [v3 year];
  v39 = (void *)v38;
  if (v38) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"year", v38];
  }

  uint64_t v40 = [v3 versionNumber];
  v41 = (void *)v40;
  if (v40) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"versionNumber", v40];
  }

  uint64_t v42 = [v3 versionNumberHumanReadable];
  v43 = (void *)v42;
  if (v42) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"versionNumberHumanReadable", v42];
  }

  uint64_t v44 = [v3 dataSourceInsertionDate];
  v45 = (void *)v44;
  if (v44) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"dataSourceInsertionDate", v44];
  }

  uint64_t v46 = [v3 releaseDate];
  v47 = (void *)v46;
  if (v46) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"releaseDate", v46];
  }

  uint64_t v48 = [v3 purchaseDate];
  v49 = (void *)v48;
  if (v48) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"purchaseDate", v48];
  }

  uint64_t v50 = [v3 expectedDate];
  v51 = (void *)v50;
  if (v50) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"expectedDate", v50];
  }

  uint64_t v52 = [v3 lastOpenDate];
  v53 = (void *)v52;
  if (v52) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"lastOpenDate", v52];
  }

  uint64_t v54 = [v3 updateDate];
  v55 = (void *)v54;
  if (v54) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"updateDate", v54];
  }

  id v56 = [v3 generation];
  sub_A31C4((uint64_t)v56, v6, (uint64_t)v56, @"generation");
  id v57 = [v3 fileSize];
  sub_A31C4((uint64_t)v57, v6, (uint64_t)v57, @"fileSize");
  id v58 = [v3 pageCount];
  sub_A31C4((uint64_t)v58, v6, (uint64_t)v58, @"pageCount");
  id v59 = [v3 rating];
  sub_A31C4((uint64_t)v59, v6, (uint64_t)v59, @"rating");
  if ([v3 isSample]) {
    [v6 appendFormat:@"\n\t%@ :  YES", @"sample"];
  }
  if ([v3 isProof]) {
    [v6 appendFormat:@"\n\t%@ :  YES", @"proof"];
  }
  if ([v3 isCompressed]) {
    [v6 appendFormat:@"\n\t%@ :  YES", @"compressed"];
  }
  if ([v3 isLocked]) {
    [v6 appendFormat:@"\n\t%@ :  YES", @"locked"];
  }
  if ([v3 isEphemeral]) {
    [v6 appendFormat:@"\n\t%@ :  YES", @"ephemeral"];
  }
  if (objc_opt_respondsToSelector())
  {
    id v60 = [v3 storeFrontID];
    sub_A31C4((uint64_t)v60, v6, (uint64_t)v60, @"storeFrontID");
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v61 = [v3 assetIsHidden];
    v62 = (void *)v61;
    if (v61) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"assetIsHidden", v61];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v63 = [v3 coverAspectRatio];
    v64 = (void *)v63;
    if (v63) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"coverAspectRatio", v63];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v65 = [v3 seriesIsHidden];
    v66 = (void *)v65;
    if (v65) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"seriesIsHidden", v65];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v67 = [v3 seriesIsCloudOnly];
    v68 = (void *)v67;
    if (v67) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"seriesIsCloudOnly", v67];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v69 = [v3 seriesIsOrdered];
    v70 = (void *)v69;
    if (v69) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"seriesIsOrdered", v69];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v71 = [v3 seriesSortKey];
    v72 = (void *)v71;
    if (v71) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"seriesSortKey", v71];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v73 = [v3 sequenceDisplayName];
    v74 = (void *)v73;
    if (v73) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"sequenceDisplayName", v73];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v75 = [v3 seriesID];
    v76 = (void *)v75;
    if (v75) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"seriesID", v75];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v77 = [v3 permlink];
    v78 = (void *)v77;
    if (v77) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"permlink", v77];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v79 = [v3 isStoreAudiobook];
    v80 = (void *)v79;
    if (v79) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"isStoreAudiobook", v79];
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 isSupplementalContent]) {
    [v6 appendFormat:@"\n\t%@ :  YES", @"supplementalContent"];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v81 = [v3 storePlaylistID];
    v82 = (void *)v81;
    if (v81) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"storePlaylistID", v81];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v83 = [v3 hasRACSupport];
    v84 = (void *)v83;
    if (v83) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"hasRACSupport", v83];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v85 = [v3 genres];
    v86 = (void *)v85;
    if (v85) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"genres", v85];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v87 = [v3 authorCount];
    v88 = (void *)v87;
    if (v87) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"authorCount", v87];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v89 = [v3 authorNames];
    v90 = (void *)v89;
    if (v89) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"authorNames", v89];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v91 = [v3 hasTooManyAuthors];
    v92 = (void *)v91;
    if (v91) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"hasTooManyAuthors", v91];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v93 = [v3 narratorCount];
    v94 = (void *)v93;
    if (v93) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"narratorCount", v93];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v95 = [v3 narratorNames];
    v96 = (void *)v95;
    if (v95) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"narratorNames", v95];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v97 = [v3 hasTooManyNarrators];
    v98 = (void *)v97;
    if (v97) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"hasTooManyNarrators", v97];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v99 = [v3 mappedAssetID];
    v100 = (void *)v99;
    if (v99) {
      [v6 appendFormat:@"\n\t%@ :  %@", @"mappedAssetID", v99];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v101 = BKStringFromAssetContentType([v3 mappedAssetContentType]);
    [v6 appendFormat:@"\n\tmappedAssetContentType :  %@", v101];
  }
  uint64_t v102 = [v3 url];
  v103 = (void *)v102;
  if (v102) {
    [v6 appendFormat:@"\n\t%@ :  %@", @"url", v102];
  }

  v104 = [v3 url];
  unsigned int v105 = [v104 isFileURL];

  if (v105)
  {
    v106 = [v3 url];
    v107 = [v3 url];
    v108 = [BCUbiquityMetadataHelper ubiquityMetadataForURL:v106 options:-262145 needsCoordination:[v107 bc_isUbiquitous]];

    if ([v108 count])
    {
      [v6 appendFormat:@"\n\txattr metadata : "];
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      v109 = [v108 allKeys];
      id v110 = [v109 countByEnumeratingWithState:&v117 objects:v121 count:16];
      if (v110)
      {
        id v111 = v110;
        uint64_t v112 = *(void *)v118;
        do
        {
          for (i = 0; i != v111; i = (char *)i + 1)
          {
            if (*(void *)v118 != v112) {
              objc_enumerationMutation(v109);
            }
            uint64_t v114 = *(void *)(*((void *)&v117 + 1) + 8 * i);
            v115 = [v108 objectForKey:v114];
            [v6 appendFormat:@"\n\t\t\t%@: %@", v114, v115];
          }
          id v111 = [v109 countByEnumeratingWithState:&v117 objects:v121 count:16];
        }
        while (v111);
      }
    }
  }
  [v6 appendFormat:@"\n"];

  return v6;
}

@end