@interface ICNoteDateFormatterController
- (BOOL)didManuallyChangeDateType;
- (BOOL)iconHidden;
- (BOOL)shouldShowDateModified;
- (BOOL)shouldShowSharedNoteTitle;
- (BOOL)showAlternateDateView;
- (ICNote)note;
- (ICNoteDateFormatterController)init;
- (ICNoteDateFormatterControllerDelegate)delegate;
- (NSDate)date;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)shortDateFormatter;
- (id)dateStringForDate:(id)a3 dateFormatter:(id)a4;
- (int64_t)currentSortType;
- (void)dealloc;
- (void)noteDecryptedStatusDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentSortType:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidManuallyChangeDateType:(BOOL)a3;
- (void)setIconHidden:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setShortDateFormatter:(id)a3;
- (void)setShouldShowSharedNoteTitle:(BOOL)a3;
- (void)setShowAlternateDateView:(BOOL)a3;
- (void)setUp;
- (void)timeFormatChanged:(id)a3;
- (void)toggleVisibleDateType;
- (void)updateDate;
- (void)updateDateLabelAccessibilityHint;
- (void)updateLockIcon;
@end

@implementation ICNoteDateFormatterController

- (void)setUp
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [(ICNoteDateFormatterController *)self setDateFormatter:v3];

  v4 = [(ICNoteDateFormatterController *)self dateFormatter];
  [v4 setDateStyle:3];

  v5 = [(ICNoteDateFormatterController *)self dateFormatter];
  [v5 setTimeStyle:1];

  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  [(ICNoteDateFormatterController *)self setShortDateFormatter:v6];

  v7 = [(ICNoteDateFormatterController *)self shortDateFormatter];
  [v7 setDateStyle:1];

  v8 = [(ICNoteDateFormatterController *)self shortDateFormatter];
  [v8 setTimeStyle:1];

  [(ICNoteDateFormatterController *)self setIconHidden:1];
  -[ICNoteDateFormatterController setCurrentSortType:](self, "setCurrentSortType:", [MEMORY[0x263F5AE90] currentNoteListSortType]);
  v9 = [MEMORY[0x263F5AE50] sharedAppGroupDefaults];
  objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", self, *MEMORY[0x263F5AE40], compoundliteral_141);

  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_timeFormatChanged_ name:*MEMORY[0x263EFF458] object:0];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel_timeFormatChanged_ name:*MEMORY[0x263EFF5C8] object:0];

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v13 = *MEMORY[0x263F5A9C8];
  v14 = [MEMORY[0x263F5ABC0] sharedState];
  [v12 addObserver:self selector:sel_noteDecryptedStatusDidChange_ name:v13 object:v14];

  v15 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v16 = *MEMORY[0x263F5A9D0];
  v17 = [MEMORY[0x263F5ABC0] sharedState];
  [v15 addObserver:self selector:sel_noteDecryptedStatusDidChange_ name:v16 object:v17];

  id v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 addObserver:self selector:sel_timeFormatChanged_ name:*MEMORY[0x263F83390] object:0];
}

- (NSDateFormatter)shortDateFormatter
{
  return self->_shortDateFormatter;
}

- (void)setIconHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_iconHidden = a3;
  if (!a3) {
    [(ICNoteDateFormatterController *)self updateLockIcon];
  }
  id v5 = [(ICNoteDateFormatterController *)self delegate];
  [v5 formatter:self iconHiddenDidChange:v3];
}

- (void)setDate:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  p_date = &self->_date;
  if (v5 | (unint64_t)self->_date)
  {
    unint64_t v21 = v5;
    objc_storeStrong((id *)p_date, a3);
    v7 = [(ICNoteDateFormatterController *)self dateFormatter];
    v8 = [(ICNoteDateFormatterController *)self dateStringForDate:v21 dateFormatter:v7];

    if ([v8 length])
    {
      v9 = [(ICNoteDateFormatterController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        v10 = [(ICNoteDateFormatterController *)self delegate];
        char v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) == 0) {
          goto LABEL_9;
        }
        v12 = [(ICNoteDateFormatterController *)self delegate];
        uint64_t v13 = [v12 dateViewAttributes];
        [v8 sizeWithAttributes:v13];
        double v15 = v14;

        uint64_t v16 = [(ICNoteDateFormatterController *)self delegate];
        [v16 dateViewMaximumWidth];
        double v18 = v17;

        if (v18 == 0.0 || v15 < v18) {
          goto LABEL_9;
        }
        v9 = [(ICNoteDateFormatterController *)self shortDateFormatter];
        uint64_t v19 = [(ICNoteDateFormatterController *)self dateStringForDate:v21 dateFormatter:v9];

        v8 = (void *)v19;
      }
    }
LABEL_9:
    v20 = [(ICNoteDateFormatterController *)self delegate];
    [v20 formatter:self textDidChange:v8];

    [(ICNoteDateFormatterController *)self updateDateLabelAccessibilityHint];
  }

  MEMORY[0x270F9A790](p_date);
}

- (ICNoteDateFormatterControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteDateFormatterControllerDelegate *)WeakRetained;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)updateDate
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICNoteDateFormatterController updateDate]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  BOOL v3 = [(ICNoteDateFormatterController *)self shouldShowDateModified];
  v4 = [(ICNoteDateFormatterController *)self note];
  id v6 = v4;
  if (v3) {
    [v4 modificationDate];
  }
  else {
  unint64_t v5 = [v4 creationDate];
  }
  [(ICNoteDateFormatterController *)self setDate:v5];
}

- (BOOL)shouldShowDateModified
{
  BOOL v3 = [(ICNoteDateFormatterController *)self note];
  char v4 = [v3 isSharedReadOnly];

  if (v4) {
    return 1;
  }
  BOOL v6 = [(ICNoteDateFormatterController *)self currentSortType] != 1;
  return [(ICNoteDateFormatterController *)self showAlternateDateView] ^ v6;
}

- (BOOL)showAlternateDateView
{
  return self->_showAlternateDateView;
}

- (id)dateStringForDate:(id)a3 dateFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICNoteDateFormatterController *)self didManuallyChangeDateType])
  {
    BOOL v8 = [(ICNoteDateFormatterController *)self shouldShowDateModified];
    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = v9;
    if (v8) {
      char v11 = @"Edited: %@";
    }
    else {
      char v11 = @"Created: %@";
    }
    v12 = [v9 localizedStringForKey:v11 value:&stru_26C10E100 table:0];

    uint64_t v13 = NSString;
    double v14 = [v7 stringFromDate:v6];
    double v15 = objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);

    goto LABEL_15;
  }
  uint64_t v16 = [(ICNoteDateFormatterController *)self note];
  int v17 = [v16 isSharedReadOnly];

  if (v17)
  {
    double v18 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v19 = v18;
    v20 = @"%@ — View Only";
LABEL_13:
    v23 = [v18 localizedStringForKey:v20 value:&stru_26C10E100 table:0];

    v26 = NSString;
    v24 = [v7 stringFromDate:v6];
    uint64_t v25 = objc_msgSend(v26, "localizedStringWithFormat:", v23, v24);
    goto LABEL_14;
  }
  unint64_t v21 = [(ICNoteDateFormatterController *)self note];
  int v22 = [v21 isSharedViaICloud];

  if (!v22)
  {
    double v15 = [v7 stringFromDate:v6];
    goto LABEL_15;
  }
  if (![(ICNoteDateFormatterController *)self shouldShowSharedNoteTitle])
  {
    double v18 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v19 = v18;
    v20 = @"%@ — Shared";
    goto LABEL_13;
  }
  v23 = [(ICNoteDateFormatterController *)self note];
  v24 = [v23 folder];
  uint64_t v25 = [v24 shareDescription];
LABEL_14:
  double v15 = (void *)v25;

LABEL_15:

  return v15;
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  return (ICNote *)WeakRetained;
}

- (void)updateDateLabelAccessibilityHint
{
  BOOL v3 = @"Double tap to show creation date.";
  if ([(ICNoteDateFormatterController *)self didManuallyChangeDateType]
    && ![(ICNoteDateFormatterController *)self shouldShowDateModified])
  {
    BOOL v3 = @"Double tap to show last edited date.";
  }
  objc_opt_class();
  char v4 = [(ICNoteDateFormatterController *)self delegate];
  ICDynamicCast();
  id argument = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = [v5 localizedStringForKey:v3 value:&stru_26C10E100 table:0];
  [argument setAccessibilityHint:v6];

  if ([argument accessibilityElementIsFocused]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F831C0], argument);
  }
}

- (BOOL)didManuallyChangeDateType
{
  return self->_didManuallyChangeDateType;
}

- (int64_t)currentSortType
{
  return self->_currentSortType;
}

- (void)setShortDateFormatter:(id)a3
{
}

- (void)setNote:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  unint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICNoteDateFormatterController setNote:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
    }
    id v6 = obj;
    if (obj)
    {
      id v7 = [obj managedObjectContext];
      uint64_t v8 = [v7 concurrencyType];

      id v6 = obj;
      if (v8 != 2)
      {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"!note || note.managedObjectContext.concurrencyType == NSMainQueueConcurrencyType" functionName:"-[ICNoteDateFormatterController setNote:]" simulateCrash:1 showAlert:0 format:@"Background note set on date formatter"];
        id v6 = obj;
      }
    }
    -[ICNoteDateFormatterController setShouldShowSharedNoteTitle:](self, "setShouldShowSharedNoteTitle:", [v6 isSharedAndEmpty]);
    id v9 = objc_loadWeakRetained((id *)&self->_note);
    objc_msgSend(v9, "ic_removeObserver:forKeyPath:context:", self, @"modificationDate", compoundliteral_11);

    id v10 = objc_storeWeak((id *)&self->_note, obj);
    objc_msgSend(obj, "ic_addObserver:forKeyPath:context:", self, @"modificationDate", compoundliteral_11);

    [(ICNoteDateFormatterController *)self setDidManuallyChangeDateType:0];
    [(ICNoteDateFormatterController *)self setShowAlternateDateView:0];
    if (obj)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_note);
      -[ICNoteDateFormatterController setIconHidden:](self, "setIconHidden:", [v11 isPasswordProtected] ^ 1);
    }
    else
    {
      [(ICNoteDateFormatterController *)self setIconHidden:1];
    }
    [(ICNoteDateFormatterController *)self updateDate];
    unint64_t v5 = obj;
  }
}

- (void)setShowAlternateDateView:(BOOL)a3
{
  self->_showAlternateDateView = a3;
}

- (void)setShouldShowSharedNoteTitle:(BOOL)a3
{
  self->_shouldShowSharedNoteTitle = a3;
}

- (void)setDidManuallyChangeDateType:(BOOL)a3
{
  self->_didManuallyChangeDateType = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setCurrentSortType:(int64_t)a3
{
  if (self->_currentSortType != a3)
  {
    self->_currentSortType = a3;
    [(ICNoteDateFormatterController *)self setShowAlternateDateView:0];
    [(ICNoteDateFormatterController *)self setDidManuallyChangeDateType:0];
    [(ICNoteDateFormatterController *)self updateDate];
  }
}

- (ICNoteDateFormatterController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteDateFormatterController;
  v2 = [(ICNoteDateFormatterController *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(ICNoteDateFormatterController *)v2 setUp];
  }
  return v3;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);
  objc_msgSend(WeakRetained, "ic_removeObserver:forKeyPath:context:", self, @"modificationDate", compoundliteral_11);

  char v4 = [MEMORY[0x263F5AE50] sharedAppGroupDefaults];
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, *MEMORY[0x263F5AE40], compoundliteral_141);

  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)ICNoteDateFormatterController;
  [(ICNoteDateFormatterController *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICNoteDateFormatterController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/Utilities/ICNoteDateFormatterController.m"])
  {
    char v13 = [(ICNoteDateFormatterController *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (v13) {
      return;
    }
    if (a6 != compoundliteral_11)
    {
      if (a6 != compoundliteral_141) {
        return;
      }
      -[ICNoteDateFormatterController setCurrentSortType:](self, "setCurrentSortType:", [MEMORY[0x263F5AE90] currentNoteListSortType]);
    }
    [(ICNoteDateFormatterController *)self updateDate];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteDateFormatterController;
    [(ICNoteDateFormatterController *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F5ABC0], "sharedState", a3);
  char v4 = [v3 isBlockingDeauthentication];

  if ((v4 & 1) == 0) {
    performBlockOnMainThread();
  }
}

uint64_t __62__ICNoteDateFormatterController_noteDecryptedStatusDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockIcon];
}

- (void)timeFormatChanged:(id)a3
{
}

uint64_t __51__ICNoteDateFormatterController_timeFormatChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDate];
}

- (void)toggleVisibleDateType
{
  [(ICNoteDateFormatterController *)self setDidManuallyChangeDateType:1];
  [(ICNoteDateFormatterController *)self setShowAlternateDateView:[(ICNoteDateFormatterController *)self showAlternateDateView] ^ 1];
  [(ICNoteDateFormatterController *)self updateDate];

  [(ICNoteDateFormatterController *)self updateDateLabelAccessibilityHint];
}

- (void)updateLockIcon
{
  BOOL v3 = (void *)MEMORY[0x263F5B420];
  char v4 = [(ICNoteDateFormatterController *)self note];
  id v6 = [v3 imageForCurrentDecryptedStatusForNote:v4];

  objc_super v5 = [(ICNoteDateFormatterController *)self delegate];
  [v5 formatter:self iconImageDidChange:v6];
}

- (BOOL)iconHidden
{
  return self->_iconHidden;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)shouldShowSharedNoteTitle
{
  return self->_shouldShowSharedNoteTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_shortDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_note);

  objc_destroyWeak((id *)&self->_delegate);
}

@end