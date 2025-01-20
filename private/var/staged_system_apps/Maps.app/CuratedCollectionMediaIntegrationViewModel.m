@interface CuratedCollectionMediaIntegrationViewModel
+ (double)logoToTitlePaddingWithMediaType:(int64_t)a3;
+ (id)actionTextForResult:(id)a3 hasChildLinks:(BOOL)a4;
+ (id)bundleIdentifierForResult:(id)a3;
+ (id)formatterForDurationString;
+ (id)localizedSystemFirstPartyNameForResult:(id)a3;
+ (id)realmIconForResult:(id)a3;
+ (id)subtitleForResult:(id)a3;
+ (id)systemFirstPartyIconForResult:(id)a3;
- (CuratedCollectionMediaIntegrationViewModel)initWithAdamID:(id)a3 title:(id)a4 subtitle:(id)a5 actionText:(id)a6 url:(id)a7 artworkURL:(id)a8 systemFirstPartyIcon:(id)a9 localizedSystemFirstPartyName:(id)a10 realmIcon:(id)a11 childViewModels:(id)a12 targetAppIdentifier:(id)a13 mediaType:(int64_t)a14 logoToTitlePadding:(double)a15;
- (CuratedCollectionMediaIntegrationViewModel)initWithAppleMediaServicesResult:(id)a3 thirdPartyLinks:(id)a4;
- (CuratedCollectionMediaIntegrationViewModel)initWithResolvedThirdPartyLink:(id)a3 mediaType:(int64_t)a4;
- (NSArray)childViewModels;
- (NSString)actionText;
- (NSString)identifier;
- (NSString)localizedSystemFirstPartyName;
- (NSString)subtitle;
- (NSString)targetAppIdentifier;
- (NSString)title;
- (NSURL)artworkURL;
- (NSURL)url;
- (UIImage)realmIcon;
- (UIImage)systemFirstPartyIcon;
- (double)logoToTitlePadding;
- (int64_t)mediaType;
- (void)cancelImageDownload;
- (void)loadImageForSize:(CGSize)a3 completion:(id)a4;
@end

@implementation CuratedCollectionMediaIntegrationViewModel

- (CuratedCollectionMediaIntegrationViewModel)initWithAppleMediaServicesResult:(id)a3 thirdPartyLinks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  id v9 = [v8 copy];

  v10 = [v6 displayName];
  id v11 = [v10 copy];

  v12 = [v6 url];
  v13 = [v6 artworkURL];
  v14 = 0;
  if (v9 && v11 && v12 && v13)
  {
    id v30 = v13;
    id v29 = v9;
    id v15 = [v6 mediaType];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1004A9888;
    v31[3] = &unk_1012EC128;
    v16 = self;
    v32 = v16;
    id v33 = v15;
    v17 = [v7 _maps_map:v31];
    v27 = [(id)objc_opt_class() subtitleForResult:v6];
    v18 = v17;
    v25 = v17;
    v26 = [objc_opt_class() actionTextForResult:v6 hasChildLinks:[v17 count] != 0];
    v24 = [(id)objc_opt_class() systemFirstPartyIconForResult:v6];
    v19 = [(id)objc_opt_class() localizedSystemFirstPartyNameForResult:v6];
    v20 = [(id)objc_opt_class() realmIconForResult:v6];
    [(id)objc_opt_class() bundleIdentifierForResult:v6];
    v21 = id v28 = v7;
    [(id)objc_opt_class() logoToTitlePaddingWithMediaType:v15];
    id v23 = v15;
    id v9 = v29;
    self = -[CuratedCollectionMediaIntegrationViewModel initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:](v16, "initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:", v29, v11, v27, v26, v12, v30, v24, v19, v20, v18, v21, v23);

    id v7 = v28;
    v13 = v30;
    v14 = self;
  }

  return v14;
}

- (CuratedCollectionMediaIntegrationViewModel)initWithResolvedThirdPartyLink:(id)a3 mediaType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 adamID];
  v8 = [v6 appName];
  id v9 = [v6 url];
  v10 = [v6 appIconURL];
  id v11 = [v6 adamID];

  [(id)objc_opt_class() logoToTitlePaddingWithMediaType:a4];
  v12 = -[CuratedCollectionMediaIntegrationViewModel initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:](self, "initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:", v7, v8, 0, 0, v9, v10, 0, 0, 0, 0, v11, a4);

  return v12;
}

- (CuratedCollectionMediaIntegrationViewModel)initWithAdamID:(id)a3 title:(id)a4 subtitle:(id)a5 actionText:(id)a6 url:(id)a7 artworkURL:(id)a8 systemFirstPartyIcon:(id)a9 localizedSystemFirstPartyName:(id)a10 realmIcon:(id)a11 childViewModels:(id)a12 targetAppIdentifier:(id)a13 mediaType:(int64_t)a14 logoToTitlePadding:(double)a15
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v51 = a7;
  id v25 = a8;
  id v50 = a8;
  id v49 = a9;
  id v26 = a10;
  v27 = v24;
  id v48 = a11;
  id v28 = a12;
  id v29 = v23;
  id v30 = a13;
  v52.receiver = self;
  v52.super_class = (Class)CuratedCollectionMediaIntegrationViewModel;
  v31 = [(CuratedCollectionMediaIntegrationViewModel *)&v52 init];
  if (v31)
  {
    v32 = (NSString *)[v21 copy];
    identifier = v31->_identifier;
    v31->_identifier = v32;

    v34 = (NSString *)[v22 copy];
    title = v31->_title;
    v31->_title = v34;

    v36 = (NSString *)[v29 copy];
    subtitle = v31->_subtitle;
    v31->_subtitle = v36;

    v38 = (NSString *)[v27 copy];
    actionText = v31->_actionText;
    v31->_actionText = v38;

    objc_storeStrong((id *)&v31->_url, a7);
    objc_storeStrong((id *)&v31->_artworkURL, v25);
    objc_storeStrong((id *)&v31->_systemFirstPartyIcon, a9);
    v40 = (NSString *)[v26 copy];
    localizedSystemFirstPartyName = v31->_localizedSystemFirstPartyName;
    v31->_localizedSystemFirstPartyName = v40;

    objc_storeStrong((id *)&v31->_realmIcon, a11);
    v42 = (NSArray *)[v28 copy];
    childViewModels = v31->_childViewModels;
    v31->_childViewModels = v42;

    v44 = (NSString *)[v30 copy];
    targetAppIdentifier = v31->_targetAppIdentifier;
    v31->_targetAppIdentifier = v44;

    v31->_mediaType = a14;
    v31->_logoToTitlePadding = a15;
  }

  return v31;
}

- (void)loadImageForSize:(CGSize)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[MKAppImageManager sharedImageManager];
  artworkURL = self->_artworkURL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004A9CC8;
  v9[3] = &unk_1012EC150;
  id v10 = v5;
  id v8 = v5;
  [v6 loadAppImageAtURL:artworkURL completionHandler:v9];
}

- (void)cancelImageDownload
{
  id v3 = +[MKAppImageManager sharedImageManager];
  [v3 cancelLoadAppImageAtURL:self->_artworkURL];
}

+ (id)formatterForDurationString
{
  if (qword_10160EE00 != -1) {
    dispatch_once(&qword_10160EE00, &stru_1012EC170);
  }
  v2 = (void *)qword_10160EDF8;

  return v2;
}

+ (id)subtitleForResult:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 mediaType])
  {
    case 1uLL:
    case 2uLL:
      uint64_t v5 = [v4 subtitle];
      goto LABEL_6;
    case 3uLL:
      uint64_t v5 = [v4 editorialSubtitle];
      goto LABEL_6;
    case 4uLL:
    case 5uLL:
    case 9uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xFuLL:
    case 0x10uLL:
      uint64_t v5 = [v4 artistName];
LABEL_6:
      id v6 = (void *)v5;
      break;
    case 6uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Music Artist";
      goto LABEL_17;
    case 7uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Music Playlist";
      goto LABEL_17;
    case 8uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Music Radio Station";
      goto LABEL_17;
    case 0xAuLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Music Spotlight";
      goto LABEL_17;
    case 0xBuLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Music Artist Interview";
      goto LABEL_17;
    case 0xEuLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Podcast Channel";
      goto LABEL_17;
    case 0x11uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Book Author";
      goto LABEL_17;
    case 0x12uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Fitness+ Trainer";
      goto LABEL_17;
    case 0x13uLL:
      id v10 = +[NSBundle mainBundle];
      id v8 = [v10 localizedStringForKey:@"[Curated Guides] Media Integration Subtitle Fitness+ Class" value:@"localized string not found" table:0];

      id v11 = [v4 classType];
      v12 = [a1 formatterForDurationString];
      [v4 duration];
      v14 = [v12 stringFromTimeInterval:v13 / 1000.0];
      id v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 episodeNumber]);
      v16 = +[NSNumberFormatter localizedStringFromNumber:v15 numberStyle:1];
      id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v11, v14, v16);

      goto LABEL_18;
    case 0x14uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Curated Guides] Media Integration Subtitle Fitness+ Class Type";
LABEL_17:
      id v6 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
LABEL_18:

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (id)actionTextForResult:(id)a3 hasChildLinks:(BOOL)a4
{
  switch((unint64_t)[a3 mediaType])
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      id v7 = +[NSBundle mainBundle];
      uint64_t v5 = v7;
      CFStringRef v6 = @"[Curated Guides] View on App Store";
      goto LABEL_17;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0xAuLL:
      uint64_t v5 = +[NSBundle mainBundle];
      if (a4) {
        goto LABEL_15;
      }
      CFStringRef v6 = @"[Curated Guides] Listen on Apple Music";
      goto LABEL_16;
    case 9uLL:
    case 0xBuLL:
      uint64_t v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"[Curated Guides] Watch Now";
      }
      else {
        CFStringRef v6 = @"[Curated Guides] Watch on Apple Music";
      }
      goto LABEL_16;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      uint64_t v5 = +[NSBundle mainBundle];
      if (a4) {
        goto LABEL_15;
      }
      CFStringRef v6 = @"[Curated Guides] Listen on Apple Podcasts";
      goto LABEL_16;
    case 0xFuLL:
      uint64_t v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"[Curated Guides] Read Now";
      }
      else {
        CFStringRef v6 = @"[Curated Guides] Read on Apple Books";
      }
      goto LABEL_16;
    case 0x10uLL:
      uint64_t v5 = +[NSBundle mainBundle];
      if (a4) {
LABEL_15:
      }
        CFStringRef v6 = @"[Curated Guides] Listen Now";
      else {
        CFStringRef v6 = @"[Curated Guides] Listen on Apple Books";
      }
      goto LABEL_16;
    case 0x11uLL:
      uint64_t v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"[Curated Guides] View Now";
      }
      else {
        CFStringRef v6 = @"[Curated Guides] View on Apple Books";
      }
LABEL_16:
      id v7 = v5;
      goto LABEL_17;
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      id v7 = +[NSBundle mainBundle];
      uint64_t v5 = v7;
      CFStringRef v6 = @"[Curated Guides] Try on Apple Fitness+";
LABEL_17:
      id v8 = [v7 localizedStringForKey:v6 value:@"localized string not found" table:0];

      break;
    default:
      id v8 = 0;
      break;
  }

  return v8;
}

+ (id)realmIconForResult:(id)a3
{
  id v3 = (char *)[a3 mediaType];
  if ((unint64_t)(v3 - 1) > 0x13)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[UIImage imageNamed:off_1012EC190[(void)(v3 - 1)]];
  }

  return v4;
}

+ (id)systemFirstPartyIconForResult:(id)a3
{
  id v3 = [a1 bundleIdentifierForResult:a3];
  id v4 = +[UIScreen mainScreen];
  [v4 scale];
  uint64_t v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 1);

  return v5;
}

+ (id)localizedSystemFirstPartyNameForResult:(id)a3
{
  switch((unint64_t)[a3 mediaType])
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Curated Guides] App Store Name";
      goto LABEL_7;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Curated Guides] Apple Music Name";
      goto LABEL_7;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Curated Guides] Apple Podcasts Name";
      goto LABEL_7;
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Curated Guides] Apple Books Name";
      goto LABEL_7;
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Curated Guides] Apple Fitness+ Name";
LABEL_7:
      CFStringRef v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];
      id v7 = +[NSString localizedStringWithFormat:v6];

      break;
    default:
      id v7 = 0;
      break;
  }

  return v7;
}

+ (id)bundleIdentifierForResult:(id)a3
{
  id v3 = (char *)[a3 mediaType];
  if ((unint64_t)(v3 - 1) > 0x13) {
    return 0;
  }
  else {
    return off_1012EC230[(void)(v3 - 1)];
  }
}

+ (double)logoToTitlePaddingWithMediaType:(int64_t)a3
{
  double result = 6.0;
  if ((unint64_t)(a3 - 1) < 3) {
    return 4.0;
  }
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (UIImage)systemFirstPartyIcon
{
  return self->_systemFirstPartyIcon;
}

- (NSString)localizedSystemFirstPartyName
{
  return self->_localizedSystemFirstPartyName;
}

- (UIImage)realmIcon
{
  return self->_realmIcon;
}

- (NSArray)childViewModels
{
  return self->_childViewModels;
}

- (NSString)targetAppIdentifier
{
  return self->_targetAppIdentifier;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (double)logoToTitlePadding
{
  return self->_logoToTitlePadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAppIdentifier, 0);
  objc_storeStrong((id *)&self->_childViewModels, 0);
  objc_storeStrong((id *)&self->_realmIcon, 0);
  objc_storeStrong((id *)&self->_localizedSystemFirstPartyName, 0);
  objc_storeStrong((id *)&self->_systemFirstPartyIcon, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end