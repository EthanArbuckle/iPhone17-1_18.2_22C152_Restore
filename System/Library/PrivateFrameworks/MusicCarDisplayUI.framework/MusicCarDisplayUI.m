void sub_23F143FD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F144ED0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_23F145888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MCDIndexPathIsRootForContainer(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 indexPath];
  if ([v2 length])
  {
    v3 = [v1 model];
    v4 = [v3 bundleID];
    if (MRMediaRemoteApplicationSupportsSectionedBrowsing())
    {
      v5 = [v1 indexPath];
      BOOL v6 = [v5 length] == 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void sub_23F146578(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_23F146F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MCDAlbumPlaceholderImageWithStyle()
{
  return [MEMORY[0x263F827E8] _systemImageNamed:@"music.square.stack"];
}

id MCDCarDisplayBundle()
{
  if (MCDCarDisplayBundle_onceToken != -1) {
    dispatch_once(&MCDCarDisplayBundle_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)MCDCarDisplayBundle_carDisplayBundle;
  return v0;
}

uint64_t __MCDCarDisplayBundle_block_invoke()
{
  MCDCarDisplayBundle_carDisplayBundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileMusicPlayer.MusicCarDisplayUI"];
  return MEMORY[0x270F9A758]();
}

id MCDMusicBundle()
{
  if (MCDMusicBundle_onceToken != -1) {
    dispatch_once(&MCDMusicBundle_onceToken, &__block_literal_global_143);
  }
  v0 = (void *)MCDMusicBundle_musicBundle;
  return v0;
}

uint64_t __MCDMusicBundle_block_invoke()
{
  MCDMusicBundle_musicBundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MusicApplication"];
  return MEMORY[0x270F9A758]();
}

uint64_t MCDCarDisplayScreen()
{
  return [MEMORY[0x263F82B60] _carScreen];
}

uint64_t MCDCarDisplayUIMode()
{
  v0 = [MEMORY[0x263F82B60] _carScreen];
  uint64_t v1 = [v0 _capabilityForKey:*MEMORY[0x263F83DC8]];
  unsigned __int8 v2 = [v1 integerValue];

  v3 = [v0 _capabilityForKey:*MEMORY[0x263F83DD0]];
  uint64_t v4 = [v3 integerValue];

  if ([v0 supportsFocus]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v2 & (v4 != 0);
  }

  return v5;
}

id MCDFormattedNumberString(void *a1)
{
  uint64_t v1 = MCDFormattedNumberString_sOnceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MCDFormattedNumberString_sOnceToken, &__block_literal_global_150);
  }
  v3 = [(id)MCDFormattedNumberString_sNumberFormatter stringFromNumber:v2];

  return v3;
}

uint64_t __MCDFormattedNumberString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)MCDFormattedNumberString_sNumberFormatter;
  MCDFormattedNumberString_sNumberFormatter = (uint64_t)v0;

  [(id)MCDFormattedNumberString_sNumberFormatter setNumberStyle:1];
  [(id)MCDFormattedNumberString_sNumberFormatter setUsesSignificantDigits:0];
  [(id)MCDFormattedNumberString_sNumberFormatter setMaximumFractionDigits:2];
  id v2 = (void *)MCDFormattedNumberString_sNumberFormatter;
  return [v2 setUsesGroupingSeparator:1];
}

id MCDLocalizedExplicitImage()
{
  id v0 = [MEMORY[0x263F890A0] defaultManager];
  uint64_t v1 = [v0 ageVerificationState];
  uint64_t v2 = [v1 treatment];

  if (v2 == 1) {
    v3 = @"19.circle.fill";
  }
  else {
    v3 = @"e.square.fill";
  }
  uint64_t v4 = [MEMORY[0x263F827E8] _systemImageNamed:v3];
  return v4;
}

__CFString *MCDLocalizedExplicitString()
{
  id v0 = [MEMORY[0x263F890A0] defaultManager];
  uint64_t v1 = [v0 ageVerificationState];
  uint64_t v2 = [v1 treatment];

  if (v2 == 1) {
    return @"⓳";
  }
  else {
    return @"🅴";
  }
}

id MCDFavoriteIcon()
{
  id v0 = objc_alloc_init(MEMORY[0x263F82828]);
  uint64_t v1 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83590] scale:1];
  uint64_t v2 = [MEMORY[0x263F827E8] systemImageNamed:@"star.fill" withConfiguration:v1];
  [v0 setImage:v2];
  v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v0 setTintColor:v3];

  [v0 sizeToFit];
  return v0;
}

id MCDFormattedPlaybackRateString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToNumber:&unk_26F2E2E50])
  {
    uint64_t v2 = MCDCarDisplayBundle();
    v3 = v2;
    uint64_t v4 = @"PLAYBACK_RATE_SPEED_HALF";
LABEL_9:
    uint64_t v5 = [v2 localizedStringForKey:v4 value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    goto LABEL_10;
  }
  if ([v1 isEqualToNumber:&unk_26F2E2E60])
  {
    uint64_t v2 = MCDCarDisplayBundle();
    v3 = v2;
    uint64_t v4 = @"PLAYBACK_RATE_SPEED_THREE_QUARTERS";
    goto LABEL_9;
  }
  if ([v1 isEqualToNumber:&unk_26F2E2E70])
  {
    uint64_t v2 = MCDCarDisplayBundle();
    v3 = v2;
    uint64_t v4 = @"PLAYBACK_RATE_SPEED_ONE_AND_QUARTER";
    goto LABEL_9;
  }
  if ([v1 isEqualToNumber:&unk_26F2E2E80])
  {
    uint64_t v2 = MCDCarDisplayBundle();
    v3 = v2;
    uint64_t v4 = @"PLAYBACK_RATE_SPEED_ONE_AND_HALF";
    goto LABEL_9;
  }
  v7 = NSString;
  v3 = MCDCarDisplayBundle();
  v8 = [v3 localizedStringForKey:@"PLAYBACK_RATE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  v9 = MCDFormattedNumberString(v1);
  uint64_t v5 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

LABEL_10:
  return v5;
}

id MCDAlbumDetailFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = NSString;
  uint64_t v5 = MCDCarDisplayBundle();
  BOOL v6 = [v5 localizedStringForKey:@"%d Song(s)" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a1);

  if (a2 < 1)
  {
    id v15 = v7;
  }
  else
  {
    v8 = NSString;
    v9 = MCDCarDisplayBundle();
    v10 = [v9 localizedStringForKey:@"%d Minute(s)" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, a2);

    v12 = NSString;
    v13 = MCDCarDisplayBundle();
    v14 = [v13 localizedStringForKey:@"ALBUM_DETAIL_FORMAT_FULL" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v7, v11);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

uint64_t MCDTiledArtworkForPlaylist(void *a1, const char *a2)
{
  return [a1 tracksTiledArtworkCatalogWithRows:2 columns:2];
}

id MCDMPModelObjectForGenericObject(void *a1)
{
  id v1 = a1;
  switch([v1 type])
  {
    case 1:
      id v2 = [v1 song];
      break;
    case 2:
      id v2 = [v1 album];
      break;
    case 3:
      id v2 = [v1 artist];
      break;
    case 4:
      id v2 = [v1 playlist];
      break;
    default:
      id v2 = v1;
      break;
  }
  v3 = v2;

  return v3;
}

void MCDSetChargeOnDescendantsOfView(void *a1, uint64_t a2, double a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = objc_msgSend(v5, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        MCDSetChargeOnDescendantsOfView(*(void *)(*((void *)&v13 + 1) + 8 * v11), a2, a3);
        if (objc_opt_isKindOfClass())
        {
          float v10 = a3;
          *(float *)&double v12 = v10;
          [v5 setCharge:v12];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void MCDClearTableViewSelection(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(v3, "indexPathsForSelectedRows", 0);
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 deselectRowAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:a2];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

__CFString *_MCDStringFromIndexPath(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = [v1 length];
    v10[0] = v10;
    MEMORY[0x270FA5388](v2, v3);
    id v5 = (char *)v10 - v4;
    [v1 getIndexes:(char *)v10 - v4];
    uint64_t v6 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
    if (v2 >= 1)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        uint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)&v5[8 * i]];
        [(__CFString *)v6 appendFormat:@"%@", v8];

        if (v2 - 1 > i) {
          [(__CFString *)v6 appendString:@"."];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = @"ROOT";
  }

  return v6;
}

id MCDGetNowPlayingButton(void *a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x263F31390];
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = (void *)[[v5 alloc] initWithBundleIdentifier:v7];

  [v8 addTarget:v6 action:a3 forControlEvents:64];
  return v8;
}

id MCDBarButtonItemForNegativeSpacer(double a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v2 setWidth:-a1];
  return v2;
}

void MCDSetupTableHeaderView(void *a1)
{
  id v1 = (void *)MEMORY[0x263F825C8];
  id v2 = a1;
  uint64_t v3 = [v1 tableBackgroundColor];
  uint64_t v4 = [v2 contentView];
  [v4 setBackgroundColor:v3];

  id v5 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
  id v6 = [v2 textLabel];
  [v6 setTextColor:v5];

  id v7 = [MEMORY[0x263F81708] boldSystemFontOfSize:12.0];
  uint64_t v8 = [v2 textLabel];
  [v8 setFont:v7];

  id v9 = [v2 textLabel];

  [v9 setTextAlignment:1];
}

id MCDFormatArtistAlbumString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    id v5 = NSString;
    id v6 = MCDCarDisplayBundle();
    id v7 = [v6 localizedStringForKey:@"%@ — %@" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    uint64_t v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v3, v4);

    goto LABEL_9;
  }
  if ([v4 length])
  {
    id v9 = v4;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  if ([v3 length])
  {
    id v9 = v3;
    goto LABEL_8;
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MCDTimeDurationForSeconds(float a1)
{
  if (MCDTimeDurationForSeconds_sOnceToken != -1) {
    dispatch_once(&MCDTimeDurationForSeconds_sOnceToken, &__block_literal_global_226);
  }
  id v2 = (void *)MCDTimeDurationForSeconds_sTimeFormatter;
  return [v2 stringFromSeconds:a1];
}

uint64_t __MCDTimeDurationForSeconds_block_invoke()
{
  MCDTimeDurationForSeconds_sTimeFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263EFA8B8]);
  return MEMORY[0x270F9A758]();
}

id MCDFilteredStringForString(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 newlineCharacterSet];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 componentsJoinedByString:&stru_26F2DBB20];

  return v5;
}

BOOL MCDNetworkConnectionAvailable(uint64_t a1)
{
  return a1 != 0;
}

uint64_t MCDNetworkRestrictedCellularData()
{
  if (!ICEnvironmentNetworkTypeIsCellular()) {
    return 0;
  }
  id v0 = [MEMORY[0x263F120E8] sharedNetworkObserver];
  uint64_t v1 = [v0 isMusicCellularStreamingAllowed] ^ 1;

  return v1;
}

void MCDSetAllowsCellularData(uint64_t a1)
{
  id v2 = [MEMORY[0x263F120E8] sharedNetworkObserver];
  [v2 setMusicCellularStreamingAllowed:a1];
}

void MCDPerformColorUpdateWithCurrentTraitCollection(void *a1, void *a2)
{
  if (a1 && a2)
  {
    id v3 = (void *)MEMORY[0x263F82DA0];
    id v4 = a2;
    id v5 = a1;
    id v6 = [v3 _currentTraitCollection];
    [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v5];

    v4[2](v4);
    [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v6];
  }
}

void sub_23F14A30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 224), 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_23F14ADC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_23F14BE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_23F14D3A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F14DB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F14E8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *_MCDCreateMediaRemoteIndexPath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  id v3 = malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
  id v4 = v3;
  v3[1] = v2;
  if (v2)
  {
    uint64_t v5 = 0;
    void *v3 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
    do
    {
      *(void *)(*v4 + 8 * v5) = [v1 indexAtPosition:v5];
      ++v5;
    }
    while (v2 != v5);
  }
  else
  {
    void *v3 = 0;
  }

  return v4;
}

void sub_23F14FF04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F1500E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F1509C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F1512DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_23F151824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_23F1532BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F1534E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MCDNSIndexPathFromMRMediaRemoteIndexPath(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)MEMORY[0x270FA5388](a1, a2);
  if (v3)
  {
    uint64_t v5 = (void *)((char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v6 = v3;
    do
    {
      uint64_t v7 = *v2++;
      *v5++ = v7;
      --v6;
    }
    while (v6);
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathWithIndexes:length:");
  return v8;
}

void sub_23F153A3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id MCDGeneralLogging()
{
  if (MCDGeneralLogging_onceToken != -1) {
    dispatch_once(&MCDGeneralLogging_onceToken, &__block_literal_global_2);
  }
  id v0 = (void *)MCDGeneralLogging_facility;
  return v0;
}

uint64_t __MCDGeneralLogging_block_invoke()
{
  MCDGeneralLogging_facility = (uint64_t)os_log_create("com.apple.MusicCarDisplay", "General");
  return MEMORY[0x270F9A758]();
}

id MCDMusicGeneralLogging()
{
  if (MCDMusicGeneralLogging_onceToken != -1) {
    dispatch_once(&MCDMusicGeneralLogging_onceToken, &__block_literal_global_3);
  }
  id v0 = (void *)MCDMusicGeneralLogging_facility;
  return v0;
}

uint64_t __MCDMusicGeneralLogging_block_invoke()
{
  MCDMusicGeneralLogging_facility = (uint64_t)os_log_create("com.apple.MusicCarPlay", "General");
  return MEMORY[0x270F9A758]();
}

void sub_23F154E44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_23F156B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F156E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _MCDNoContentFontWithTextStyle(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F81708];
  uint64_t v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a1 addingSymbolicTraits:2 options:0];
  uint64_t v3 = [v1 fontWithDescriptor:v2 size:0.0];

  return v3;
}

void sub_23F159E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F15A7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F15B098(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id NowPlayingBackdropView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

char *NowPlayingBackdropView.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C373C8);
  MEMORY[0x270FA5388](v9 - 8, v10);
  long long v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C373D0);
  MEMORY[0x270FA5388](v13 - 8, v14);
  long long v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_23F15D288();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20, v23);
  v25 = (char *)&v44 - v24;
  *(void *)&v4[OBJC_IVAR___MCDNowPlayingBackdropView_metalView] = 0;
  *(void *)&v4[OBJC_IVAR___MCDNowPlayingBackdropView_renderer] = 0;
  *(void *)&v4[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView] = 0;
  v26 = (objc_class *)type metadata accessor for NowPlayingBackdropView();
  v44.receiver = v4;
  v44.super_class = v26;
  v27 = (char *)objc_msgSendSuper2(&v44, sel_initWithFrame_, a1, a2, a3, a4);
  sub_23F15D278();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {

    sub_23F15CB08((uint64_t)v16);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v16, v17);
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F12D90]), sel_initWithFrame_device_, sub_23F15D268(), 0.0, 0.0, a3, a4);
    swift_unknownObjectRelease();
    objc_msgSend(v28, sel_setAutoresizingMask_, 18);
    id v29 = objc_msgSend(v28, sel_layer);
    objc_msgSend(v29, sel_setAllowsDisplayCompositing_, 0);

    objc_msgSend(v28, sel_setEnableSetNeedsDisplay_, 0);
    objc_msgSend(v28, sel_setPreferredFramesPerSecond_, 30);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v22, v25, v17);
    uint64_t v30 = sub_23F15D2E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v12, 1, 1, v30);
    id v31 = objc_allocWithZone((Class)sub_23F15D2D8());
    v32 = (void *)sub_23F15D2B8();
    v33 = self;
    id v34 = objc_msgSend(v33, sel_systemGrayColor);
    sub_23F15D298();

    objc_msgSend(v28, sel_colorPixelFormat);
    sub_23F15D2A8();
    objc_msgSend(v28, sel_setDelegate_, v32);
    v35 = *(void **)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_metalView];
    *(void *)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_metalView] = v28;
    id v36 = v28;

    v37 = *(void **)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_renderer];
    *(void *)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_renderer] = v32;
    id v38 = v32;

    objc_msgSend(v27, sel_addSubview_, v36);
    id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a3, a4);
    id v40 = objc_msgSend(v33, sel_blackColor);
    objc_msgSend(v39, sel_setBackgroundColor_, v40);

    objc_msgSend(v39, sel_setAutoresizingMask_, 18);
    objc_msgSend(v39, sel_setAlpha_, 0.15);
    v41 = *(void **)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView];
    *(void *)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView] = v39;
    id v42 = v39;

    objc_msgSend(v27, sel_addSubview_, v42);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v17);
  }
  return v27;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for NowPlayingBackdropView()
{
  return self;
}

uint64_t sub_23F15CB08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C373D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t variable initialization expression of NowPlayingBackdropView.metalView()
{
  return 0;
}

uint64_t variable initialization expression of NowPlayingBackdropView.renderer()
{
  return 0;
}

uint64_t variable initialization expression of NowPlayingBackdropView.overlayView()
{
  return 0;
}

id NowPlayingBackdropView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void NowPlayingBackdropView.init(coder:)()
{
  *(void *)&v0[OBJC_IVAR___MCDNowPlayingBackdropView_metalView] = 0;
  *(void *)&v0[OBJC_IVAR___MCDNowPlayingBackdropView_renderer] = 0;
  *(void *)&v0[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView] = 0;

  sub_23F15D2F8();
  __break(1u);
}

Swift::Void __swiftcall NowPlayingBackdropView.update(image:animated:)(UIImage_optional image, Swift::Bool animated)
{
  id v3 = *(void **)(v2 + OBJC_IVAR___MCDNowPlayingBackdropView_renderer);
  if (v3)
  {
    id v4 = v3;
    sub_23F15D2C8();
  }
}

id NowPlayingBackdropView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NowPlayingBackdropView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23F15D268()
{
  return MEMORY[0x270F49860]();
}

uint64_t sub_23F15D278()
{
  return MEMORY[0x270F49868]();
}

uint64_t sub_23F15D288()
{
  return MEMORY[0x270F49870]();
}

uint64_t sub_23F15D298()
{
  return MEMORY[0x270F49A28]();
}

uint64_t sub_23F15D2A8()
{
  return MEMORY[0x270F49A30]();
}

uint64_t sub_23F15D2B8()
{
  return MEMORY[0x270F49A38]();
}

uint64_t sub_23F15D2C8()
{
  return MEMORY[0x270F49A40]();
}

uint64_t sub_23F15D2D8()
{
  return MEMORY[0x270F49A48]();
}

uint64_t sub_23F15D2E8()
{
  return MEMORY[0x270F49A50]();
}

uint64_t sub_23F15D2F8()
{
  return MEMORY[0x270F9EFF0]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x270F88A78]();
}

uint64_t MRContentItemGetArtworkData()
{
  return MEMORY[0x270F49D80]();
}

uint64_t MRContentItemGetIdentifier()
{
  return MEMORY[0x270F49D90]();
}

uint64_t MRContentItemGetIsContainer()
{
  return MEMORY[0x270F49D98]();
}

uint64_t MRContentItemGetIsExplicitItem()
{
  return MEMORY[0x270F49DA0]();
}

uint64_t MRContentItemGetIsPlayable()
{
  return MEMORY[0x270F49DA8]();
}

uint64_t MRContentItemGetIsStreamingContent()
{
  return MEMORY[0x270F49DB0]();
}

uint64_t MRContentItemGetPlaybackProgress()
{
  return MEMORY[0x270F49DB8]();
}

uint64_t MRContentItemGetSubtitle()
{
  return MEMORY[0x270F49DC0]();
}

uint64_t MRContentItemGetTitle()
{
  return MEMORY[0x270F49DC8]();
}

uint64_t MRMediaRemoteApplicationSupportsBrowsableContent()
{
  return MEMORY[0x270F49E60]();
}

uint64_t MRMediaRemoteApplicationSupportsImmediatePlayback()
{
  return MEMORY[0x270F49E68]();
}

uint64_t MRMediaRemoteApplicationSupportsSectionedBrowsing()
{
  return MEMORY[0x270F49E70]();
}

uint64_t MRMediaRemoteBeginLoadingBrowsableContent()
{
  return MEMORY[0x270F49E78]();
}

uint64_t MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers()
{
  return MEMORY[0x270F49E80]();
}

uint64_t MRMediaRemoteBrowsableContentSupportsPlaybackProgress()
{
  return MEMORY[0x270F49E88]();
}

uint64_t MRMediaRemoteGetBrowsableContentChildItems()
{
  return MEMORY[0x270F49F38]();
}

uint64_t MRMediaRemoteGetCountOfBrowsableContentChildItems()
{
  return MEMORY[0x270F49F48]();
}

uint64_t MRMediaRemoteGetSupportedBrowsableContentAPIs()
{
  return MEMORY[0x270F49FC8]();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return MEMORY[0x270F4A018]();
}

uint64_t MRMediaRemoteRequestPlaybackInitialization()
{
  return MEMORY[0x270F4A038]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x270F4A050]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x270F4A0A8]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x270F4A338]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint64_t msv_dispatch_async_on_queue()
{
  return MEMORY[0x270F4A430]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}