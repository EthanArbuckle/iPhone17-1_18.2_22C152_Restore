id MusicUsageFileSizeForMediaQuery(void *a1)
{
  void *v1;
  id v2;

  v1 = [a1 valueForAggregateFunction:MPMediaQueryAggregateFunctionTotal onItemsForProperty:MPMediaItemPropertyFileSize];
  v2 = [v1 unsignedLongLongValue];

  return v2;
}

char *MusicUsageFileSizeForMediaItemCollection(void *a1)
{
  id v1 = a1;
  v2 = [v1 itemsQuery];

  if (v2)
  {
    v3 = [v1 itemsQuery];
    v4 = (char *)MusicUsageFileSizeForMediaQuery(v3);
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v3 = objc_msgSend(v1, "items", 0);
    id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      v4 = 0;
      uint64_t v7 = *(void *)v13;
      uint64_t v8 = MPMediaItemPropertyFileSize;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) valueForProperty:v8];
          v4 = &v4[(void)[v10 longLongValue]];
        }
        id v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

CGFloat MusicRectByApplyingUserInterfaceLayoutDirectionInRect(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1 == 1)
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    double MaxX = CGRectGetMaxX(v17);
    v18.origin.x = a2;
    v18.origin.y = a3;
    v18.size.width = a4;
    v18.size.height = a5;
    double v14 = MaxX - CGRectGetMinX(v18);
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    double v15 = v14 - CGRectGetWidth(v19);
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    CGRectGetMinY(v20);
    v21.origin.x = a2;
    v21.origin.y = a3;
    v21.size.width = a4;
    v21.size.height = a5;
    CGRectGetWidth(v21);
    v22.origin.x = a2;
    v22.origin.y = a3;
    v22.size.width = a4;
    v22.size.height = a5;
    CGRectGetHeight(v22);
    return v15;
  }
  return a2;
}

CGFloat MusicRectByRemovingUserInterfaceLayoutDirectionInRect(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1 == 1)
  {
    v16.origin.x = a6;
    v16.origin.y = a7;
    v16.size.width = a8;
    v16.size.height = a9;
    double MaxX = CGRectGetMaxX(v16);
    v17.origin.x = a2;
    v17.origin.y = a3;
    v17.size.width = a4;
    v17.size.height = a5;
    double v14 = MaxX - CGRectGetMaxX(v17);
    v18.origin.x = a2;
    v18.origin.y = a3;
    v18.size.width = a4;
    v18.size.height = a5;
    CGRectGetMinY(v18);
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    CGRectGetWidth(v19);
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    CGRectGetHeight(v20);
    return v14;
  }
  return a2;
}

CGFloat MusicRectByApplyingUserInterfaceLayoutDirectionInView(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  id v10 = [v9 effectiveUserInterfaceLayoutDirection];
  [v9 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  return MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)v10, a2, a3, a4, a5, v12, v14, v16, v18);
}

BOOL MusicFloatEqualToFloat(double a1, double a2)
{
  double v2 = a2 - a1;
  if (v2 < 0.0) {
    double v2 = -v2;
  }
  return v2 < 0.00000011920929;
}

BOOL MusicFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  if (a1 > a2) {
    return 1;
  }
  double v3 = a2 - a1;
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  return v3 < 0.00000011920929;
}

double MusicSafeDisplayScale(double result)
{
  double v1 = 0.0 - result;
  if (0.0 - result < 0.0) {
    double v1 = -(0.0 - result);
  }
  if (v1 < 0.00000011920929 || result < 0.0) {
    return 1.0;
  }
  return result;
}

void sub_2980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

double sub_29F8(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  uint64_t v7 = *(double **)(*(void *)(a1 + 40) + 8);
  CGFloat v8 = v7[4];
  CGFloat v9 = v7[5];
  CGFloat v10 = v7[6];
  CGFloat v11 = v7[7];
  id v12 = a2;
  v21.origin.x = v8;
  v21.origin.y = v9;
  v21.size.width = v10;
  v21.size.height = v11;
  CGRectGetMinX(v21);
  uint64_t v20 = *(void *)(a1 + 48);
  UIRectCenteredYInRectScale();
  objc_msgSend(v12, "setFrame:", MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)objc_msgSend(*(id *)(a1 + 32), "effectiveUserInterfaceLayoutDirection", v20), v13, v14, v15, v16, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80)));

  double v17 = a5 + 0.0 + 8.0;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v17
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 32);
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v18 + 48) - v17;
  *(double *)(v18 + 48) = result;
  return result;
}

void sub_3170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_318C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && v6[21] == *(void *)(a1 + 32))
  {
    objc_msgSend(v6, "_handleArtworkImageUpdate:idealArtworkSize:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_4C4C(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) usageGroup];
  [v10 updateGroupSize];
  double v2 = *(void **)(a1 + 40);
  double v3 = [v10 groupSpecifierIdentifier];
  v4 = [v2 specifierForID:v3];

  id v5 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v10 groupSize], 2);
  id v6 = [v4 propertyForKey:PSHeaderViewKey];
  [v6 setSize:v5];

  uint64_t v7 = [*(id *)(a1 + 32) childUsageGroup];
  id v8 = [v7 numberOfUsageItems];

  if (v8)
  {
    [*(id *)(a1 + 40) reloadSpecifier:*(void *)(a1 + 48)];
  }
  else
  {
    [v10 removeUsageItem:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) removeSpecifier:*(void *)(a1 + 48) animated:1];
    if (![v10 numberOfUsageItems]) {
      [*(id *)(a1 + 40) removeSpecifier:v4];
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 192);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

MPArtworkCatalog *__cdecl sub_57BC(id a1, MPMediaItemCollection *a2)
{
  double v2 = [(MPMediaItemCollection *)a2 artworkCatalog];
  if (!v2)
  {
    double v3 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    v4 = +[UIImage imageNamed:@"MissingArtworkMusicNote96" inBundle:v3];
    double v2 = +[MPArtworkCatalog staticArtworkCatalogWithImage:v4];
  }

  return (MPArtworkCatalog *)v2;
}

NSString *__cdecl sub_5864(id a1, MPMediaItemCollection *a2)
{
  double v2 = [(MPMediaItemCollection *)a2 items];
  if ([v2 count])
  {
    double v3 = [v2 objectAtIndex:0];
    v4 = [v3 valueForProperty:MPMediaItemPropertyTitle];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

void sub_6934(id a1, UIImageView *a2, UIImage *a3)
{
  if (a3) {
    -[UIImageView setImage:](a2, "setImage:");
  }
}

void sub_6B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6BC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_7240(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) usageGroup];
  [v9 updateGroupSize];
  double v2 = *(void **)(a1 + 40);
  double v3 = [v9 groupSpecifierIdentifier];
  v4 = [v2 specifierForID:v3];

  id v5 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v9 groupSize], 2);
  id v6 = [v4 propertyForKey:PSHeaderViewKey];
  [v6 setSize:v5];

  uint64_t v7 = [*(id *)(a1 + 32) childUsageGroup];
  id v8 = [v7 numberOfUsageItems];

  if (v8)
  {
    [*(id *)(a1 + 40) reloadSpecifier:*(void *)(a1 + 48)];
  }
  else
  {
    [v9 removeUsageItem:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) removeSpecifier:*(void *)(a1 + 48) animated:1];
    if (![v9 numberOfUsageItems])
    {
      [*(id *)(*(void *)(a1 + 40) + 192) removeObject:v9];
      [*(id *)(a1 + 40) removeSpecifier:v4];
    }
  }
  [*(id *)(a1 + 40) updateLocalSongsGroupSize];
}

NSString *__cdecl sub_879C(id a1, MPMediaItemCollection *a2)
{
  double v2 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  double v3 = [v2 localizedStringForKey:@"ALL_MUSIC_CELL_NAME" value:&stru_108A0 table:@"MusicUsage"];

  return (NSString *)v3;
}

NSString *__cdecl sub_8810(id a1, MPMediaItemCollection *a2)
{
  double v2 = [(MPMediaItemCollection *)a2 representativeItem];
  double v3 = [v2 valueForProperty:MPMediaItemPropertyAlbumArtist];

  return (NSString *)v3;
}

NSArray *__cdecl sub_886C(id a1, MPMediaItemCollection *a2)
{
  id v2 = [(MPMediaItemCollection *)a2 persistentID];
  double v3 = +[MPMediaQuery albumsQuery];
  [v3 setIgnoreSystemFilterPredicates:1];
  [v3 setIgnoreRestrictionsPredicates:1];
  [v3 setShouldIncludeNonLibraryEntities:1];
  v4 = +[NSNumber numberWithUnsignedLongLong:v2];
  id v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:MPMediaItemPropertyAlbumArtistPersistentID];
  [v3 addFilterPredicate:v5];

  id v6 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  [v3 addFilterPredicate:v6];

  uint64_t v7 = [v3 collections];
  id v8 = sub_8990(v7);

  return (NSArray *)v8;
}

id sub_8990(void *a1)
{
  id v1 = a1;
  if (![v1 count])
  {
    CGFloat v11 = 0;
    goto LABEL_15;
  }
  id v2 = (char *)[v1 count];
  double v3 = [v1 firstObject];
  v4 = [v3 representativeItem];
  id v5 = [v4 valueForProperty:MPMediaItemPropertyAlbumTitle];
  if (![v5 length])
  {
    id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    uint64_t v7 = [v6 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_UNKNOWN" value:&stru_108A0 table:@"MusicUsage"];

    id v5 = (void *)v7;
  }
  if (v2 == (unsigned char *)&dword_0 + 2)
  {
    v32 = [v1 objectAtIndexedSubscript:1];
    id v12 = [v32 representativeItem];
    id v10 = [v12 valueForProperty:MPMediaItemPropertyAlbumTitle];
    v28 = v4;
    v29 = v3;
    v30 = v12;
    if (![v10 length])
    {
      CGFloat v13 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
      uint64_t v14 = [v13 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_UNKNOWN" value:&stru_108A0 table:@"MusicUsage"];

      id v10 = (void *)v14;
    }
    v27 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    v26 = [v27 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_AND_ALBUM" value:&stru_108A0 table:@"MusicUsage"];
    v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v5, v10);
    v35[0] = v25;
    CGFloat v15 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    CGFloat v16 = [v15 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_AND_N_MORE" value:&stru_108A0 table:@"MusicUsage"];
    double v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v5, 1);
    v35[1] = v17;
    uint64_t v18 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    CGRect v19 = [v18 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_COUNT" value:&stru_108A0 table:@"MusicUsage"];
    uint64_t v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, 2);
    v35[2] = v20;
    CGFloat v11 = +[NSArray arrayWithObjects:v35 count:3];

    v4 = v28;
    double v3 = v29;
    id v9 = v30;
    id v8 = v32;
  }
  else if (v2 == (unsigned char *)&dword_0 + 1)
  {
    v36[0] = v5;
    id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    id v9 = [v8 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_COUNT" value:&stru_108A0 table:@"MusicUsage"];
    id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, 1);
    v36[1] = v10;
    CGFloat v11 = +[NSArray arrayWithObjects:v36 count:2];
  }
  else
  {
    if ((unint64_t)v2 < 3)
    {
      CGFloat v11 = 0;
      goto LABEL_14;
    }
    v33 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    uint64_t v31 = [v33 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_AND_N_MORE" value:&stru_108A0 table:@"MusicUsage"];
    id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v5, v2 - 1);
    v34[0] = v10;
    CGRect v21 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    CGRect v22 = [v21 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_COUNT" value:&stru_108A0 table:@"MusicUsage"];
    v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v2);
    v34[1] = v23;
    CGFloat v11 = +[NSArray arrayWithObjects:v34 count:2];

    id v9 = (void *)v31;
    id v8 = v33;
  }

LABEL_14:
LABEL_15:

  return v11;
}

id sub_8E90(uint64_t a1, void *a2)
{
  double v3 = [a2 albumArtistArtworkCatalog];
  if (!v3)
  {
    double v3 = [*(id *)(a1 + 32) _placeholderAlbumArtistArtworkCatalog];
  }

  return v3;
}

NSString *__cdecl sub_8EDC(id a1, MPMediaItemCollection *a2)
{
  id v2 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  double v3 = [v2 localizedStringForKey:@"UNKNOWN_ARTIST_TITLE" value:&stru_108A0 table:@"MusicUsage"];

  return (NSString *)v3;
}

NSArray *__cdecl sub_8F50(id a1, MPMediaItemCollection *a2)
{
  id v2 = [(MPMediaItemCollection *)a2 persistentID];
  double v3 = +[MPMediaQuery albumsQuery];
  [v3 setIgnoreSystemFilterPredicates:1];
  [v3 setIgnoreRestrictionsPredicates:1];
  [v3 setShouldIncludeNonLibraryEntities:1];
  v4 = +[NSNumber numberWithUnsignedLongLong:v2];
  id v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:MPMediaItemPropertyAlbumArtistPersistentID];
  [v3 addFilterPredicate:v5];

  id v6 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  [v3 addFilterPredicate:v6];

  uint64_t v7 = [v3 collections];
  id v8 = sub_8990(v7);

  return (NSArray *)v8;
}

id sub_9074(uint64_t a1)
{
  return [*(id *)(a1 + 32) _placeholderAlbumArtistArtworkCatalog];
}

id sub_907C(uint64_t a1, void *a2)
{
  double v3 = [a2 representativeItem];
  v4 = [v3 valueForProperty:*(void *)(a1 + 32)];

  return v4;
}

MPArtworkCatalog *__cdecl sub_90D4(id a1, MPMediaItemCollection *a2)
{
  return (MPArtworkCatalog *)[(MPMediaItemCollection *)a2 artworkCatalog];
}

NSString *__cdecl sub_9990(id a1, MPMediaItemCollection *a2)
{
  id v2 = [(MPMediaItemCollection *)a2 representativeItem];
  double v3 = [v2 valueForProperty:MPMediaItemPropertyAlbumTitle];

  if (![v3 length])
  {
    v4 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    uint64_t v5 = [v4 localizedStringForKey:@"ARTIST_DETAIL_CELL_SUBTITLE_ALBUM_UNKNOWN" value:&stru_108A0 table:@"MusicUsage"];

    double v3 = (void *)v5;
  }

  return (NSString *)v3;
}

NSArray *__cdecl sub_9A4C(id a1, MPMediaItemCollection *a2)
{
  id v2 = a2;
  double v3 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  v4 = [v3 localizedStringForKey:@"ALBUM_DETAIL_CELL_SUBTITLE_SONG_COUNT" value:&stru_108A0 table:@"MusicUsage"];
  uint64_t v5 = [(MPMediaItemCollection *)v2 items];

  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v5 count]);
  id v9 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v7;
}

MPArtworkCatalog *__cdecl sub_9B78(id a1, MPMediaItemCollection *a2)
{
  return (MPArtworkCatalog *)[(MPMediaItemCollection *)a2 artworkCatalog];
}

int64_t sub_9B80(id a1, MusicUsageItem *a2, MusicUsageItem *a3)
{
  v4 = a3;
  uint64_t v5 = [(MusicUsageItem *)a2 itemCollection];
  id v6 = MusicUsageFileSizeForMediaItemCollection(v5);

  uint64_t v7 = [(MusicUsageItem *)v4 itemCollection];

  id v8 = MusicUsageFileSizeForMediaItemCollection(v7);
  if (v6 > v8) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_9D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9D24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9D34(uint64_t a1)
{
}

void sub_9D3C(uint64_t a1)
{
  v20.width = 48.0;
  v20.height = 48.0;
  UIGraphicsBeginImageContextWithOptions(v20, 1, 0.0);
  id v18 = +[UIColor colorWithRed:0.65 green:0.67 blue:0.72 alpha:1.0];
  id v2 = +[UIColor colorWithRed:0.52 green:0.54 blue:0.58 alpha:1.0];
  double v3 = +[UIImage _backgroundGradientWithStartColor:v18 andEndColor:v2];
  objc_msgSend(v3, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, 48.0, 48.0, 1.0);
  v4 = +[UIImageSymbolConfiguration configurationWithPointSize:24.0];
  uint64_t v5 = +[UIImage systemImageNamed:@"music.mic" withConfiguration:v4];

  id v6 = +[UIColor whiteColor];
  uint64_t v7 = [v5 _flatImageWithColor:v6];

  UIRectGetCenter();
  double v9 = v8;
  [v7 size];
  double v11 = v9 - v10 * 0.5;
  UIRectGetCenter();
  double v13 = v12;
  [v7 size];
  objc_msgSend(v7, "drawAtPoint:blendMode:alpha:", 0, v11, v13 - v14 * 0.5, 1.0);
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  double v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  UIGraphicsEndImageContext();
}

uint64_t sub_A4F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 sizeForCategory:a2];
  float v8 = v7;
  [*(id *)(a1 + 32) sizeForCategory:v6];
  float v10 = v9;

  if (v8 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MPUFloatCeilForScale()
{
  return _MPUFloatCeilForScale();
}

uint64_t PSPointImageOfColor()
{
  return _PSPointImageOfColor();
}

uint64_t PSTableViewSideInset()
{
  return _PSTableViewSideInset();
}

uint64_t PreferencesTableViewHeaderColor()
{
  return _PreferencesTableViewHeaderColor();
}

uint64_t PreferencesTableViewHeaderFont()
{
  return _PreferencesTableViewHeaderFont();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredYInRectScale()
{
  return _UIRectCenteredYInRectScale();
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return [a1 _baselineOffsetFromBottom];
}

id objc_msgSend__bodyLeading(void *a1, const char *a2, ...)
{
  return [a1 _bodyLeading];
}

id objc_msgSend__countOfItems(void *a1, const char *a2, ...)
{
  return [a1 _countOfItems];
}

id objc_msgSend__fileSizeText(void *a1, const char *a2, ...)
{
  return [a1 _fileSizeText];
}

id objc_msgSend__labelColor(void *a1, const char *a2, ...)
{
  return [a1 _labelColor];
}

id objc_msgSend__placeholderAlbumArtistArtworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 _placeholderAlbumArtistArtworkCatalog];
}

id objc_msgSend__specifiersFromUsageItem(void *a1, const char *a2, ...)
{
  return [a1 _specifiersFromUsageItem];
}

id objc_msgSend__updateContents(void *a1, const char *a2, ...)
{
  return [a1 _updateContents];
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return [a1 accessoryType];
}

id objc_msgSend_albumArtistArtworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 albumArtistArtworkCatalog];
}

id objc_msgSend_albumArtistsQuery(void *a1, const char *a2, ...)
{
  return [a1 albumArtistsQuery];
}

id objc_msgSend_albumsQuery(void *a1, const char *a2, ...)
{
  return [a1 albumsQuery];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalog];
}

id objc_msgSend_artworkCatalogBlock(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalogBlock];
}

id objc_msgSend_artworkWantsCircleTreatment(void *a1, const char *a2, ...)
{
  return [a1 artworkWantsCircleTreatment];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_childUsageGroup(void *a1, const char *a2, ...)
{
  return [a1 childUsageGroup];
}

id objc_msgSend_clearArtworkCatalogs(void *a1, const char *a2, ...)
{
  return [a1 clearArtworkCatalogs];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return [a1 collections];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMediaLibrary];
}

id objc_msgSend_deviceMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 deviceMediaLibrary];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return [a1 firstItem];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return [a1 groupName];
}

id objc_msgSend_groupSize(void *a1, const char *a2, ...)
{
  return [a1 groupSize];
}

id objc_msgSend_groupSpecifierIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupSpecifierIdentifier];
}

id objc_msgSend_groupingType(void *a1, const char *a2, ...)
{
  return [a1 groupingType];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isIncludedInLocalGroup(void *a1, const char *a2, ...)
{
  return [a1 isIncludedInLocalGroup];
}

id objc_msgSend_itemCollection(void *a1, const char *a2, ...)
{
  return [a1 itemCollection];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_itemsQuery(void *a1, const char *a2, ...)
{
  return [a1 itemsQuery];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryDataProvider(void *a1, const char *a2, ...)
{
  return [a1 libraryDataProvider];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_moviesQuery(void *a1, const char *a2, ...)
{
  return [a1 moviesQuery];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_numberOfUsageItems(void *a1, const char *a2, ...)
{
  return [a1 numberOfUsageItems];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_playlistsQuery(void *a1, const char *a2, ...)
{
  return [a1 playlistsQuery];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return [a1 representativeItem];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return [a1 secondItem];
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return [a1 separatorInset];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_showsItemArtwork(void *a1, const char *a2, ...)
{
  return [a1 showsItemArtwork];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_songsQuery(void *a1, const char *a2, ...)
{
  return [a1 songsQuery];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierIdentifier(void *a1, const char *a2, ...)
{
  return [a1 specifierIdentifier];
}

id objc_msgSend_specifiersFromUsageGroups(void *a1, const char *a2, ...)
{
  return [a1 specifiersFromUsageGroups];
}

id objc_msgSend_subtitles(void *a1, const char *a2, ...)
{
  return [a1 subtitles];
}

id objc_msgSend_subtitlesBlock(void *a1, const char *a2, ...)
{
  return [a1 subtitlesBlock];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableCellGrayTextColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellGrayTextColor];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return [a1 tableHeaderView];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleBlock(void *a1, const char *a2, ...)
{
  return [a1 titleBlock];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return [a1 totalSize];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_tvShowsQuery(void *a1, const char *a2, ...)
{
  return [a1 tvShowsQuery];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateGroupSize(void *a1, const char *a2, ...)
{
  return [a1 updateGroupSize];
}

id objc_msgSend_updateLocalSongsGroupSize(void *a1, const char *a2, ...)
{
  return [a1 updateLocalSongsGroupSize];
}

id objc_msgSend_usageBundleStorageReporter(void *a1, const char *a2, ...)
{
  return [a1 usageBundleStorageReporter];
}

id objc_msgSend_usageGroup(void *a1, const char *a2, ...)
{
  return [a1 usageGroup];
}

id objc_msgSend_usageItems(void *a1, const char *a2, ...)
{
  return [a1 usageItems];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}