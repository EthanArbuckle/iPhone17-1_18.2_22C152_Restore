@interface TVUNUpNextWidgetDataSource
+ (id)_contentGroupWithContinuations:(id)a3 widgetSize:(unint64_t)a4 expiration:(id)a5;
+ (id)_contentItemWithContinuation:(id)a3 mediaItem:(id)a4 widgetSize:(unint64_t)a5 itemPosition:(int)a6;
+ (id)_contentItemsWithContinuations:(id)a3 widgetSize:(unint64_t)a4;
+ (id)cropCodeForContentType:(unint64_t)a3;
+ (void)_processContinuationsDelta:(id)a3 withCompletion:(id)a4;
+ (void)fetchUpNext:(unint64_t)a3 withCompletion:(id)a4;
@end

@implementation TVUNUpNextWidgetDataSource

+ (void)fetchUpNext:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (qword_10012FF98[0] != -1) {
    dispatch_once(qword_10012FF98, &stru_10011FC18);
  }
  v7 = sub_1000054E4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TVUNUpNextWidgetDataSource - Begin FetchUpNextWidget", buf, 2u);
  }

  +[NSDate date];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005E78;
  v17[3] = &unk_10011FC40;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v6;
  id v8 = v6;
  id v9 = v18;
  v10 = objc_retainBlock(v17);
  v11 = +[WLKConfigurationManager sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005FCC;
  v13[3] = &unk_10011FCE0;
  id v14 = v10;
  id v15 = a1;
  unint64_t v16 = a3;
  v12 = v10;
  [v11 fetchConfigurationWithCompletionHandler:v13];
}

+ (id)_contentGroupWithContinuations:(id)a3 widgetSize:(unint64_t)a4 expiration:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _contentItemsWithContinuations:a3 widgetSize:a4];
  if ([v9 count])
  {
    v10 = objc_alloc_init(TVUNContentItemGroup);
    int v11 = _os_feature_enabled_impl();
    v12 = @"UP_NEXT";
    if (v11) {
      v12 = @"CONTINUE_WATCHING";
    }
    v13 = v12;
    id v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:v13 value:&stru_100124688 table:0];

    [(TVUNContentItemGroup *)v10 setTitle:v15];
    [(TVUNContentItemGroup *)v10 setItems:v9];
    [(TVUNContentItemGroup *)v10 setExpirationDate:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)_processContinuationsDelta:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_1000054E4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TVUNUpNextWidgetDataSource - Begin fetching delta", buf, 2u);
  }

  id v8 = +[NSDate date];
  id v9 = +[WLKUpNextDeltaStore sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006B90;
  v13[3] = &unk_10011FD08;
  id v14 = v8;
  id v15 = v5;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  id v12 = v8;
  [v9 read:v13];
}

+ (id)_contentItemsWithContinuations:(id)a3 widgetSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  +[TVUNRentalUtilities fetchRentals];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007200;
  v12[3] = &unk_10011FD30;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = a1;
  unint64_t v17 = a4;
  id v13 = v8;
  id v15 = v18;
  id v9 = v7;
  id v14 = v9;
  [v6 enumerateObjectsUsingBlock:v12];
  id v10 = [v9 copy];

  _Block_object_dispose(v18, 8);

  return v10;
}

+ (id)_contentItemWithContinuation:(id)a3 mediaItem:(id)a4 widgetSize:(unint64_t)a5 itemPosition:(int)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 movieOrShowContent];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v9;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  id v16 = [v11 canonicalID];

  if (!v16)
  {
    id v18 = sub_1000054E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1000E3798(v9, v18);
    }
    goto LABEL_21;
  }
  if (v13)
  {
    uint64_t v17 = [v13 tvun_punchoutURL:0];
  }
  else
  {
    if (!v15) {
      goto LABEL_19;
    }
    uint64_t v17 = [v15 tvun_defaultActionURL];
  }
  int v19 = (void *)v17;
  if (!v17)
  {
LABEL_19:
    id v18 = sub_1000054E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000E3824(v9, v18);
    }
LABEL_21:
    v28 = 0;
    goto LABEL_67;
  }
  v77 = v10;
  v80 = [v11 canonicalID];
  v81 = [v9 localizedContext];
  v83 = [v11 title];
  v20 = [v11 genres];
  v21 = [v20 firstObject];
  v22 = [v21 name];

  v82 = [v9 tvun_contextString];
  v79 = +[TVUNUpNextWidgetDataSource cropCodeForContentType:](TVUNUpNextWidgetDataSource, "cropCodeForContentType:", [v11 contentType]);
  if ([v9 contextEnum] == (id)1)
  {
    if (v13)
    {
      v23 = [v13 playable];
      v24 = [v23 playEvent];

      if (v24)
      {
        [v24 elapsedTime];
        double v26 = v25;
        [v24 duration];
        v78 = +[NSNumber numberWithDouble:fmax(v26 / v27, 0.025)];
      }
      else
      {
        v78 = 0;
      }

      uint64_t v73 = 0;
    }
    else
    {
      uint64_t v73 = 0;
      v78 = 0;
    }
  }
  else if ([v9 contextEnum] == (id)12 || objc_msgSend(v9, "contextEnum") == (id)13)
  {
    v78 = 0;
    uint64_t v73 = 1;
  }
  else
  {
    v78 = 0;
    LODWORD(v73) = 0;
    HIDWORD(v73) = [v9 contextEnum] == (id)2;
  }
  objc_opt_class();
  id v76 = v15;
  int v75 = a6;
  unint64_t v74 = a5;
  if (objc_opt_isKindOfClass())
  {
    v72 = v19;
    id v29 = v11;
    v30 = [v29 showTitle];
    v71 = v30;
    if (v30)
    {
      id v31 = v30;

      v83 = v31;
    }
    v32 = [v29 seasonNumber];
    uint64_t v33 = [v29 episodeNumber];
    v70 = (void *)v33;
    if (v32 && v33)
    {
      uint64_t v34 = v33;
      v35 = +[NSBundle mainBundle];
      v36 = [v35 localizedStringForKey:@"EPISODE_SEASON_EPISODE_FORMAT" value:&stru_100124688 table:0];
      uint64_t v69 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v36, v32, v34);

      v37 = +[NSBundle mainBundle];
      v38 = [v37 localizedStringForKey:@"EPISODE_SEASON_EPISODE_FORMAT_SHORT" value:&stru_100124688 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, v32, v34);
    }
    else
    {
      if (!v32)
      {
        uint64_t v50 = [v29 title];
        v43 = 0;
        v46 = v22;
        goto LABEL_48;
      }
      v44 = +[NSBundle mainBundle];
      v45 = [v44 localizedStringForKey:@"EPISODE_SEASON_FORMAT" value:&stru_100124688 table:0];
      uint64_t v69 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v45, v32);

      v37 = +[NSBundle mainBundle];
      v38 = [v37 localizedStringForKey:@"EPISODE_SEASON_FORMAT_SHORT" value:&stru_100124688 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, v32, v68);
    v43 = };

    if (!v43)
    {
      uint64_t v50 = v69;
LABEL_49:

      v39 = 0;
      v22 = (void *)v50;
      goto LABEL_50;
    }
    v46 = +[NSBundle mainBundle];
    v47 = [v46 localizedStringForKey:@"SUBTITLE_WITH_CONTEXT_FORMAT" value:&stru_100124688 table:0];
    v48 = [v9 tvun_contextString];
    uint64_t v49 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v47, v48, v43);

    v82 = (void *)v49;
    uint64_t v50 = v69;
LABEL_48:

    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 isRental])
    {
      v72 = v19;
      v39 = [v77 tvun_expirationDate];
      v40 = [v77 tvun_expirationString];
      id v29 = v40;
      if (v40)
      {
        id v41 = v40;

        id v42 = v81;
        v43 = 0;
        v82 = v42;
        v22 = v41;
      }
      else
      {
        v43 = 0;
      }
      goto LABEL_50;
    }
LABEL_45:
    v39 = 0;
    v43 = 0;
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  v72 = v19;
  id v29 = v11;
  uint64_t v51 = [v29 shortTitle];

  uint64_t v52 = [v29 leagueName];

  v43 = [v29 leagueShortName];
  v39 = 0;
  v22 = (void *)v52;
  v83 = (void *)v51;
LABEL_50:

  int v19 = v72;
LABEL_51:
  if ((v74 & 0xFFFFFFFFFFFFFFFELL) == 2 && v75 == 0) {
    uint64_t v53 = 27;
  }
  else {
    uint64_t v53 = 26;
  }
  v54 = [v11 images];
  v55 = [v54 artworkVariantOfType:v53];

  if ((v74 & 0xFFFFFFFFFFFFFFFELL) != 2 || v75 != 0)
  {
LABEL_59:
    v56 = v22;
    goto LABEL_60;
  }
  v56 = v22;
  if (!v55)
  {
    v57 = sub_1000054E4();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = [v11 title];
      *(_DWORD *)buf = 138412290;
      v85 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "TVUNUpNextWidgetDataSource - Artwork is nil for %@. Fall back to ShelfImage", buf, 0xCu);
    }
    v59 = [v11 images];
    v55 = [v59 artworkVariantOfType:26];

    goto LABEL_59;
  }
LABEL_60:
  v60 = objc_alloc_init(TVUNContentItem);
  [(TVUNContentItem *)v60 setIdentifier:v80];
  [(TVUNContentItem *)v60 setTitle:v83];
  [(TVUNContentItem *)v60 setSubtitle:v56];
  [(TVUNContentItem *)v60 setSubtitleShort:v43];
  [(TVUNContentItem *)v60 setSubtitleComposed:v82];
  [(TVUNContentItem *)v60 setContext:v81];
  [(TVUNContentItem *)v60 setPlaybackPercentage:v78];
  [(TVUNContentItem *)v60 setRentalExpirationDate:v39];
  [(TVUNContentItem *)v60 setLiveEvent:v73];
  [(TVUNContentItem *)v60 setNewEpisode:HIDWORD(v73)];
  [(TVUNContentItem *)v60 setCropCode:v79];
  if (v13)
  {
    v61 = v19;
    buf[0] = 0;
    v62 = [v13 tvun_channelImageURLString:buf];
    if (v62)
    {
      [(TVUNContentItem *)v60 setBadgeURLTemplate:v62];
      [(TVUNContentItem *)v60 setBadgeRequiresTransparency:buf[0]];
    }

    int v19 = v61;
    v56 = v22;
  }
  [(TVUNContentItem *)v60 setActionURL:v19];
  if (v55)
  {
    v63 = [v55 artworkURLString];
    [(TVUNContentItem *)v60 setImageURLTemplate:v63];

    v56 = v22;
    [v55 artworkSize];
    double v65 = v64;
    [v55 artworkSize];
    [(TVUNContentItem *)v60 setImageAspectRatio:v65 / v66];
  }
  id v18 = v60;

  v28 = v18;
  id v15 = v76;
  id v10 = v77;
LABEL_67:

  return v28;
}

+ (id)cropCodeForContentType:(unint64_t)a3
{
  if (a3 == 5) {
    return @"sh";
  }
  else {
    return 0;
  }
}

@end