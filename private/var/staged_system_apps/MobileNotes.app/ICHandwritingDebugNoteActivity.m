@interface ICHandwritingDebugNoteActivity
- (ICHandwritingDebugNoteActivity)initWithShowHandwritingDebugBlock:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
@end

@implementation ICHandwritingDebugNoteActivity

- (ICHandwritingDebugNoteActivity)initWithShowHandwritingDebugBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICHandwritingDebugNoteActivity;
  return [(ICHandwritingDebugNoteActivity *)&v4 initWithPerformActivity:a3];
}

- (id)activityTitle
{
  return @"Handwriting Debug";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.handwritingDebug";
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"pencil.and.outline"];
}

@end