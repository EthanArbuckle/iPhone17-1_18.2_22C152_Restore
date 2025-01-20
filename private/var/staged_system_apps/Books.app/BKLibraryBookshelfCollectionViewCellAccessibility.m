@interface BKLibraryBookshelfCollectionViewCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)__accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)shouldInterceptTapsForFKAWorkaround;
- (id)bkaxIndexPathOfTarget;
- (id)bkaxTarget;
- (id)singleTapGestureRecognizer;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)applyLayoutAttributes:(id)a3;
- (void)didReceiveSingleTap;
- (void)prepareForReuse;
- (void)setSingleTapGestureRecognizer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateGestureRecognizerForFKAWorkaround;
@end

@implementation BKLibraryBookshelfCollectionViewCellAccessibility

+ (id)imaxTargetClassName
{
  return @"BKLibraryBookshelfCollectionViewCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)singleTapGestureRecognizer
{
  return (id)___IMAccessibilityGetAssociatedObject(self, &unk_100B4A4E0);
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
}

- (BOOL)accessibilityActivate
{
  v3 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxTarget];
  v4 = [v3 delegate];
  v5 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxIndexPathOfTarget];
  unsigned int v6 = [v4 isAudiobookAtIndexpath:v5];

  if (v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = 1000000000;
  }
  dispatch_time_t v8 = dispatch_time(0, v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AF58;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)&v6 accessibilityElementDidBecomeFocused];
  v3 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxTarget];
  v4 = [v3 delegate];
  v5 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxIndexPathOfTarget];
  [v4 selectItemAtIndexPath:v5 animated:1 scrollPosition:0];
}

- (void)accessibilityElementDidLoseFocus
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)&v6 accessibilityElementDidLoseFocus];
  v3 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxTarget];
  v4 = [v3 delegate];
  v5 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxIndexPathOfTarget];
  [v4 deselectItemAtIndexPath:v5 animated:1];
}

- (BOOL)__accessibilitySupportsActivateAction
{
  return 1;
}

- (void)didReceiveSingleTap
{
  if ([(BKLibraryBookshelfCollectionViewCellAccessibility *)self shouldInterceptTapsForFKAWorkaround])
  {
    if (__IMAccessibilityPerformSafeBlock()) {
      abort();
    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)self updateGestureRecognizerForFKAWorkaround];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)&v3 prepareForReuse];
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)self updateGestureRecognizerForFKAWorkaround];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)&v5 touchesBegan:a3 withEvent:a4];
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)self updateGestureRecognizerForFKAWorkaround];
}

- (void)applyLayoutAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)&v4 applyLayoutAttributes:a3];
  [(BKLibraryBookshelfCollectionViewCellAccessibility *)self updateGestureRecognizerForFKAWorkaround];
}

- (id)bkaxTarget
{
  objc_opt_class();
  v2 = __IMAccessibilityCastAsClass();

  return v2;
}

- (id)bkaxIndexPathOfTarget
{
  objc_super v3 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxTarget];
  objc_super v4 = [v3 delegate];
  objc_super v5 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxTarget];
  objc_super v6 = [v4 indexPathForCell:v5];

  return v6;
}

- (BOOL)shouldInterceptTapsForFKAWorkaround
{
  if (!_AXSFullKeyboardAccessEnabled() || !GSEventIsHardwareKeyboardAttached()) {
    return 0;
  }
  objc_super v3 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self bkaxTarget];
  objc_super v4 = [v3 delegate];
  unsigned __int8 v5 = [v4 allowsOpeningBooks];

  return v5;
}

- (void)updateGestureRecognizerForFKAWorkaround
{
  objc_super v3 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self singleTapGestureRecognizer];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"didReceiveSingleTap"];
    [(BKLibraryBookshelfCollectionViewCellAccessibility *)self setSingleTapGestureRecognizer:v4];

    unsigned __int8 v5 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self singleTapGestureRecognizer];
    [(BKLibraryBookshelfCollectionViewCellAccessibility *)self addGestureRecognizer:v5];
  }
  BOOL v6 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self shouldInterceptTapsForFKAWorkaround];
  id v7 = [(BKLibraryBookshelfCollectionViewCellAccessibility *)self singleTapGestureRecognizer];
  [v7 setEnabled:v6];
}

@end