@interface ICNoteEditorBaseViewController
- (BOOL)isAuxiliaryEditor;
- (BOOL)isEditingOnSecureScreen;
- (BOOL)isEditingOnSystemPaper;
- (ICNote)note;
- (ICNoteEditorBaseViewController)initWithCoder:(id)a3;
- (ICNoteEditorBaseViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4;
- (ICNoteEditorBaseViewController)initWithIdentifier:(int64_t)add options:(unint64_t)a4 nibName:(id)a5 bundle:(id)a6;
- (ICNoteEditorBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)identifierDescription;
- (id)description;
- (int64_t)editorIdentifier;
- (int64_t)viewAppearanceState;
- (unint64_t)options;
- (void)noteDidAppear:(id)a3;
- (void)noteDidDisappear:(id)a3;
- (void)noteWillAppear:(id)a3;
- (void)noteWillDisappear:(id)a3;
- (void)setNote:(id)a3;
- (void)setViewAppearanceState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICNoteEditorBaseViewController

- (ICNote)note
{
  return self->_note;
}

- (BOOL)isEditingOnSecureScreen
{
  return ([(ICNoteEditorBaseViewController *)self options] >> 2) & 1;
}

- (BOOL)isEditingOnSystemPaper
{
  return ([(ICNoteEditorBaseViewController *)self options] >> 1) & 1;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)viewAppearanceState
{
  return self->_viewAppearanceState;
}

- (void)noteWillAppear:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  v8 = @"note";
  v9[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"ICNoteEditorNoteWillAppear" object:self userInfo:v7];
}

- (void)setNote:(id)a3
{
}

- (void)noteDidAppear:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  v8 = @"note";
  v9[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"ICNoteEditorNoteDidAppear" object:self userInfo:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  [(ICNoteEditorBaseViewController *)&v4 viewDidAppear:a3];
  [(ICNoteEditorBaseViewController *)self setViewAppearanceState:3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  [(ICNoteEditorBaseViewController *)&v4 viewWillAppear:a3];
  [(ICNoteEditorBaseViewController *)self setViewAppearanceState:2];
}

- (void)setViewAppearanceState:(int64_t)a3
{
  self->_viewAppearanceState = a3;
}

- (ICNoteEditorBaseViewController)initWithIdentifier:(int64_t)add options:(unint64_t)a4 nibName:(id)a5 bundle:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)ICNoteEditorBaseViewController;
  v8 = [(ICNoteEditorBaseViewController *)&v10 initWithNibName:a5 bundle:a6];
  if (v8)
  {
    if (add >= 10)
    {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier < ICNoteEditorDynamicIdentifiers", "-[ICNoteEditorBaseViewController initWithIdentifier:options:nibName:bundle:]", 1, 0, @"Identifiers in the dynamic range (>=%ld) cannot be passed explicitly: pass ICNoteEditorGenerateNewIdentifier to generate a new dynamic identifier.", 10);
    }
    else if (add < 0)
    {
      add = (int)atomic_fetch_add(ICNoteEditorControllerGenerateIdentifier_sequenceNumber, 1u);
    }
    v8->_editorIdentifier = add;
    v8->_options = a4;
    v8->_viewAppearanceState = 0;
  }
  return v8;
}

- (ICNoteEditorBaseViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  result = [(ICNoteEditorBaseViewController *)&v4 initWithCoder:a3];
  if (result)
  {
    result->_editorIdentifier = (int)atomic_fetch_add(ICNoteEditorControllerGenerateIdentifier_sequenceNumber, 1u);
    result->_options = 0;
    result->_viewAppearanceState = 0;
  }
  return result;
}

- (ICNoteEditorBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(ICNoteEditorBaseViewController *)self initWithIdentifier:-1 options:0 nibName:a3 bundle:a4];
}

- (ICNoteEditorBaseViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  return [(ICNoteEditorBaseViewController *)self initWithIdentifier:a3 options:a4 nibName:0 bundle:0];
}

- (BOOL)isAuxiliaryEditor
{
  return [(ICNoteEditorBaseViewController *)self options] & 1;
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(ICNoteEditorBaseViewController *)self identifierDescription];
  v7 = [v3 stringWithFormat:@"%@[%@]", v5, v6];

  return v7;
}

- (NSString)identifierDescription
{
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self editorIdentifier];
  uint64_t v4 = [(ICNoteEditorBaseViewController *)self options];

  return (NSString *)ICNoteEditorIdentifierString(v3, v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  [(ICScrollViewDelegateViewController *)&v4 viewWillDisappear:a3];
  [(ICNoteEditorBaseViewController *)self setViewAppearanceState:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  [(ICNoteEditorBaseViewController *)&v4 viewDidDisappear:a3];
  [(ICNoteEditorBaseViewController *)self setViewAppearanceState:0];
}

- (int64_t)editorIdentifier
{
  return self->_editorIdentifier;
}

- (void).cxx_destruct
{
}

- (void)noteWillDisappear:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  objc_super v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  v8 = @"note";
  v9[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"ICNoteEditorNoteWillDisappear" object:self userInfo:v7];
}

- (void)noteDidDisappear:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  objc_super v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  v8 = @"note";
  v9[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"ICNoteEditorNoteDidDisappear" object:self userInfo:v7];
}

@end