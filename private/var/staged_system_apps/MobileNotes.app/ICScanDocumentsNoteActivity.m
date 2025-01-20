@interface ICScanDocumentsNoteActivity
- (ICScanDocumentsNoteActivity)initWithScanDocumentsBlock:(id)a3;
- (id)activityImage;
- (id)activityTintColor;
- (id)activityTitle;
- (id)activityType;
@end

@implementation ICScanDocumentsNoteActivity

- (ICScanDocumentsNoteActivity)initWithScanDocumentsBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICScanDocumentsNoteActivity;
  return [(ICScanDocumentsNoteActivity *)&v4 initWithPerformActivity:a3];
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"doc.viewfinder"];
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Scan" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.scanDocuments";
}

- (id)activityTintColor
{
  return +[UIColor systemBlueColor];
}

@end