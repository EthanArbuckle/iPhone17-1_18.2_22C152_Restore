@interface ICSetQuickNoteActivity
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
@end

@implementation ICSetQuickNoteActivity

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"hare"];
}

- (id)activityTitle
{
  return @"Set As QuickNote";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.setQuickNote";
}

- (void)performActivityWithCompletion:(id)a3
{
  v6 = (void (**)(id, uint64_t, void *))a3;
  v4 = +[ICQuickNoteSessionManager sharedManager];
  [v4 saveSession];

  [(ICSetQuickNoteActivity *)self activityDidFinish:1];
  if (v6)
  {
    v5 = [(ICSetQuickNoteActivity *)self activityType];
    v6[2](v6, 1, v5);
  }
}

@end