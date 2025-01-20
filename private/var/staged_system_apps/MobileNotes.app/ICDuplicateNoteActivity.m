@interface ICDuplicateNoteActivity
- (ICDuplicateNoteActivity)initWithNote:(id)a3;
- (ICNote)note;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setNote:(id)a3;
@end

@implementation ICDuplicateNoteActivity

- (ICDuplicateNoteActivity)initWithNote:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDuplicateNoteActivity;
  v6 = [(ICDuplicateNoteActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_note, a3);
  }

  return v7;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"doc.on.doc"];
}

- (id)activityTitle
{
  return @"Duplicate";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.duplicateNote";
}

- (void)performActivityWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void *))a3;
  id v5 = [(ICDuplicateNoteActivity *)self note];
  objc_super v9 = v5;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = +[ICNote undoablyDuplicateNotes:v6];

  [(ICDuplicateNoteActivity *)self activityDidFinish:1];
  if (v4)
  {
    v8 = [(ICDuplicateNoteActivity *)self activityType];
    v4[2](v4, 1, v8);
  }
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
}

@end