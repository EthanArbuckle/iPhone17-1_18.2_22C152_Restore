@interface SDASharedItemsFactory
+ (id)plainItemsFromItemSources:(id)a3;
+ (id)sharedFactory;
+ (id)sharedItemsInCategory:(int64_t)a3 ofType:(int64_t)a4;
- (NSArray)attributedStrings;
- (NSArray)calendarEvents;
- (NSArray)contacts;
- (NSArray)genericDataDocuments;
- (NSArray)iLifeLinks;
- (NSArray)iTunesStoreLinks;
- (NSArray)iWorkLinks;
- (NSArray)images;
- (NSArray)mapsLinks;
- (NSArray)pages;
- (NSArray)passes;
- (NSArray)pdfs;
- (NSArray)sharedKeynoteLiveLinks;
- (NSArray)sharediCloudDocumentsLinks;
- (NSArray)sharingDrawingDocuments;
- (NSArray)strings;
- (NSArray)svgImages;
- (NSArray)telephoneLinks;
- (NSArray)textDocuments;
- (NSArray)videos;
- (NSArray)voiceMemos;
- (NSArray)webLinkStringBlocks;
- (NSArray)webLinkStrings;
- (NSArray)webLinks;
- (NSArray)yelpLinks;
- (SDASharedItemsFactory)init;
- (id)dataDocuments;
- (id)findMyFriendsLink;
- (id)itemSourcesForFileNames:(id)a3 previewImageBaseName:(id)a4 fakeItemDuration:(float)a5 fakeItemBytes:(int64_t)a6 fakeBundleID:(id)a7;
- (id)itemSourcesForNonFileURLDictionaries:(id)a3 fakeItemDuration:(float)a4 fakeItemBytes:(int64_t)a5 fakeBundleID:(id)a6;
- (id)keynoteLiveLinks;
- (void)setAttributedStrings:(id)a3;
- (void)setCalendarEvents:(id)a3;
- (void)setContacts:(id)a3;
- (void)setGenericDataDocuments:(id)a3;
- (void)setILifeLinks:(id)a3;
- (void)setITunesStoreLinks:(id)a3;
- (void)setIWorkLinks:(id)a3;
- (void)setImages:(id)a3;
- (void)setMapsLinks:(id)a3;
- (void)setPages:(id)a3;
- (void)setPasses:(id)a3;
- (void)setPdfs:(id)a3;
- (void)setSharedKeynoteLiveLinks:(id)a3;
- (void)setSharediCloudDocumentsLinks:(id)a3;
- (void)setSharingDrawingDocuments:(id)a3;
- (void)setStrings:(id)a3;
- (void)setSvgImages:(id)a3;
- (void)setTelephoneLinks:(id)a3;
- (void)setTextDocuments:(id)a3;
- (void)setVideos:(id)a3;
- (void)setVoiceMemos:(id)a3;
- (void)setWebLinkStringBlocks:(id)a3;
- (void)setWebLinkStrings:(id)a3;
- (void)setWebLinks:(id)a3;
- (void)setYelpLinks:(id)a3;
@end

@implementation SDASharedItemsFactory

+ (id)sharedFactory
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)qword_100980288;
  if (!qword_100980288)
  {
    v4 = objc_alloc_init(SDASharedItemsFactory);
    v5 = (void *)qword_100980288;
    qword_100980288 = (uint64_t)v4;

    v3 = (void *)qword_100980288;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

- (SDASharedItemsFactory)init
{
  v23.receiver = self;
  v23.super_class = (Class)SDASharedItemsFactory;
  v3 = [(SDASharedItemsFactory *)&v23 init];
  if (v3)
  {
    if ([&off_1009070B8 count] != (id)12)
    {
      v7 = +[NSAssertionHandler currentHandler];
      v8 = [&off_1009070D0 objectAtIndexedSubscript:1];
      [v7 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 51, @"enum and string values out of sync: %@", v8 object file lineNumber description];
    }
    if ([&off_1009070E8 count] != (id)8)
    {
      v9 = +[NSAssertionHandler currentHandler];
      v10 = [&off_100907100 objectAtIndexedSubscript:2];
      [v9 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 54, @"enum and string values out of sync: %@", v10 object file lineNumber description];
    }
    if ([&off_100907118 count] != (id)1)
    {
      v11 = +[NSAssertionHandler currentHandler];
      v12 = [&off_100907130 objectAtIndexedSubscript:3];
      [v11 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 57, @"enum and string values out of sync: %@", v12 object file lineNumber description];
    }
    if ([&off_100907148 count] != (id)4)
    {
      v13 = +[NSAssertionHandler currentHandler];
      v14 = [&off_100907160 objectAtIndexedSubscript:4];
      [v13 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 60, @"enum and string values out of sync: %@", v14 object file lineNumber description];
    }
    if ([&off_100907178 count] != (id)6)
    {
      v15 = +[NSAssertionHandler currentHandler];
      v16 = [&off_100907190 objectAtIndexedSubscript:5];
      [v15 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 63, @"enum and string values out of sync: %@", v16 object file lineNumber description];
    }
    if ([&off_1009071A8 count] != (id)11)
    {
      v17 = +[NSAssertionHandler currentHandler];
      v18 = [&off_1009071C0 objectAtIndexedSubscript:6];
      [v17 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 66, @"enum and string values out of sync: %@", v18 object file lineNumber description];
    }
    if ([&off_1009071D8 count] != (id)4)
    {
      v19 = +[NSAssertionHandler currentHandler];
      v20 = [&off_1009071F0 objectAtIndexedSubscript:7];
      [v19 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 69, @"enum and string values out of sync: %@", v20 object file lineNumber description];
    }
    if ([&off_100907208 count] != (id)1)
    {
      v21 = +[NSAssertionHandler currentHandler];
      v22 = [&off_100907220 objectAtIndexedSubscript:8];
      [v21 handleFailureInMethod:a2, v3, @"SDASharedItemsFactory.m", 72, @"enum and string values out of sync: %@", v22 object file lineNumber description];
    }
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    bundle = v3->_bundle;
    v3->_bundle = (NSBundle *)v4;

    if (!v3->_bundle)
    {

      return 0;
    }
  }
  return v3;
}

- (NSArray)calendarEvents
{
  LODWORD(v2) = 1.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907238 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobilecal" fakeBundleID:v2];
}

- (NSArray)contacts
{
  LODWORD(v2) = 1.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907250 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.MobileAddressBook" fakeBundleID:v2];
}

- (id)dataDocuments
{
  double v2 = [SDAItemSource alloc];
  v3 = +[NSData data];
  uint64_t v4 = [(SDAItemSource *)v2 initWithData:v3 type:kUTTypeHTML previewImage:0 subject:@"My Generic Data" name:0];

  [(SDAItemSource *)v4 setFakeBytes:100];
  [(SDAItemSource *)v4 setFakeBundleID:@"com.apple.mobilemail"];
  LODWORD(v5) = 1.0;
  [(SDAItemSource *)v4 setFakeDuration:v5];
  v8 = v4;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (NSArray)images
{
  LODWORD(v2) = 2.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907268 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobileslideshow" fakeBundleID:v2];
}

- (NSArray)svgImages
{
  LODWORD(v2) = 2.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907280 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.finder" fakeBundleID:v2];
}

- (NSArray)pages
{
  LODWORD(v2) = 2.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907298 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v2];
}

- (NSArray)passes
{
  LODWORD(v2) = 1.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_1009072B0 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.Passbook" fakeBundleID:v2];
}

- (NSArray)pdfs
{
  LODWORD(v2) = 2.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_1009072C8 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v2];
}

- (NSArray)sharingDrawingDocuments
{
  LODWORD(v2) = 1.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_1009072E0 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v2];
}

- (NSArray)textDocuments
{
  LODWORD(v2) = 1.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_1009072F8 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v2];
}

- (NSArray)videos
{
  LODWORD(v2) = 10.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907310 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.mobileslideshow" fakeBundleID:v2];
}

- (NSArray)voiceMemos
{
  LODWORD(v2) = 3.0;
  return (NSArray *)[(SDASharedItemsFactory *)self itemSourcesForFileNames:&off_100907328 previewImageBaseName:0 fakeItemDuration:0 fakeItemBytes:@"com.apple.VoiceMemos" fakeBundleID:v2];
}

- (id)findMyFriendsLink
{
  double v2 = [SDAItemSource alloc];
  v3 = +[NSURL URLWithString:@"fmf1://foo"];
  uint64_t v4 = [(SDAItemSource *)v2 initWithURL:v3 previewImage:0 subject:@"Location"];

  [(SDAItemSource *)v4 setFakeBundleID:@"com.apple.findmy"];
  [(SDAItemSource *)v4 setFakeBytes:100];
  LODWORD(v5) = 1036831949;
  [(SDAItemSource *)v4 setFakeDuration:v5];
  v8 = v4;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (NSArray)iLifeLinks
{
  double v2 = [SDAItemSource alloc];
  v3 = +[NSURL URLWithString:@"https://www.icloud.com/journal/#1;CAEQARoQMchUru323-EAGU6rC2OZpg;3BAD3ADE-DB60-47A8-975D-17138CD396B1"];
  uint64_t v4 = [(SDAItemSource *)v2 initWithURL:v3 previewImage:0 subject:@"iPhoto Journal"];

  [(SDAItemSource *)v4 setFakeBundleID:@"com.apple.mobileiphoto"];
  [(SDAItemSource *)v4 setFakeBytes:100];
  LODWORD(v5) = 1036831949;
  [(SDAItemSource *)v4 setFakeDuration:v5];
  v8 = v4;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return (NSArray *)v6;
}

- (NSArray)iWorkLinks
{
  double v2 = [SDAItemSource alloc];
  v3 = +[NSURL URLWithString:@"https://www.icloud.com/iw/#pages/some-hash/School%20Report"];
  uint64_t v4 = [(SDAItemSource *)v2 initWithURL:v3 previewImage:0 subject:@"School Report"];

  [(SDAItemSource *)v4 setFakeBundleID:@"com.apple.Pages"];
  [(SDAItemSource *)v4 setFakeBytes:100];
  LODWORD(v5) = 1036831949;
  [(SDAItemSource *)v4 setFakeDuration:v5];
  v8 = v4;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return (NSArray *)v6;
}

- (id)keynoteLiveLinks
{
  v10[0] = @"https://www.icloud.com/keynote-live/wGlPfel-hr529LJVgRDOm5ypCpaoC5zKs5MJSAMYYsVhIPpxvos5iZelgn7Qebu_ZLmk9hrgJWY4vveA_p4Ovp9iYthUHI6MJtlTjsHXx2yGOR4QvbdsS8esHSiSFepDDqq8WrqWPDNwnGiQ7xM-Op19zjCwILdpu77oEsjhls5Kcc-orw";
  v3 = +[UIImage imageNamed:@"elvis_presley-preview.jpg", self->_bundle, @"kSDAItemSourcesURL", @"kSDAItemSourcesPreviewImage" inBundle];
  v9[2] = @"kSDAItemSourcesSubject";
  v10[1] = v3;
  v10[2] = @"Check out this Keynote Live presentatation";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v11 = v4;
  double v5 = +[NSArray arrayWithObjects:&v11 count:1];

  LODWORD(v6) = 1036831949;
  v7 = [(SDASharedItemsFactory *)self itemSourcesForNonFileURLDictionaries:v5 fakeItemDuration:100 fakeItemBytes:@"com.apple.Keynote" fakeBundleID:v6];

  return v7;
}

- (NSArray)sharediCloudDocumentsLinks
{
  v10[0] = @"https://www.icloud.com/pages/000r43N3H8h68IwFK1ifN23sg#PageTest";
  v3 = +[UIImage imageNamed:@"elvis_presley-preview.jpg", self->_bundle, @"kSDAItemSourcesURL", @"kSDAItemSourcesPreviewImage" inBundle];
  v9[2] = @"kSDAItemSourcesSubject";
  v10[1] = v3;
  v10[2] = @"Check out this Pages document";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v11[0] = v4;
  v11[1] = &off_100905A00;
  v11[2] = &off_100905A28;
  double v5 = +[NSArray arrayWithObjects:v11 count:3];

  LODWORD(v6) = 1036831949;
  v7 = [(SDASharedItemsFactory *)self itemSourcesForNonFileURLDictionaries:v5 fakeItemDuration:100 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v6];

  return (NSArray *)v7;
}

- (NSArray)iTunesStoreLinks
{
  v34[0] = @"https://itunes.apple.com/us/book/the-monuments-men/id357655256";
  v33[0] = @"kSDAItemSourcesURL";
  v33[1] = @"kSDAItemSourcesPreviewImage";
  v20 = +[UIImage imageNamed:@"the-monuments-men-preview.jpeg" inBundle:self->_bundle];
  v33[2] = @"kSDAItemSourcesSubject";
  v34[1] = v20;
  v34[2] = @"Check out this book";
  v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  v35[0] = v19;
  v32[0] = @"https://itunes.apple.com/us/podcast/hypercritical/id414920759";
  v31[0] = @"kSDAItemSourcesURL";
  v31[1] = @"kSDAItemSourcesPreviewImage";
  v18 = +[UIImage imageNamed:@"hypercritical-preview.jpeg" inBundle:self->_bundle];
  v31[2] = @"kSDAItemSourcesSubject";
  v32[1] = v18;
  v32[2] = @"Check out this podcast";
  v17 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  v35[1] = v17;
  v30[0] = @"https://itunes.apple.com/us/itunes-u/ipad-iphone-application-development/id480479762";
  v29[0] = @"kSDAItemSourcesURL";
  v29[1] = @"kSDAItemSourcesPreviewImage";
  v16 = +[UIImage imageNamed:@"itunesu-preview.jpeg" inBundle:self->_bundle];
  v29[2] = @"kSDAItemSourcesSubject";
  v30[1] = v16;
  v30[2] = @"Check out this itunes-u";
  v15 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  v35[2] = v15;
  v28[0] = @"https://itunes.apple.com/us/album/complete-50s-albums-collection/id672012335";
  v27[0] = @"kSDAItemSourcesURL";
  v27[1] = @"kSDAItemSourcesPreviewImage";
  v14 = +[UIImage imageNamed:@"elvis_presley-preview.jpg" inBundle:self->_bundle];
  v27[2] = @"kSDAItemSourcesSubject";
  v28[1] = v14;
  v28[2] = @"Check out this album";
  v3 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
  v35[3] = v3;
  v26[0] = @"https://itunes.apple.com/us/movie-collection/the-lord-of-the-rings-trilogy/id365647689";
  v25[0] = @"kSDAItemSourcesURL";
  v25[1] = @"kSDAItemSourcesPreviewImage";
  uint64_t v4 = +[UIImage imageNamed:@"the-lord-of-the-rings-preview.jpeg" inBundle:self->_bundle];
  v25[2] = @"kSDAItemSourcesSubject";
  v26[1] = v4;
  v26[2] = @"Check out this movie collection";
  double v5 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  v35[4] = v5;
  v24[0] = @"https://itunes.apple.com/us/tv-season/breaking-bad-season-1/id271383858";
  v23[0] = @"kSDAItemSourcesURL";
  v23[1] = @"kSDAItemSourcesPreviewImage";
  double v6 = +[UIImage imageNamed:@"breaking-bad-preview.jpeg" inBundle:self->_bundle];
  v23[2] = @"kSDAItemSourcesSubject";
  v24[1] = v6;
  v24[2] = @"Check out this tv-season";
  v7 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  v35[5] = v7;
  v22[0] = @"https://itunes.apple.com/us/audiobook/steve-jobs-unabridged/id473826062";
  v21[0] = @"kSDAItemSourcesURL";
  v21[1] = @"kSDAItemSourcesPreviewImage";
  v8 = +[UIImage imageNamed:@"steve-jobs-preview.jpeg" inBundle:self->_bundle];
  v21[2] = @"kSDAItemSourcesSubject";
  v22[1] = v8;
  v22[2] = @"Check out this audiobook";
  v9 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  v35[6] = v9;
  v10 = +[NSArray arrayWithObjects:v35 count:7];

  LODWORD(v11) = 1036831949;
  v12 = [(SDASharedItemsFactory *)self itemSourcesForNonFileURLDictionaries:v10 fakeItemDuration:100 fakeItemBytes:@"com.apple.MobileStore" fakeBundleID:v11];

  return (NSArray *)v12;
}

- (NSArray)mapsLinks
{
  v10[0] = @"http://maps.apple.com/?lsp=9902&auid=10582173481701573620&sll=37.331848,-122.030296&q=Apple%2C%20Inc.&hnear=1%20Infinite%20Loop%20Cupertino%20CA%2095014%20United%20States";
  v3 = +[UIImage imageNamed:@"apple_inc-preview.png", self->_bundle, @"kSDAItemSourcesURL", @"kSDAItemSourcesPreviewImage" inBundle];
  v9[2] = @"kSDAItemSourcesSubject";
  v10[1] = v3;
  v10[2] = @"Apple Inc.";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  double v11 = v4;
  double v5 = +[NSArray arrayWithObjects:&v11 count:1];

  LODWORD(v6) = 1036831949;
  v7 = [(SDASharedItemsFactory *)self itemSourcesForNonFileURLDictionaries:v5 fakeItemDuration:100 fakeItemBytes:@"com.apple.Maps" fakeBundleID:v6];

  return (NSArray *)v7;
}

- (NSArray)telephoneLinks
{
  v10[0] = @"tel://+18000391010";
  v3 = +[UIImage imageNamed:@"apple_inc-preview.png", self->_bundle, @"kSDAItemSourcesURL", @"kSDAItemSourcesPreviewImage" inBundle];
  v9[2] = @"kSDAItemSourcesSubject";
  v10[1] = v3;
  v10[2] = @"Apple Inc.";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  double v11 = v4;
  double v5 = +[NSArray arrayWithObjects:&v11 count:1];

  LODWORD(v6) = 1036831949;
  v7 = [(SDASharedItemsFactory *)self itemSourcesForNonFileURLDictionaries:v5 fakeItemDuration:100 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v6];

  return (NSArray *)v7;
}

- (NSArray)webLinks
{
  v18[0] = @"http://www.apple.com";
  v17[0] = @"kSDAItemSourcesURL";
  v17[1] = @"kSDAItemSourcesPreviewImage";
  v3 = +[UIImage imageNamed:@"apple_com-preview.png" inBundle:self->_bundle];
  v17[2] = @"kSDAItemSourcesSubject";
  v18[1] = v3;
  v18[2] = @"Please go check out apple.com";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  v19[0] = v4;
  v16[0] = @"http://www.yahoo.com";
  v15[0] = @"kSDAItemSourcesURL";
  v15[1] = @"kSDAItemSourcesPreviewImage";
  double v5 = +[UIImage imageNamed:@"apple_com-preview.png" inBundle:self->_bundle];
  v15[2] = @"kSDAItemSourcesSubject";
  v16[1] = v5;
  v16[2] = @"Please go check out yahoo.com";
  double v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  v19[1] = v6;
  v14[0] = @"http://www.cnn.com";
  v13[0] = @"kSDAItemSourcesURL";
  v13[1] = @"kSDAItemSourcesPreviewImage";
  v7 = +[UIImage imageNamed:@"apple_com-preview.png" inBundle:self->_bundle];
  v13[2] = @"kSDAItemSourcesSubject";
  v14[1] = v7;
  v14[2] = @"Please go check out cnn.com";
  v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v19[2] = v8;
  v9 = +[NSArray arrayWithObjects:v19 count:3];

  LODWORD(v10) = 1036831949;
  double v11 = [(SDASharedItemsFactory *)self itemSourcesForNonFileURLDictionaries:v9 fakeItemDuration:100 fakeItemBytes:@"com.apple.mobilemail" fakeBundleID:v10];

  return (NSArray *)v11;
}

- (NSArray)webLinkStrings
{
  double v2 = +[UIImage imageNamed:@"apple_com-preview.png" inBundle:self->_bundle];
  v3 = [[SDAItemSource alloc] initWithString:@"http://www.apple.com" previewImage:v2 subject:@"Please go check out apple.com"];
  [(SDAItemSource *)v3 setFakeBundleID:@"com.apple.mobilemail"];
  [(SDAItemSource *)v3 setFakeBytes:100];
  LODWORD(v4) = 1036831949;
  [(SDAItemSource *)v3 setFakeDuration:v4];
  v7 = v3;
  double v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return (NSArray *)v5;
}

- (NSArray)webLinkStringBlocks
{
  double v2 = +[UIImage imageNamed:@"apple_com-preview.png" inBundle:self->_bundle];
  v3 = [[SDAItemSource alloc] initWithString:@"Come check out the amazing new stuff at http://www.apple.com/ . Special discounts this week" previewImage:v2 subject:@"Please go check out apple.com"];
  [(SDAItemSource *)v3 setFakeBundleID:@"com.apple.mobilemail"];
  [(SDAItemSource *)v3 setFakeBytes:100];
  LODWORD(v4) = 1036831949;
  [(SDAItemSource *)v3 setFakeDuration:v4];
  v7 = v3;
  double v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return (NSArray *)v5;
}

- (NSArray)yelpLinks
{
  v3 = +[NSURL URLWithString:@"yelp://biz/the-sentinel-san-francisco"];
  double v4 = +[UIImage imageNamed:@"the_sentinel_san_francisco-preview.jpg" inBundle:self->_bundle];
  double v5 = [[SDAItemSource alloc] initWithURL:v3 previewImage:v4 subject:@"The Sentinel Restaurant"];
  [(SDAItemSource *)v5 setFakeBundleID:@"com.apple.mobilemail"];
  [(SDAItemSource *)v5 setFakeBytes:100];
  LODWORD(v6) = 1036831949;
  [(SDAItemSource *)v5 setFakeDuration:v6];
  v9 = v5;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v7;
}

- (NSArray)attributedStrings
{
  double v2 = objc_opt_new();
  id v3 = [objc_alloc((Class)NSAttributedString) initWithString:@"Hello. This is a test attributed string."];
  [v2 appendAttributedString:v3];

  double v4 = +[UIColor yellowColor];
  [v2 addAttribute:NSBackgroundColorAttributeName value:v4 range:3, 5];

  double v5 = +[UIColor greenColor];
  [v2 addAttribute:NSForegroundColorAttributeName value:v5 range:10, 7];

  double v6 = +[UIFont boldSystemFontOfSize:20.0];
  [v2 addAttribute:NSFontAttributeName value:v6 range:20, 10];

  v13 = v2;
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B74DC;
  void v11[3] = &unk_1008CFB18;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v12;
  [v7 enumerateObjectsUsingBlock:v11];
  id v9 = [v8 copy];

  return (NSArray *)v9;
}

- (NSArray)strings
{
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [&off_100907340 count]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B7658;
  v5[3] = &unk_1008CFB40;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v6;
  [&off_100907340 enumerateObjectsUsingBlock:v5];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (id)itemSourcesForNonFileURLDictionaries:(id)a3 fakeItemDuration:(float)a4 fakeItemBytes:(int64_t)a5 fakeBundleID:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1001B7818;
  v18 = &unk_1008CFB68;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v21 = a5;
  float v22 = a4;
  id v19 = v9;
  id v11 = v20;
  id v12 = v9;
  [v10 enumerateObjectsUsingBlock:&v15];

  id v13 = [v11 copy:v15, v16, v17, v18];

  return v13;
}

- (id)itemSourcesForFileNames:(id)a3 previewImageBaseName:(id)a4 fakeItemDuration:(float)a5 fakeItemBytes:(int64_t)a6 fakeBundleID:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  float v22 = sub_1001B7AB8;
  objc_super v23 = &unk_1008CFB90;
  v24 = self;
  id v25 = v12;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v28 = a6;
  float v29 = a5;
  id v26 = v13;
  id v15 = v27;
  id v16 = v13;
  id v17 = v12;
  [v14 enumerateObjectsUsingBlock:&v20];

  id v18 = [v15 copy:v20, v21, v22, v23, v24];

  return v18;
}

+ (id)plainItemsFromItemSources:(id)a3
{
  id v3 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B7DAC;
  v7[3] = &unk_1008CFBB8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  [v3 enumerateObjectsUsingBlock:v7];

  id v5 = [v4 copy];

  return v5;
}

+ (id)sharedItemsInCategory:(int64_t)a3 ofType:(int64_t)a4
{
  id v8 = [a1 sharedFactory];
  if (!v8)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"SDASharedItemsFactory.m" lineNumber:567 description:@"factory is nil."];
  }
  switch(a3)
  {
    case 0:
      switch(a4)
      {
        case 0:
          id v9 = [v8 images];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v53 = v10;
          id v11 = &v53;
          goto LABEL_59;
        case 1:
          uint64_t v16 = [v8 images];
          goto LABEL_62;
        case 2:
          id v9 = [v8 videos];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v52 = v10;
          id v11 = &v52;
          goto LABEL_59;
        case 3:
          id v9 = [v8 images];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v51[0] = v10;
          id v13 = [v8 images];
          id v14 = [v13 objectAtIndexedSubscript:1];
          v51[1] = v14;
          id v17 = [v8 videos];
          id v18 = [v17 objectAtIndexedSubscript:0];
          v51[2] = v18;
          id v12 = +[NSArray arrayWithObjects:v51 count:3];

          goto LABEL_41;
        case 4:
          id v9 = [v8 svgImages];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v50 = v10;
          id v11 = &v50;
          goto LABEL_59;
        default:
          goto LABEL_20;
      }
    case 1:
      switch(a4)
      {
        case 0:
          id v9 = [v8 contacts];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v49 = v10;
          id v11 = &v49;
          goto LABEL_59;
        case 1:
          id v9 = [v8 contacts];
          id v10 = [v9 objectAtIndexedSubscript:1];
          v48 = v10;
          id v11 = &v48;
          goto LABEL_59;
        case 2:
          id v9 = [v8 contacts];
          id v10 = [v9 objectAtIndexedSubscript:2];
          v47 = v10;
          id v11 = &v47;
          goto LABEL_59;
        case 3:
          uint64_t v16 = [v8 contacts];
          goto LABEL_62;
        case 4:
          id v9 = [v8 calendarEvents];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v46 = v10;
          id v11 = &v46;
          goto LABEL_59;
        case 5:
          uint64_t v16 = [v8 calendarEvents];
          goto LABEL_62;
        case 6:
          id v9 = [v8 passes];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v45 = v10;
          id v11 = &v45;
          goto LABEL_59;
        case 7:
          uint64_t v16 = [v8 passes];
          goto LABEL_62;
        case 8:
          id v9 = [v8 voiceMemos];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v44 = v10;
          id v11 = &v44;
          goto LABEL_59;
        case 9:
          uint64_t v16 = [v8 voiceMemos];
          goto LABEL_62;
        case 10:
          id v9 = [v8 textDocuments];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v43 = v10;
          id v11 = &v43;
          goto LABEL_59;
        case 11:
          uint64_t v16 = [v8 textDocuments];
          goto LABEL_62;
        default:
          goto LABEL_20;
      }
    case 2:
      id v9 = [v8 iTunesStoreLinks];
      id v10 = [v9 objectAtIndexedSubscript:a4];
      v42 = v10;
      id v11 = &v42;
      goto LABEL_59;
    case 3:
      if (a4) {
        goto LABEL_20;
      }
      id v9 = [v8 mapsLinks];
      id v10 = [v9 objectAtIndexedSubscript:0];
      v41 = v10;
      id v11 = &v41;
LABEL_59:
      id v12 = +[NSArray arrayWithObjects:v11 count:1];
      goto LABEL_60;
    case 4:
      switch(a4)
      {
        case 0:
          id v9 = [v8 webLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v40 = v10;
          id v11 = &v40;
          goto LABEL_59;
        case 1:
          uint64_t v16 = [v8 webLinks];
          goto LABEL_62;
        case 2:
          id v9 = [v8 webLinkStrings];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v39 = v10;
          id v11 = &v39;
          goto LABEL_59;
        case 3:
          id v9 = [v8 webLinkStringBlocks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v38 = v10;
          id v11 = &v38;
          goto LABEL_59;
        default:
          goto LABEL_20;
      }
    case 5:
      switch(a4)
      {
        case 0:
          id v9 = [v8 pdfs];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v37 = v10;
          id v11 = &v37;
          goto LABEL_59;
        case 1:
          uint64_t v16 = [v8 pdfs];
          goto LABEL_62;
        case 2:
          id v9 = [v8 pages];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v36 = v10;
          id v11 = &v36;
          goto LABEL_59;
        case 3:
          uint64_t v16 = [v8 pages];
          goto LABEL_62;
        case 4:
          id v9 = [v8 pdfs];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v35[0] = v10;
          id v13 = [v8 pages];
          id v14 = [v13 objectAtIndexedSubscript:0];
          v35[1] = v14;
          id v15 = v35;
          goto LABEL_40;
        case 5:
          id v9 = [v8 sharingDrawingDocuments];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v34 = v10;
          id v11 = &v34;
          goto LABEL_59;
        default:
          goto LABEL_20;
      }
    case 6:
      switch(a4)
      {
        case 0:
          id v9 = [v8 telephoneLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v33 = v10;
          id v11 = &v33;
          goto LABEL_59;
        case 1:
          id v9 = [v8 findMyFriendsLink];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v32 = v10;
          id v11 = &v32;
          goto LABEL_59;
        case 2:
          id v9 = [v8 yelpLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v31 = v10;
          id v11 = &v31;
          goto LABEL_59;
        case 3:
          id v9 = [v8 webLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          v30[0] = v10;
          id v13 = [v8 yelpLinks];
          id v14 = [v13 objectAtIndexedSubscript:0];
          v30[1] = v14;
          id v15 = v30;
          goto LABEL_40;
        case 4:
          id v9 = [v8 iLifeLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          float v29 = v10;
          id v11 = &v29;
          goto LABEL_59;
        case 5:
          id v9 = [v8 iWorkLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          int64_t v28 = v10;
          id v11 = &v28;
          goto LABEL_59;
        case 6:
          id v9 = [v8 keynoteLiveLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          id v27 = v10;
          id v11 = &v27;
          goto LABEL_59;
        case 7:
          id v9 = [v8 sharediCloudDocumentsLinks];
          id v10 = [v9 objectAtIndexedSubscript:0];
          id v26 = v10;
          id v11 = &v26;
          goto LABEL_59;
        case 8:
          id v9 = [v8 sharediCloudDocumentsLinks];
          id v10 = [v9 objectAtIndexedSubscript:1];
          id v25 = v10;
          id v11 = &v25;
          goto LABEL_59;
        case 9:
          id v9 = [v8 sharediCloudDocumentsLinks];
          id v10 = [v9 objectAtIndexedSubscript:2];
          v24 = v10;
          id v11 = &v24;
          goto LABEL_59;
        case 10:
          uint64_t v16 = [v8 sharediCloudDocumentsLinks];
          goto LABEL_62;
        default:
          goto LABEL_20;
      }
    case 7:
      switch(a4)
      {
        case 0:
          id v9 = [v8 strings];
          id v10 = [v9 objectAtIndexedSubscript:0];
          objc_super v23 = v10;
          id v11 = &v23;
          goto LABEL_59;
        case 1:
          uint64_t v16 = [v8 strings];
          break;
        case 2:
          id v9 = [v8 attributedStrings];
          id v10 = [v9 objectAtIndexedSubscript:0];
          float v22 = v10;
          id v11 = &v22;
          goto LABEL_59;
        case 3:
          uint64_t v16 = [v8 dataDocuments];
          break;
        default:
          goto LABEL_20;
      }
LABEL_62:
      id v12 = (void *)v16;
      break;
    case 8:
      if (a4) {
        goto LABEL_20;
      }
      id v9 = [v8 strings];
      id v10 = [v9 objectAtIndexedSubscript:0];
      v21[0] = v10;
      id v13 = [v8 images];
      id v14 = [v13 objectAtIndexedSubscript:0];
      v21[1] = v14;
      id v15 = v21;
LABEL_40:
      id v12 = +[NSArray arrayWithObjects:v15 count:2];
LABEL_41:

LABEL_60:
      break;
    default:
LABEL_20:
      id v12 = 0;
      break;
  }

  return v12;
}

- (void)setCalendarEvents:(id)a3
{
}

- (void)setContacts:(id)a3
{
}

- (void)setImages:(id)a3
{
}

- (void)setSvgImages:(id)a3
{
}

- (NSArray)genericDataDocuments
{
  return self->_genericDataDocuments;
}

- (void)setGenericDataDocuments:(id)a3
{
}

- (void)setPages:(id)a3
{
}

- (void)setPasses:(id)a3
{
}

- (void)setPdfs:(id)a3
{
}

- (void)setSharingDrawingDocuments:(id)a3
{
}

- (void)setTextDocuments:(id)a3
{
}

- (void)setVideos:(id)a3
{
}

- (void)setVoiceMemos:(id)a3
{
}

- (void)setILifeLinks:(id)a3
{
}

- (void)setITunesStoreLinks:(id)a3
{
}

- (void)setIWorkLinks:(id)a3
{
}

- (void)setMapsLinks:(id)a3
{
}

- (NSArray)sharedKeynoteLiveLinks
{
  return self->_sharedKeynoteLiveLinks;
}

- (void)setSharedKeynoteLiveLinks:(id)a3
{
}

- (void)setSharediCloudDocumentsLinks:(id)a3
{
}

- (void)setTelephoneLinks:(id)a3
{
}

- (void)setWebLinks:(id)a3
{
}

- (void)setWebLinkStrings:(id)a3
{
}

- (void)setWebLinkStringBlocks:(id)a3
{
}

- (void)setYelpLinks:(id)a3
{
}

- (void)setAttributedStrings:(id)a3
{
}

- (void)setStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
  objc_storeStrong((id *)&self->_yelpLinks, 0);
  objc_storeStrong((id *)&self->_webLinkStringBlocks, 0);
  objc_storeStrong((id *)&self->_webLinkStrings, 0);
  objc_storeStrong((id *)&self->_webLinks, 0);
  objc_storeStrong((id *)&self->_telephoneLinks, 0);
  objc_storeStrong((id *)&self->_sharediCloudDocumentsLinks, 0);
  objc_storeStrong((id *)&self->_sharedKeynoteLiveLinks, 0);
  objc_storeStrong((id *)&self->_mapsLinks, 0);
  objc_storeStrong((id *)&self->_iWorkLinks, 0);
  objc_storeStrong((id *)&self->_iTunesStoreLinks, 0);
  objc_storeStrong((id *)&self->_iLifeLinks, 0);
  objc_storeStrong((id *)&self->_voiceMemos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_textDocuments, 0);
  objc_storeStrong((id *)&self->_sharingDrawingDocuments, 0);
  objc_storeStrong((id *)&self->_pdfs, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_genericDataDocuments, 0);
  objc_storeStrong((id *)&self->_svgImages, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_calendarEvents, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end