@interface ICFindInNoteActivity
- (ICFindInNoteActivity)initWithFindInNoteBlock:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
@end

@implementation ICFindInNoteActivity

- (ICFindInNoteActivity)initWithFindInNoteBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICFindInNoteActivity;
  return [(ICFindInNoteActivity *)&v4 initWithPerformActivity:a3];
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"magnifyingglass"];
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Find in Note" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.findInNote";
}

@end