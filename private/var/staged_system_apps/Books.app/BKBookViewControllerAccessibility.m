@interface BKBookViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (NSArray)bkaxWebDocumentViews;
- (NSString)bkaxLocalizedScrollStatus;
- (_NSRange)bkaxCurrentPages;
- (id)bkaxTarget;
- (int64_t)bkaxPageCount;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSendLayoutChange;
- (void)bkaxDeleteAnnotation:(id)a3;
- (void)bkaxEditNoteForAnnotation:(id)a3;
- (void)bkaxScrub:(id)a3;
- (void)bkaxTurnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)directoryContent:(id)a3 didSelectLocation:(id)a4;
- (void)goToPath:(id)a3 fragment:(id)a4 animated:(BOOL)a5;
- (void)resume:(id)a3;
- (void)scrub:(id)a3;
- (void)showTOC:(id)a3;
- (void)tocViewController:(id)a3 didSelectChapter:(id)a4;
- (void)viewDidLoad;
@end

@implementation BKBookViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKBookViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)bkaxTarget
{
  objc_opt_class();
  v2 = __IMAccessibilityCastAsClass();

  return v2;
}

- (int64_t)bkaxPageCount
{
  v2 = [(BKBookViewControllerAccessibility *)self bkaxTarget];
  id v3 = [v2 pageCountIncludingUpsell];

  return (int64_t)v3;
}

- (NSString)bkaxLocalizedScrollStatus
{
  id v3 = [(BKBookViewControllerAccessibility *)self bkaxTarget];
  v4 = (char *)[v3 currentPages];
  unint64_t v6 = v5;

  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = sub_1000B86A8(@"page.num.of.loading");
  }
  else if (v6 < 2)
  {
    v9 = sub_1000B86A8(@"page.num.of.with.total.single %lu %lu");
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4, [(BKBookViewControllerAccessibility *)self bkaxPageCount]);
  }
  else
  {
    v8 = sub_1000B86A8(@"page.num.of.with.total.spread %lu %lu %lu");
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4, &v4[v6 - 1], [(BKBookViewControllerAccessibility *)self bkaxPageCount]);
  }

  return (NSString *)v7;
}

- (NSArray)bkaxWebDocumentViews
{
  v2 = +[NSMutableArray array];
  char v18 = 0;
  objc_opt_class();
  id v3 = __IMAccessibilityCastAsClass();
  v4 = [v3 view];
  unint64_t v5 = [v4 _accessibleSubviews];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        NSClassFromString(@"UIWebDocumentView");
        if (objc_opt_isKindOfClass()) {
          [v2 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [v2 copy];

  return (NSArray *)v12;
}

- (void)bkaxTurnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
}

- (void)bkaxEditNoteForAnnotation:(id)a3
{
  id v3 = a3;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
}

- (void)bkaxDeleteAnnotation:(id)a3
{
  id v3 = a3;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v3 viewDidLoad];
  [(BKBookViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)showTOC:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v3 showTOC:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)resume:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v3 resume:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_axSendLayoutChange
{
}

- (void)scrub:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(BKBookViewControllerAccessibility *)self bkaxScrub:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)BKBookViewControllerAccessibility;
    [(BKBookViewControllerAccessibility *)&v5 scrub:v4];
  }
}

- (void)bkaxScrub:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = __IMAccessibilityCastAsClass();
  id v6 = [v5 pageNumber];

  if (objc_opt_respondsToSelector()) {
    [(BKBookViewControllerAccessibility *)self bkaxTurnToPageNumber:v6 animated:0];
  }
  [(BKBookViewControllerAccessibility *)self performSelector:"_axSendLayoutChange" withObject:0 afterDelay:0.5];
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BKBookViewControllerAccessibility *)self _axSetAssociatedObject:v6 forKey:@"SelectedChapter"];
  v8.receiver = self;
  v8.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v8 tocViewController:v7 didSelectChapter:v6];
}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v11 directoryContent:a3 didSelectLocation:a4];
  objc_super v5 = [(BKBookViewControllerAccessibility *)self _axAssociatedObjectForKey:@"SelectedChapter"];
  id v6 = +[NSMutableDictionary dictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 name];

    if (v7)
    {
      objc_super v8 = [v5 name];
      [v6 setObject:v8 forKey:@"lineString"];
    }
  }
  UIAccessibilityPostNotification(dword_100B1DA90, v6);
  UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, &stru_100A70340);
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CABEC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)goToPath:(id)a3 fragment:(id)a4 animated:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)BKBookViewControllerAccessibility;
  [(BKBookViewControllerAccessibility *)&v5 goToPath:a3 fragment:a4 animated:a5];
  UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, &stru_100A70340);
}

- (BOOL)accessibilityPerformEscape
{
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
  return 1;
}

- (_NSRange)bkaxCurrentPages
{
  p_bkaxCurrentPages = &self->_bkaxCurrentPages;
  NSUInteger location = self->_bkaxCurrentPages.location;
  NSUInteger length = p_bkaxCurrentPages->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end