@interface SBModifierTimelineTextDetailViewController
- (NSAttributedString)attributedText;
- (NSString)text;
- (void)_copyText;
- (void)prepareForReuse;
- (void)setAttributedText:(id)a3;
- (void)setText:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBModifierTimelineTextDetailViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SBModifierTimelineTextDetailViewController;
  [(SBModifierTimelineTextDetailViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  textView = self->_textView;
  self->_textView = v4;

  v6 = self->_textView;
  v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
  [(UITextView *)v6 setFont:v7];

  [(UITextView *)self->_textView setEditable:0];
  v8 = [(SBModifierTimelineTextDetailViewController *)self view];
  [v8 addSubview:self->_textView];

  v9 = [(SBModifierTimelineTextDetailViewController *)self navigationItem];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:@"Copy text" style:0 target:self action:sel__copyText];
  [v9 setRightBarButtonItem:v10];
}

- (void)_copyText
{
  id v3 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v3 setString:self->_text];
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  id v5 = a3;
  [(SBModifierTimelineTextDetailViewController *)self loadViewIfNeeded];
  [(UITextView *)self->_textView setText:v5];

  id v6 = [(SBModifierTimelineTextDetailViewController *)self view];
  [v6 setNeedsLayout];
}

- (void)setAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedText, a3);
  id v5 = a3;
  [(SBModifierTimelineTextDetailViewController *)self loadViewIfNeeded];
  [(UITextView *)self->_textView setAttributedText:v5];

  id v6 = [(SBModifierTimelineTextDetailViewController *)self view];
  [v6 setNeedsLayout];
}

- (void)prepareForReuse
{
  [(SBModifierTimelineTextDetailViewController *)self setText:0];
  [(SBModifierTimelineTextDetailViewController *)self setAttributedText:0];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBModifierTimelineTextDetailViewController;
  [(SBModifierTimelineTextDetailViewController *)&v5 viewWillLayoutSubviews];
  textView = self->_textView;
  v4 = [(SBModifierTimelineTextDetailViewController *)self view];
  [v4 bounds];
  -[UITextView setFrame:](textView, "setFrame:");
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end