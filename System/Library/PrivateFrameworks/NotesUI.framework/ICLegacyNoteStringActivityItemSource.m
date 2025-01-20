@interface ICLegacyNoteStringActivityItemSource
- (ICLegacyNoteStringActivityItemSource)initWithTitle:(id)a3 content:(id)a4 plainText:(id)a5;
- (NSString)content;
- (NSString)plainText;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (void)setContent:(id)a3;
- (void)setPlainText:(id)a3;
@end

@implementation ICLegacyNoteStringActivityItemSource

- (ICLegacyNoteStringActivityItemSource)initWithTitle:(id)a3 content:(id)a4 plainText:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICLegacyNoteStringActivityItemSource;
  v10 = [(ICNoteBaseActivityItemSource *)&v13 initWithTitle:a3];
  v11 = v10;
  if (v10)
  {
    [(ICLegacyNoteStringActivityItemSource *)v10 setContent:v8];
    [(ICLegacyNoteStringActivityItemSource *)v11 setPlainText:v9];
  }

  return v11;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqual:*MEMORY[0x1E4F43590]]) {
    [(ICLegacyNoteStringActivityItemSource *)self plainText];
  }
  else {
  v5 = [(ICLegacyNoteStringActivityItemSource *)self content];
  }
  return v5;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSString)plainText
{
  return self->_plainText;
}

- (void)setPlainText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainText, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end