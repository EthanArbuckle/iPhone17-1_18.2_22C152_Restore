@interface BKLibraryBookshelfLibraryBaseViewConfiguration
- (BKCollection)collection;
- (BOOL)canChangeViewMode;
- (BOOL)fromActionMenu;
- (BOOL)hideTopSeparatorLine;
- (BOOL)includeCollectionInfo;
- (BOOL)providesProductInfoData;
- (BOOL)providesReviewData;
- (BOOL)showCancelNavigationBarItem;
- (BOOL)showsSortControl;
- (BOOL)stackedSortControl;
- (BOOL)supplementalContentPDFPicker;
- (BOOL)supportsReadingListsButton;
- (NSArray)sortControlConfig;
- (NSPredicate)productInfoFilter;
- (NSString)actionMenuImageName;
- (NSString)cloudDownloadImageName;
- (NSString)cloudErrorImageName;
- (NSString)cloudUploadingImageName;
- (NSString)collectionDescriptionPlaceholderText;
- (NSString)collectionID;
- (NSString)dragBarName;
- (NSString)infoBarAudiobookImageName;
- (NSString)infoBarBuy;
- (NSString)infoBarDownloadPaused;
- (NSString)infoBarDownloadWaiting;
- (NSString)infoBarDownloading;
- (NSString)infoBarNew;
- (NSString)infoBarNext;
- (NSString)infoBarPreOrderable;
- (NSString)infoBarPreOrdered;
- (NSString)infoBarProof;
- (NSString)infoBarSample;
- (NSString)infoExpectedDateString;
- (NSString)moreText;
- (NSString)noBooksDescription;
- (NSString)noBooksDescriptionHeader;
- (NSString)readingListButtonText;
- (NSString)reviewBackgroundName;
- (NSString)selectedCheckmarkName;
- (NSString)seriesID;
- (NSString)supplementalContentPDFTitle;
- (NSString)supplementalContentStorePlaylistID;
- (NSString)unselectedCheckmarkName;
- (NSString)viewDescription;
- (NSString)viewTitle;
- (unint64_t)collectionType;
- (unint64_t)initialSortMode;
- (unint64_t)initialViewMode;
- (void)setCollection:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setFromActionMenu:(BOOL)a3;
- (void)setInitialViewMode:(unint64_t)a3;
- (void)setSupplementalContentStorePlaylistID:(id)a3;
@end

@implementation BKLibraryBookshelfLibraryBaseViewConfiguration

- (unint64_t)collectionType
{
  return 0;
}

- (BOOL)providesReviewData
{
  return 0;
}

- (BOOL)providesProductInfoData
{
  return 1;
}

- (NSPredicate)productInfoFilter
{
  return +[NSPredicate predicateWithFormat:@"storeID != NULL"];
}

- (BOOL)stackedSortControl
{
  return 0;
}

- (BOOL)showsSortControl
{
  return 1;
}

- (unint64_t)initialSortMode
{
  return 6;
}

- (BOOL)canChangeViewMode
{
  return 1;
}

- (NSString)moreText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"More" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)collectionDescriptionPlaceholderText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Description" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)noBooksDescriptionHeader
{
  v2 = [(BKLibraryBookshelfLibraryBaseViewConfiguration *)self collectionID];
  if ([v2 isEqualToString:kBKCollectionDefaultAll])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Library is Empty";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDAudiobooks])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"No Audiobooks";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDPDFs])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"No PDFs";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDSamples])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"No Samples";
  }
  else
  {
    unsigned int v8 = [v2 isEqualToString:kBKCollectionDefaultIDDownloaded];
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    if (v8) {
      CFStringRef v5 = @"No Downloaded Books";
    }
    else {
      CFStringRef v5 = @"No Books";
    }
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_100A70340 table:0];

  return (NSString *)v6;
}

- (NSString)noBooksDescription
{
  v2 = [(BKLibraryBookshelfLibraryBaseViewConfiguration *)self collectionID];
  if ([v2 isEqualToString:kBKCollectionDefaultAll])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Visit the store to add books and audiobooks to your library.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDWantToRead])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"To add to this collection, tap any book or audiobook in the store and select Want to Read.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDFinished])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"As you mark books and audiobooks finished, they’ll be added to this collection.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDBooks])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"All the books you purchase will automatically be added to this collection.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDAudiobooks])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"All the audiobooks you purchase will automatically be added to this collection.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDPDFs])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"PDFs in your library will automatically be added to this collection.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDSamples])
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"To add to this collection, tap any book in the store and select Sample.";
  }
  else if ([v2 isEqualToString:kBKCollectionDefaultIDDownloaded])
  {
    id v6 = +[BCDevice deviceClass];
    if (v6 == (id)3)
    {
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"All the books you download to this iPad will automatically be added to this collection.";
    }
    else if (v6 == (id)2)
    {
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"All the books you download to this iPod touch will automatically be added to this collection.";
    }
    else if (v6 == (id)1)
    {
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"All the books you download to this iPhone will automatically be added to this collection.";
    }
    else
    {
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"All the books you download to this device will automatically be added to this collection.";
    }
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"To add to this collection, choose Add to Collection from a book or audiobook menu.";
  }
  v7 = [v3 localizedStringForKey:v5 value:&stru_100A70340 table:0];

  return (NSString *)v7;
}

- (NSString)readingListButtonText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Collections" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)cloudDownloadImageName
{
  return (NSString *)@"icloud";
}

- (NSString)cloudUploadingImageName
{
  return (NSString *)@"books.icloud.dashed";
}

- (NSString)cloudErrorImageName
{
  return (NSString *)@"exclamationmark.icloud";
}

- (NSString)actionMenuImageName
{
  return (NSString *)@"ellipsis";
}

- (NSString)reviewBackgroundName
{
  return (NSString *)@"ios_collections_finished_review_bg";
}

- (NSString)dragBarName
{
  return (NSString *)@"line.horizontal.3";
}

- (NSString)selectedCheckmarkName
{
  return (NSString *)@"checkmark.circle.fill";
}

- (NSString)unselectedCheckmarkName
{
  return (NSString *)@"circle";
}

- (NSString)infoBarDownloading
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DOWNLOADING…" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarDownloadWaiting
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"WAITING…" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarDownloadPaused
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PAUSED…" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarNew
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"NEW" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarNext
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"NEXT" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarProof
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PROOF" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarPreOrderable
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PRE-ORDER" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarPreOrdered
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PRE-ORDERED" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarSample
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SAMPLE" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoBarBuy
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"BUY" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (NSString)infoExpectedDateString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Expected %@" value:&stru_100A70340 table:0];

  return (NSString *)v3;
}

- (BOOL)supportsReadingListsButton
{
  return 0;
}

- (BOOL)includeCollectionInfo
{
  return 1;
}

- (NSString)viewTitle
{
  return (NSString *)&stru_100A70340;
}

- (NSString)viewDescription
{
  return (NSString *)&stru_100A70340;
}

- (NSArray)sortControlConfig
{
  return 0;
}

- (NSString)infoBarAudiobookImageName
{
  return (NSString *)@"headphones";
}

- (NSString)seriesID
{
  return 0;
}

- (BOOL)hideTopSeparatorLine
{
  return 0;
}

- (BOOL)supplementalContentPDFPicker
{
  return 0;
}

- (NSString)supplementalContentPDFTitle
{
  return (NSString *)&stru_100A70340;
}

- (BOOL)showCancelNavigationBarItem
{
  return 0;
}

- (unint64_t)initialViewMode
{
  return self->_initialViewMode;
}

- (void)setInitialViewMode:(unint64_t)a3
{
  self->_initialViewMode = a3;
}

- (NSString)supplementalContentStorePlaylistID
{
  return self->_supplementalContentStorePlaylistID;
}

- (void)setSupplementalContentStorePlaylistID:(id)a3
{
}

- (BOOL)fromActionMenu
{
  return self->fromActionMenu;
}

- (void)setFromActionMenu:(BOOL)a3
{
  self->fromActionMenu = a3;
}

- (BKCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_collection, 0);

  objc_storeStrong((id *)&self->_supplementalContentStorePlaylistID, 0);
}

@end