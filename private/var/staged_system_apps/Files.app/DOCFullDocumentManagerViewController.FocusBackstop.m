@interface DOCFullDocumentManagerViewController.FocusBackstop
- (BOOL)canBecomeFocused;
- (_TtCE5FilesCSo36DOCFullDocumentManagerViewControllerP33_6DB6B51135FB5D224397F02A0ADB066D13FocusBackstop)initWithCoder:(id)a3;
- (_TtCE5FilesCSo36DOCFullDocumentManagerViewControllerP33_6DB6B51135FB5D224397F02A0ADB066D13FocusBackstop)initWithFrame:(CGRect)a3;
@end

@implementation DOCFullDocumentManagerViewController.FocusBackstop

- (_TtCE5FilesCSo36DOCFullDocumentManagerViewControllerP33_6DB6B51135FB5D224397F02A0ADB066D13FocusBackstop)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s13FocusBackstopCMa();
  return -[DOCFullDocumentManagerViewController.FocusBackstop initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_TtCE5FilesCSo36DOCFullDocumentManagerViewControllerP33_6DB6B51135FB5D224397F02A0ADB066D13FocusBackstop)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s13FocusBackstopCMa();
  return [(DOCFullDocumentManagerViewController.FocusBackstop *)&v5 initWithCoder:a3];
}

@end