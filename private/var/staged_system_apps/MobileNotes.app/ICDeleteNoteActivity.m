@interface ICDeleteNoteActivity
- (ICDeleteNoteActivity)initWithDeleteBlock:(id)a3;
- (id)activityImage;
- (id)activityTintColor;
- (id)activityTitle;
- (id)activityType;
@end

@implementation ICDeleteNoteActivity

- (ICDeleteNoteActivity)initWithDeleteBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICDeleteNoteActivity;
  return [(ICDeleteNoteActivity *)&v4 initWithPerformActivity:a3];
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Delete" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.deleteNote";
}

- (id)activityTintColor
{
  return +[UIColor systemRedColor];
}

@end