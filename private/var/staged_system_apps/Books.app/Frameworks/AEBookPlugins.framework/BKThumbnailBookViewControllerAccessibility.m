@interface BKThumbnailBookViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)bkAccessibilityIsPageBookmarked;
- (BOOL)bkaxBookmarkPage;
- (BOOL)bkaxUnbookmarkPage;
- (id)_audioBarButtonItem;
- (id)_bookmarkBarButtonItem;
- (id)_bookmarkButton;
- (id)_brightnessBarButtonItem;
- (id)_directorySwitchBarButtonItem;
- (id)_editToolboxBarButtonItem;
- (id)_fontBarButtonItem;
- (id)_libraryBarButtonItem;
- (id)_searchBarButtonItem;
- (id)_tocBarButtonItem;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateBookmark;
- (void)contentViewReady:(id)a3;
- (void)scrubValueChanged:(id)a3;
- (void)toggleBookmark:(id)a3;
- (void)updateBookmarkButton;
- (void)viewDidLoad;
@end

@implementation BKThumbnailBookViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKThumbnailBookViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)contentViewReady:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  [(BKThumbnailBookViewControllerAccessibility *)&v3 contentViewReady:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  [(BKThumbnailBookViewControllerAccessibility *)&v4 viewDidLoad];
  objc_super v3 = [(BKThumbnailBookViewControllerAccessibility *)self imaxValueForKey:@"_pageNumberHUD"];
  [v3 setIsAccessibilityElement:0];
}

- (id)_libraryBarButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v5 _libraryBarButtonItem];
  objc_super v3 = AEAXLocString(@"library.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)_editToolboxBarButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v5 _editToolboxBarButtonItem];
  objc_super v3 = AEAXLocString(@"markup.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)_searchBarButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v5 _searchBarButtonItem];
  objc_super v3 = AEAXLocString(@"search.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)_tocBarButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v5 _tocBarButtonItem];
  objc_super v3 = AEAXLocString(@"toc.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)_brightnessBarButtonItem
{
  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v6 _brightnessBarButtonItem];
  objc_super v3 = AEAXLocString(@"brightness.button");
  [v2 setAccessibilityLabel:v3];

  objc_super v4 = AEAXLocString(@"brightness.button.hint");
  [v2 setAccessibilityHint:v4];

  return v2;
}

- (id)_bookmarkBarButtonItem
{
  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v6 _bookmarkBarButtonItem];
  objc_super v3 = AEAXLocString(@"bookmark.button");
  [v2 setAccessibilityLabel:v3];

  unint64_t v4 = (unint64_t)[v2 accessibilityTraits];
  [v2 setAccessibilityTraits:UIAccessibilityTraitButton | v4];

  return v2;
}

- (id)_bookmarkButton
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v5 _bookmarkButton];
  objc_super v3 = AEAXLocString(@"bookmark.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)_fontBarButtonItem
{
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v8 _fontBarButtonItem];
  objc_super v3 = AEAXLocString(@"font.button");
  [v2 setAccessibilityLabel:v3];
  unint64_t v4 = AEAXLocString(@"font.button");
  objc_super v5 = [v2 image];
  [v5 setAccessibilityValue:v4];

  objc_super v6 = AEAXLocString(@"font.button.hint");
  [v2 setAccessibilityHint:v6];

  return v2;
}

- (id)_directorySwitchBarButtonItem
{
  v17.receiver = self;
  v17.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  objc_super v3 = [(BKThumbnailBookViewControllerAccessibility *)&v17 _directorySwitchBarButtonItem];
  unint64_t v4 = [(BKThumbnailBookViewControllerAccessibility *)self imaxValueForKey:@"_directorySwitch"];
  objc_super v5 = [v4 imaxValueForKey:@"_segments"];

  objc_super v6 = [(BKThumbnailBookViewControllerAccessibility *)self imaxValueForKey:@"book"];
  v7 = [v6 imaxValueForKey:@"suppressTOC"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8) {
    id v9 = &dword_0 + 2;
  }
  else {
    id v9 = &dword_0 + 3;
  }
  if (v9 == [v5 count])
  {
    v10 = [v5 firstObject];
    v11 = AEAXLocString(@"grid.view");
    [v10 setAccessibilityLabel:v11];

    if ((v8 & 1) == 0)
    {
      v12 = [v5 objectAtIndex:1];
      v13 = AEAXLocString(@"list.view");
      [v12 setAccessibilityLabel:v13];
    }
    v14 = [v5 lastObject];
    v15 = AEAXLocString(@"bookmark.button");
    [v14 setAccessibilityLabel:v15];
  }

  return v3;
}

- (id)_audioBarButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = [(BKThumbnailBookViewControllerAccessibility *)&v5 _audioBarButtonItem];
  objc_super v3 = AEAXLocString(@"audio.options");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (void)scrubValueChanged:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  [(BKThumbnailBookViewControllerAccessibility *)&v13 scrubValueChanged:v4];
  NSClassFromString(@"BKScrubberControl");
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [v4 imaxValueForKey:@"callout"];
    objc_super v6 = [v5 imaxValueForKey:@"title"];
    v7 = [v6 imaxValueForKey:@"text"];

    unsigned int v8 = [v4 imaxValueForKey:@"callout"];
    id v9 = [v8 imaxValueForKey:@"subtitle"];
    v10 = [v9 imaxValueForKey:@"text"];

    uint64_t v12 = __IMAccessibilityStringForVariablesSentinel;
    v11 = __IMAccessibilityStringForVariables();
    if (objc_msgSend(v11, "length", v7, v12)) {
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v11);
    }
  }
  else if (IMAccessibilityShouldPerformValidationChecks())
  {
    +[NSException raise:@"Accessibility" format:@"sender is not a BKScrubber"];
  }
}

- (void)toggleBookmark:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  [(BKThumbnailBookViewControllerAccessibility *)&v4 toggleBookmark:a3];
  [(BKThumbnailBookViewControllerAccessibility *)self _updateBookmark];
}

- (BOOL)bkaxUnbookmarkPage
{
  BOOL v3 = [(BKThumbnailBookViewControllerAccessibility *)self bkAccessibilityIsPageBookmarked];
  if (v3)
  {
    [(BKThumbnailBookViewControllerAccessibility *)self toggleBookmark:0];
    UIAccessibilityNotifications v4 = UIAccessibilityAnnouncementNotification;
    objc_super v5 = AEAXLocString(@"page.unbookmarked");
    UIAccessibilityPostNotification(v4, v5);
  }
  return v3;
}

- (BOOL)bkaxBookmarkPage
{
  unsigned __int8 v3 = [(BKThumbnailBookViewControllerAccessibility *)self bkAccessibilityIsPageBookmarked];
  if ((v3 & 1) == 0)
  {
    [(BKThumbnailBookViewControllerAccessibility *)self toggleBookmark:0];
    UIAccessibilityNotifications v4 = UIAccessibilityAnnouncementNotification;
    objc_super v5 = AEAXLocString(@"page.bookmarked");
    UIAccessibilityPostNotification(v4, v5);
  }
  return v3 ^ 1;
}

- (void)updateBookmarkButton
{
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  [(BKThumbnailBookViewControllerAccessibility *)&v3 updateBookmarkButton];
  [(BKThumbnailBookViewControllerAccessibility *)self _updateBookmark];
}

- (void)_updateBookmark
{
  if ([(BKThumbnailBookViewControllerAccessibility *)self bkAccessibilityIsPageBookmarked])
  {
    objc_super v3 = @"bookmark.button.on";
  }
  else
  {
    objc_super v3 = @"bookmark.button.off";
  }
  UIAccessibilityNotifications v4 = AEAXLocString(v3);
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  objc_super v5 = [(BKThumbnailBookViewControllerAccessibility *)&v8 _bookmarkButton];
  [v5 setAccessibilityValue:v4];
  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  objc_super v6 = [(BKThumbnailBookViewControllerAccessibility *)&v7 _bookmarkBarButtonItem];
  [v6 setAccessibilityValue:v4];
}

- (BOOL)bkAccessibilityIsPageBookmarked
{
  return [(BKThumbnailBookViewControllerAccessibility *)self imaxBoolValueForKey:@"isPageBookmarked"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(BKThumbnailBookViewControllerAccessibility *)self _libraryBarButtonItem];
  id v4 = [(BKThumbnailBookViewControllerAccessibility *)self _tocBarButtonItem];
  id v5 = [(BKThumbnailBookViewControllerAccessibility *)self _directorySwitchBarButtonItem];
  id v6 = [(BKThumbnailBookViewControllerAccessibility *)self _brightnessBarButtonItem];
  id v7 = [(BKThumbnailBookViewControllerAccessibility *)self _editToolboxBarButtonItem];
  id v8 = [(BKThumbnailBookViewControllerAccessibility *)self _audioBarButtonItem];
  id v9 = [(BKThumbnailBookViewControllerAccessibility *)self _searchBarButtonItem];
  id v10 = [(BKThumbnailBookViewControllerAccessibility *)self _bookmarkBarButtonItem];
  id v11 = [(BKThumbnailBookViewControllerAccessibility *)self _bookmarkButton];
  id v12 = [(BKThumbnailBookViewControllerAccessibility *)self _fontBarButtonItem];

  [(BKThumbnailBookViewControllerAccessibility *)self _updateBookmark];
}

@end