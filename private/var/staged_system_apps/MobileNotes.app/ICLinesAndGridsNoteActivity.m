@interface ICLinesAndGridsNoteActivity
- (ICLinesAndGridsNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 shouldCreateNewNoteBlock:(id)a6;
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICPaperStyleSheetCollectionViewController)paperStyleViewController;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)shouldCreateNewNoteBlock;
- (void)paperStyleSheetCollectionViewController:(id)a3 didFinishWithPaperStyleType:(unint64_t)a4;
- (void)setEventReporter:(id)a3;
- (void)setNote:(id)a3;
- (void)setPaperStyleViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setShouldCreateNewNoteBlock:(id)a3;
@end

@implementation ICLinesAndGridsNoteActivity

- (ICLinesAndGridsNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 shouldCreateNewNoteBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A570C;
  v21[3] = &unk_1006255C0;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v20.receiver = self;
  v20.super_class = (Class)ICLinesAndGridsNoteActivity;
  v15 = [(ICLinesAndGridsNoteActivity *)&v20 initWithPerformActivity:v21];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_note, a3);
    objc_storeWeak((id *)&v16->_presentingViewController, v12);
    objc_storeStrong((id *)&v16->_eventReporter, a5);
    id v17 = objc_retainBlock(v14);
    id shouldCreateNewNoteBlock = v16->_shouldCreateNewNoteBlock;
    v16->_id shouldCreateNewNoteBlock = v17;
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v16;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"rectangle.split.3x3"];
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Lines & Grids" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.linesAndGrids";
}

- (void)paperStyleSheetCollectionViewController:(id)a3 didFinishWithPaperStyleType:(unint64_t)a4
{
  v6 = [(ICLinesAndGridsNoteActivity *)self note];
  if (!v6)
  {
    v7 = [(ICLinesAndGridsNoteActivity *)self shouldCreateNewNoteBlock];

    if (!v7) {
      goto LABEL_5;
    }
    v6 = [(ICLinesAndGridsNoteActivity *)self shouldCreateNewNoteBlock];
    v8 = v6[2]();
    [(ICLinesAndGridsNoteActivity *)self setNote:v8];
  }
LABEL_5:
  v9 = [(ICLinesAndGridsNoteActivity *)self note];
  uint64_t v10 = (int)[v9 paperStyleType];

  if (v10 != a4)
  {
    id v11 = [(ICLinesAndGridsNoteActivity *)self note];
    [v11 setPaperStyleType:(__int16)a4];

    id v12 = [(ICLinesAndGridsNoteActivity *)self note];
    [v12 updateChangeCountWithReason:@"Changed paper style"];

    id v13 = [(ICLinesAndGridsNoteActivity *)self note];
    id v14 = [v13 managedObjectContext];
    [v14 ic_save];

    v15 = [(ICLinesAndGridsNoteActivity *)self eventReporter];
    v16 = [(ICLinesAndGridsNoteActivity *)self activityType];
    [v15 submitNoteActionMenuEventForNoteEditorWithUsageType:3 activityType:v16];
  }

  [(ICLinesAndGridsNoteActivity *)self activityDidFinish:1];
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

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICPaperStyleSheetCollectionViewController)paperStyleViewController
{
  return self->_paperStyleViewController;
}

- (void)setPaperStyleViewController:(id)a3
{
}

- (id)shouldCreateNewNoteBlock
{
  return self->_shouldCreateNewNoteBlock;
}

- (void)setShouldCreateNewNoteBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldCreateNewNoteBlock, 0);
  objc_storeStrong((id *)&self->_paperStyleViewController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end