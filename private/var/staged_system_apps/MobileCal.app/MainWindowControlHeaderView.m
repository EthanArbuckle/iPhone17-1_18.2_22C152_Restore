@interface MainWindowControlHeaderView
+ (CGImage)imageForString:(id)a3 atRect:(CGRect)a4 withSize:(CGSize)a5;
+ (CGImage)maskImageForImage:(id)a3 atPoint:(CGPoint)a4 withSize:(CGSize)a5;
+ (double)spacerWidthForWindowWidth:(double)a3;
+ (id)badgedCalendarIcon:(BOOL)a3;
+ (id)inboxImageForCount:(unint64_t)a3 selected:(BOOL)a4;
+ (id)spacer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MainWindowControlHeaderDelegate)delegate;
- (MainWindowControlHeaderView)initWithFrame:(CGRect)a3;
- (id)customBadgedButtonWithImage:(id)a3 action:(SEL)a4;
- (id)newEventBarButtonItem;
- (void)calendarButtonTapped;
- (void)inboxButtonTapped;
- (void)layoutForWidth:(double)a3;
- (void)listButtonTapped;
- (void)newEventButtonTapped;
- (void)setDelegate:(id)a3;
- (void)updateButtonStateForSidebar:(unint64_t)a3;
- (void)updateErrorState:(BOOL)a3;
- (void)updateInboxCount:(unint64_t)a3;
- (void)updateToolbarItems;
@end

@implementation MainWindowControlHeaderView

+ (id)inboxImageForCount:(unint64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:17.0];
  v8 = +[UIImage systemImageNamed:@"tray" withConfiguration:v7];
  v9 = [v8 imageFlippedForRightToLeftLayoutDirection];

  if (a3)
  {
    if (qword_100216720 != -1) {
      dispatch_once(&qword_100216720, &stru_1001D3C88);
    }
    if (a3 <= 0x63)
    {
      CFStringRef v12 = @"unselected";
      if (v4) {
        CFStringRef v12 = @"selected";
      }
      v10 = +[NSString stringWithFormat:@"%tu-%@", a3, v12];
    }
    else
    {
      v10 = @"over-max";
    }
    id v11 = [(id)qword_100216718 objectForKey:v10];
    if (!v11)
    {
      if (a3 >= 0x63) {
        unint64_t v13 = 99;
      }
      else {
        unint64_t v13 = a3;
      }
      v14 = +[NSNumber numberWithUnsignedInteger:v13];
      v15 = +[NSNumberFormatter localizedStringFromNumber:v14 numberStyle:1];

      v70 = v15;
      id v71 = a1;
      if (a3 <= 0x63)
      {
        id v18 = v15;
        double v19 = 0.0;
      }
      else
      {
        v16 = +[NSBundle mainBundle];
        v17 = [v16 localizedStringForKey:@"%@+" value:&stru_1001D6918 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v15);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        double v19 = 1.0;
      }
      double v72 = v19;
      id v20 = objc_alloc_init((Class)NSMutableParagraphStyle);
      [v20 setAlignment:1];
      id v21 = objc_alloc((Class)NSAttributedString);
      v75[0] = NSFontAttributeName;
      v22 = +[UIFont systemFontOfSize:8.0 weight:UIFontWeightSemibold];
      v76[0] = v22;
      v76[1] = v20;
      v68 = v20;
      v75[1] = NSParagraphStyleAttributeName;
      v75[2] = NSForegroundColorAttributeName;
      v23 = +[UIColor blackColor];
      v76[2] = v23;
      v24 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:3];
      v69 = v18;
      id v25 = [v21 initWithString:v18 attributes:v24];

      [v25 size];
      double v27 = ceil(v26 + 4.0);
      double v29 = ceil(v28 + 4.0);
      if (v28 <= v26) {
        double v30 = v27;
      }
      else {
        double v30 = v29;
      }
      [v9 size];
      double v32 = v31;
      double v34 = v33;
      double v35 = v31 + 6.0;
      double v36 = v27 * 0.5;
      double v37 = v33 + v27 * 0.5 + 2.0 + 2.0 + 2.0;
      v79.origin.x = 1.0;
      v79.origin.y = v27 * 0.5;
      v79.size.width = v32;
      v79.size.height = v34;
      double v74 = v30;
      double v38 = CGRectGetMaxX(v79) - v30 + 2.0;
      int IsLeftToRight = CalInterfaceIsLeftToRight();
      if (IsLeftToRight) {
        double v40 = 1.0;
      }
      else {
        double v40 = 3.0;
      }
      if (!IsLeftToRight) {
        double v38 = v72;
      }
      double v66 = v37;
      double v67 = v35;
      v78.width = v35;
      v78.height = v37;
      UIGraphicsBeginImageContextWithOptions(v78, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      double v42 = v38;
      double v73 = v27;
      if (!v4)
      {
        int v43 = CalInterfaceIsLeftToRight();
        double v44 = -1.0;
        if (!v43) {
          double v44 = 1.0;
        }
        double v42 = v38 + v44;
        double v27 = v27 + 1.5;
      }
      double v65 = v38;
      v45 = &objc_retain_x2_ptr;
      v46 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v42, 0.0, v74, v27, v36);
      CGContextSaveGState(CurrentContext);
      if (v4) {
        double v47 = v40 + -1.0;
      }
      else {
        double v47 = v40;
      }
      if (v4) {
        double v48 = v36 + -2.0;
      }
      else {
        double v48 = v36;
      }
      if (v4) {
        double v49 = v32 + 2.0;
      }
      else {
        double v49 = v32;
      }
      if (v4) {
        double v50 = v34 + 4.0;
      }
      else {
        double v50 = v34;
      }
      CGContextBeginPath(CurrentContext);
      v80.origin.x = v47;
      v80.origin.y = v48;
      v80.size.width = v49;
      v80.size.height = v50;
      CGContextAddRect(CurrentContext, v80);
      id v51 = v46;
      CGContextAddPath(CurrentContext, (CGPathRef)[v51 CGPath]);
      CGContextEOClip(CurrentContext);
      if (v4)
      {
        double v53 = v66;
        double v52 = v67;
        v54 = [v71 maskImageForImage:v9 atPoint:v40 withSize:v36];
        v81.origin.x = 0.0;
        v81.origin.y = 0.0;
        v81.size.width = v67;
        v81.size.height = v66;
        CGContextClipToMask(CurrentContext, v81, v54);
        CGImageRelease(v54);
        v55 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v47, v48, v49, v50, 4.0);
        v56 = +[UIColor blackColor];
        [v56 set];

        v45 = &objc_retain_x2_ptr;
        [v55 fill];

        v57 = v71;
      }
      else
      {
        [v9 drawInRect:v40, v36, v32, v34];
        v57 = v71;
        double v53 = v66;
        double v52 = v67;
      }
      CGContextRestoreGState(CurrentContext);
      double v58 = 0.0;
      v59 = [v45[465] bezierPathWithRoundedRect:v65 cornerRadius:0.0 v74 v73 v36];
      v60 = [v57 imageForString:v25 atRect:v65 withSize:2.0, v74, v73 + -4.0, v52, v53];
      if (a3 >= 0x64)
      {
        CalOnePixelInPoints();
        double v58 = v61 + 0.0;
      }
      v82.origin.y = 0.0;
      v82.origin.x = v58;
      v82.size.width = v52;
      v82.size.height = v53;
      CGContextClipToMask(CurrentContext, v82, v60);
      v62 = +[UIColor blackColor];
      [v62 set];

      [v59 fill];
      v63 = UIGraphicsGetImageFromCurrentImageContext();
      id v11 = [v63 imageWithRenderingMode:2];

      UIGraphicsEndImageContext();
      CGImageRelease(v60);
      [(id)qword_100216718 setObject:v11 forKey:v10];
    }
  }
  else
  {
    id v11 = v9;
  }

  return v11;
}

- (void)layoutForWidth:(double)a3
{
  +[MainWindowControlHeaderView spacerWidthForWindowWidth:a3];
  double v5 = v4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_spacers;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setWidth:v5];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)updateToolbarItems
{
  if (self->_hasError) {
    v3 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
  }
  else {
    v3 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
  }
  uint64_t v4 = -[NSArray objectAtIndexedSubscript:](self->_spacers, "objectAtIndexedSubscript:", 0, *(Class *)((char *)&self->super.super.super.isa + *v3));
  double v5 = (void *)v4;
  if (self->_inboxCount) {
    v6 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
  }
  else {
    v6 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
  }
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa + *v6);
  v13[1] = v4;
  v13[2] = v7;
  id v8 = [(NSArray *)self->_spacers objectAtIndexedSubscript:1];
  listViewBarButton = self->_listViewBarButton;
  v13[3] = v8;
  v13[4] = listViewBarButton;
  v10 = [(NSArray *)self->_spacers objectAtIndexedSubscript:2];
  newEventBarButton = self->_newEventBarButton;
  v13[5] = v10;
  v13[6] = newEventBarButton;
  long long v12 = +[NSArray arrayWithObjects:v13 count:7];
  [(UIToolbar *)self->_toolbar setItems:v12];
}

- (MainWindowControlHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)MainWindowControlHeaderView;
  uint64_t v7 = -[MainWindowControlHeaderView initWithFrame:](&v36, "initWithFrame:");
  if (v7)
  {
    id v8 = [objc_alloc((Class)UIToolbar) initWithFrame:x, y, width, height];
    toolbar = v7->_toolbar;
    v7->_toolbar = v8;

    [(UIToolbar *)v7->_toolbar setAutoresizingMask:18];
    id v10 = objc_alloc_init((Class)UIView);
    [(UIToolbar *)v7->_toolbar _setBackgroundView:v10];

    long long v11 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:17.0];
    id v12 = objc_alloc((Class)UIBarButtonItem);
    long long v13 = +[UIImage systemImageNamed:@"calendar" withConfiguration:v11];
    long long v14 = [v13 imageFlippedForRightToLeftLayoutDirection];
    v15 = (UIBarButtonItem *)[v12 initWithImage:v14 style:0 target:v7 action:"calendarButtonTapped"];
    calendarBarButton = v7->_calendarBarButton;
    v7->_calendarBarButton = v15;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](v7->_calendarBarButton, "_setAdditionalSelectionInsets:", 5.0, 2.5, 5.5, 2.5);
    [(UIBarButtonItem *)v7->_calendarBarButton setAccessibilityIdentifier:@"calendars-button"];
    id v17 = objc_alloc((Class)UIBarButtonItem);
    id v18 = +[MainWindowControlHeaderView inboxImageForCount:0 selected:0];
    double v19 = (UIBarButtonItem *)[v17 initWithImage:v18 style:0 target:v7 action:"inboxButtonTapped"];
    inboxBarButton = v7->_inboxBarButton;
    v7->_inboxBarButton = v19;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](v7->_inboxBarButton, "_setAdditionalSelectionInsets:", 4.0, 3.0, 5.0, 3.0);
    [(UIBarButtonItem *)v7->_inboxBarButton setAccessibilityIdentifier:@"inbox-button"];
    id v21 = objc_alloc((Class)UIBarButtonItem);
    v22 = +[UIImage systemImageNamed:@"list.bullet" withConfiguration:v11];
    v23 = [v22 imageFlippedForRightToLeftLayoutDirection];
    v24 = (UIBarButtonItem *)[v21 initWithImage:v23 style:0 target:v7 action:"listButtonTapped"];
    listViewBarButton = v7->_listViewBarButton;
    v7->_listViewBarButton = v24;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](v7->_listViewBarButton, "_setAdditionalSelectionInsets:", 3.0, 2.5, 3.0, 2.5);
    [(UIBarButtonItem *)v7->_listViewBarButton setAccessibilityIdentifier:@"listview-button"];
    id v26 = objc_alloc((Class)UIBarButtonItem);
    double v27 = +[UIImage systemImageNamed:@"plus" withConfiguration:v11];
    double v28 = (UIBarButtonItem *)[v26 initWithImage:v27 style:0 target:v7 action:"newEventButtonTapped"];
    newEventBarButton = v7->_newEventBarButton;
    v7->_newEventBarButton = v28;

    [(UIBarButtonItem *)v7->_newEventBarButton setAccessibilityIdentifier:@"addevent-button"];
    double v30 = +[MainWindowControlHeaderView spacer];
    double v31 = +[MainWindowControlHeaderView spacer];
    double v32 = +[MainWindowControlHeaderView spacer];
    v37[0] = v30;
    v37[1] = v31;
    v37[2] = v32;
    uint64_t v33 = +[NSArray arrayWithObjects:v37 count:3];
    spacers = v7->_spacers;
    v7->_spacers = (NSArray *)v33;

    [(MainWindowControlHeaderView *)v7 updateToolbarItems];
    [(MainWindowControlHeaderView *)v7 addSubview:v7->_toolbar];
  }
  return v7;
}

+ (id)spacer
{
  id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 primaryAction:0];
  [v2 setWidth:15.0];

  return v2;
}

- (void)updateInboxCount:(unint64_t)a3
{
  unint64_t inboxCount = self->_inboxCount;
  if (inboxCount != a3)
  {
    if (inboxCount) {
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
    }
    else {
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
    }
    double v19 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v6);
    if (a3) {
      uint64_t v7 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
    }
    else {
      uint64_t v7 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
    }
    id v8 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v7);
    self->_unint64_t inboxCount = a3;
    uint64_t v9 = self->_inboxBarButton;
    if (self->_inboxCount)
    {
      badgedInboxBarButton = self->_badgedInboxBarButton;
      if (!badgedInboxBarButton)
      {
        id v11 = objc_alloc((Class)UIBarButtonItem);
        id v12 = [(UIBarButtonItem *)self->_inboxBarButton image];
        long long v13 = [(MainWindowControlHeaderView *)self customBadgedButtonWithImage:v12 action:"inboxButtonTapped"];
        long long v14 = (UIBarButtonItem *)[v11 initWithCustomView:v13];
        v15 = self->_badgedInboxBarButton;
        self->_badgedInboxBarButton = v14;

        badgedInboxBarButton = self->_badgedInboxBarButton;
      }
      v16 = badgedInboxBarButton;

      uint64_t v9 = v16;
    }
    id v17 = +[MainWindowControlHeaderView inboxImageForCount:a3 selected:self->_inboxSelected];
    if (v9 == self->_inboxBarButton)
    {
      [(UIBarButtonItem *)v9 setImage:v17];
    }
    else
    {
      id v18 = [(UIBarButtonItem *)v9 customView];
      [v18 setImage:v17 forState:0];
    }
    [(MainWindowControlHeaderView *)self updateToolbarItems];
    if (v19 != v8 && v8 == self->_inboxBarButton) {
      [(UIBarButtonItem *)v8 setSelected:self->_inboxSelected];
    }
  }
}

- (void)updateErrorState:(BOOL)a3
{
  if (self->_hasError != a3)
  {
    BOOL v3 = a3;
    if (self->_hasError) {
      double v5 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
    }
    else {
      double v5 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
    }
    long long v13 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v5);
    if (v3) {
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
    }
    else {
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
    }
    uint64_t v7 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v6);
    self->_hasError = v3;
    if (v3 && !self->_badgedCalendarBarButton)
    {
      id v8 = objc_alloc((Class)UIBarButtonItem);
      uint64_t v9 = +[MainWindowControlHeaderView badgedCalendarIcon:self->_calendarSelected];
      id v10 = [(MainWindowControlHeaderView *)self customBadgedButtonWithImage:v9 action:"calendarButtonTapped"];
      id v11 = (UIBarButtonItem *)[v8 initWithCustomView:v10];
      badgedCalendarBarButton = self->_badgedCalendarBarButton;
      self->_badgedCalendarBarButton = v11;
    }
    [(MainWindowControlHeaderView *)self updateToolbarItems];
    if (v13 != v7 && v7 == self->_calendarBarButton) {
      [(UIBarButtonItem *)v7 setSelected:self->_calendarSelected];
    }
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MainWindowControlHeaderDelegate *)a3;
}

- (id)newEventBarButtonItem
{
  return self->_newEventBarButton;
}

+ (double)spacerWidthForWindowWidth:(double)a3
{
  +[MainWindowRootViewController minimumStandardWindowWidth];
  BOOL v5 = v4 <= a3;
  double result = 15.0;
  if (!v5) {
    return 5.0;
  }
  return result;
}

+ (CGImage)imageForString:(id)a3 atRect:(CGRect)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = +[UIScreen mainScreen];
  [v12 scale];
  double v14 = v13;

  size_t v15 = vcvtpd_u64_f64(width * v14);
  size_t v16 = vcvtpd_u64_f64(height * v14);
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  double v19 = CGBitmapContextCreate(0, v15, v16, 8uLL, AlignedBytesPerRow, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  if (v19)
  {
    UIGraphicsPushContext(v19);
    v24.size.double width = (double)v15;
    v24.size.double height = (double)v16;
    v24.origin.double x = 0.0;
    v24.origin.double y = 0.0;
    CGContextClearRect(v19, v24);
    CGContextScaleCTM(v19, v14, v14);
    CGContextGetCTM(&v23, v19);
    CGContextSetBaseCTM();
    id v20 = +[UIColor whiteColor];
    CGContextSetFillColorWithColor(v19, (CGColorRef)[v20 CGColor]);

    v25.origin.double x = 0.0;
    v25.origin.double y = 0.0;
    v25.size.double width = width;
    v25.size.double height = height;
    CGContextFillRect(v19, v25);
    [v11 drawInRect:x, y, v8, v7];
    Image = CGBitmapContextCreateImage(v19);
    UIGraphicsPopContext();
    CGContextRelease(v19);
  }
  else
  {
    Image = 0;
  }

  return Image;
}

+ (CGImage)maskImageForImage:(id)a3 atPoint:(CGPoint)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = +[UIScreen mainScreen];
  [v10 scale];
  double v12 = v11;

  size_t v13 = vcvtpd_u64_f64(width * v12);
  size_t v14 = vcvtpd_u64_f64(height * v12);
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  id v17 = CGBitmapContextCreate(0, v13, v14, 8uLL, AlignedBytesPerRow, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  if (v17)
  {
    UIGraphicsPushContext(v17);
    v22.size.double width = (double)v13;
    v22.size.double height = (double)v14;
    v22.origin.double x = 0.0;
    v22.origin.double y = 0.0;
    CGContextClearRect(v17, v22);
    CGContextScaleCTM(v17, v12, v12);
    CGContextGetCTM(&v21, v17);
    CGContextSetBaseCTM();
    id v18 = +[UIColor whiteColor];
    CGContextSetFillColorWithColor(v17, (CGColorRef)[v18 CGColor]);

    v23.origin.double x = 0.0;
    v23.origin.double y = 0.0;
    v23.size.double width = width;
    v23.size.double height = height;
    CGContextFillRect(v17, v23);
    [v9 drawAtPoint:x, y];
    Image = CGBitmapContextCreateImage(v17);
    UIGraphicsPopContext();
    CGContextRelease(v17);
  }
  else
  {
    Image = 0;
  }

  return Image;
}

+ (id)badgedCalendarIcon:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (id *)&unk_100216728;
  if (a3) {
    BOOL v5 = (id *)&unk_100216730;
  }
  id v6 = *v5;
  if (!v6)
  {
    double v7 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:17.0];
    double v8 = +[UIImage systemImageNamed:@"calendar.badge.exclamationmark" withConfiguration:v7];
    id v9 = [v8 imageFlippedForRightToLeftLayoutDirection];

    int IsLeftToRight = CalInterfaceIsLeftToRight();
    double v11 = 0.0;
    if (IsLeftToRight) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
    [v9 size];
    double v14 = v13 + 1.0;
    double v16 = v15 + 2.0;
    if (!CalInterfaceIsLeftToRight()) {
      double v14 = v14 + 1.0;
    }
    v43.double width = v14;
    v43.double height = v16;
    UIGraphicsBeginImageContextWithOptions(v43, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    if (v3)
    {
      id v18 = CurrentContext;
      if (IsLeftToRight) {
        double v19 = 0.0;
      }
      else {
        double v19 = 1.0;
      }
      CGContextSaveGState(CurrentContext);
      id v20 = +[UIImage systemImageNamed:@"calendar" withConfiguration:v7];
      CGAffineTransform v21 = [v20 imageFlippedForRightToLeftLayoutDirection];

      [v21 size];
      double v41 = v19 + v12 + v22;
      [v21 size];
      double v24 = v23 + 1.0 + 1.0;
      [v9 size];
      double v26 = v12 + v25 + -13.0 + -0.5;
      [v9 size];
      double v28 = v27 + 1.0 + -13.0 + -2.0;
      int v29 = CalInterfaceIsLeftToRight();
      double v30 = v12 + 0.5;
      if (v29) {
        double v30 = v26;
      }
      else {
        double v11 = 3.75;
      }
      double v31 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v30, v28, 13.0, 13.0, 7.0);
      CGContextBeginPath(v18);
      v44.origin.double y = 0.0;
      v44.origin.double x = v11;
      v44.size.double width = v41;
      v44.size.double height = v24;
      CGContextAddRect(v18, v44);
      id v32 = v31;
      CGContextAddPath(v18, (CGPathRef)[v32 CGPath]);
      CGContextEOClip(v18);
      if (CalInterfaceIsLeftToRight()) {
        double v33 = v12;
      }
      else {
        double v33 = 3.75;
      }
      double v34 = [a1 maskImageForImage:v21 atPoint:v33 withSize:1.0 v14, v16];
      v45.origin.double x = 0.0;
      v45.origin.double y = 0.0;
      v45.size.double width = v14;
      v45.size.double height = v16;
      CGContextClipToMask(v18, v45, v34);
      CGImageRelease(v34);
      double v35 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, 0.0, v41, v24, 4.0);
      objc_super v36 = +[UIColor blackColor];
      [v36 set];

      [v35 fill];
      CGContextRestoreGState(v18);
      CGContextBeginPath(v18);
      id v37 = v32;
      CGContextAddPath(v18, (CGPathRef)[v37 CGPath]);
      CGContextClip(v18);
      [v9 drawAtPoint:v12];

      double v38 = (id *)&unk_100216730;
    }
    else
    {
      [v9 drawAtPoint:v12];
      double v38 = (id *)&unk_100216728;
    }
    v39 = UIGraphicsGetImageFromCurrentImageContext();
    id v6 = [v39 imageWithRenderingMode:2];

    UIGraphicsEndImageContext();
    objc_storeStrong(v38, v6);
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)updateButtonStateForSidebar:(unint64_t)a3
{
  if (self->_hasError) {
    BOOL v5 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
  }
  else {
    BOOL v5 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
  }
  id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
  if (self->_inboxCount) {
    double v7 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
  }
  else {
    double v7 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
  }
  id v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  v17[0] = v6;
  v17[1] = v8;
  v17[2] = self->_listViewBarButton;
  id v9 = +[NSArray arrayWithObjects:v17 count:3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009DDA4;
  v12[3] = &unk_1001D3CB0;
  id v13 = v8;
  double v14 = self;
  id v15 = v6;
  unint64_t v16 = a3;
  id v10 = v6;
  id v11 = v8;
  [v9 enumerateObjectsUsingBlock:v12];
}

- (id)customBadgedButtonWithImage:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  double v7 = +[UIButton buttonWithType:1];
  [v7 setImage:v6 forState:0];

  [v7 addTarget:self action:a4 forControlEvents:64];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009E13C;
  v9[3] = &unk_1001D3CD8;
  v9[4] = self;
  [v7 setPointerStyleProvider:v9];

  return v7;
}

- (void)calendarButtonTapped
{
}

- (void)inboxButtonTapped
{
}

- (void)listButtonTapped
{
}

- (void)newEventButtonTapped
{
}

- (MainWindowControlHeaderDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spacers, 0);
  objc_storeStrong((id *)&self->_newEventBarButton, 0);
  objc_storeStrong((id *)&self->_listViewBarButton, 0);
  objc_storeStrong((id *)&self->_badgedInboxBarButton, 0);
  objc_storeStrong((id *)&self->_inboxBarButton, 0);
  objc_storeStrong((id *)&self->_badgedCalendarBarButton, 0);
  objc_storeStrong((id *)&self->_calendarBarButton, 0);

  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end