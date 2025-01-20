@interface ICPinNoteActivity
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICPinNoteActivity)initWithNote:(id)a3 eventReporter:(id)a4;
- (id)activityImage;
- (id)activityTintColor;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setNote:(id)a3;
@end

@implementation ICPinNoteActivity

- (ICPinNoteActivity)initWithNote:(id)a3 eventReporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPinNoteActivity;
  v9 = [(ICPinNoteActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_eventReporter, a4);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = [(ICPinNoteActivity *)self note];
  unsigned int v3 = [v2 isPinned];
  v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Unpin";
  }
  else {
    CFStringRef v6 = @"Pin";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

  return v7;
}

- (id)activityImage
{
  v2 = [(ICPinNoteActivity *)self note];
  unsigned int v3 = [v2 isPinned];
  v4 = @"pin.fill";
  if (v3) {
    v4 = @"pin.slash.fill";
  }
  v5 = v4;

  CFStringRef v6 = +[UIImage systemImageNamed:v5];

  return v6;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.pinNote";
}

- (void)performActivityWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void *))a3;
  objc_initWeak(&location, self);
  v5 = [(ICPinNoteActivity *)self note];
  CFStringRef v6 = [v5 managedObjectContext];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = sub_10011B5B0;
  v13 = &unk_100625938;
  objc_copyWeak(&v14, &location);
  [v6 performBlockAndWait:&v10];

  id v7 = [(ICPinNoteActivity *)self eventReporter];
  id v8 = [(ICPinNoteActivity *)self note];
  [v7 submitNotePinEventForModernNote:v8 contextPath:1];

  [(ICPinNoteActivity *)self activityDidFinish:1];
  if (v4)
  {
    v9 = [(ICPinNoteActivity *)self activityType];
    v4[2](v4, 1, v9);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)activityTintColor
{
  return +[UIColor systemOrangeColor];
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
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
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end