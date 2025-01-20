@interface ICFindInNoteUIActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICFindInNoteUIActivity)initWithDelegate:(id)a3;
- (ICFindInNoteUIActivityDelegate)delegate;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)activityCategory;
- (void)performActivity;
- (void)setDelegate:(id)a3;
@end

@implementation ICFindInNoteUIActivity

- (ICFindInNoteUIActivity)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICFindInNoteUIActivity;
  v5 = [(UIActivity *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.findInNote";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Find in Note" value:&stru_26C10E100 table:0];

  return v3;
}

- (int64_t)activityCategory
{
  return 0;
}

- (id)_systemImageName
{
  return @"magnifyingglass";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  uint64_t v3 = [(ICFindInNoteUIActivity *)self delegate];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(ICFindInNoteUIActivity *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(ICFindInNoteUIActivity *)self delegate];
      [v7 performFindInNoteUIActivity:self];
    }
  }
}

- (ICFindInNoteUIActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICFindInNoteUIActivityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end