@interface OBTemplateLabel
- (NSString)displayText;
- (NSString)symbolName;
- (OBTemplateLabel)init;
- (void)_textAlignmentDidChange;
- (void)setDisplayText:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setText:(id)a3;
- (void)setTitleTrailingSymbol:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTextAlignmentIfNeeded;
@end

@implementation OBTemplateLabel

- (OBTemplateLabel)init
{
  v5.receiver = self;
  v5.super_class = (Class)OBTemplateLabel;
  v2 = -[OBTemplateLabel initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2) {
    [(OBTemplateLabel *)v2 updateTextAlignmentIfNeeded];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBTemplateLabel;
  [(OBTemplateLabel *)&v7 traitCollectionDidChange:a3];
  [(OBTemplateLabel *)self updateTextAlignmentIfNeeded];
  v4 = [(OBTemplateLabel *)self symbolName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(OBTemplateLabel *)self symbolName];
    [(OBTemplateLabel *)self setTitleTrailingSymbol:v6];
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  [(OBTemplateLabel *)self setDisplayText:v4];
  v8.receiver = self;
  v8.super_class = (Class)OBTemplateLabel;
  [(OBTemplateLabel *)&v8 setText:v4];

  uint64_t v5 = [(OBTemplateLabel *)self symbolName];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    objc_super v7 = [(OBTemplateLabel *)self symbolName];
    [(OBTemplateLabel *)self setTitleTrailingSymbol:v7];
  }
}

- (void)setTitleTrailingSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4FB1830];
  objc_super v7 = [(OBTemplateLabel *)self font];
  id v18 = [v6 configurationWithFont:v7];

  objc_super v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
  v9 = [v8 imageByApplyingSymbolConfiguration:v18];
  v10 = [(OBTemplateLabel *)self tintColor];
  v11 = [v9 imageWithTintColor:v10];

  v12 = objc_opt_new();
  [v12 setImage:v11];
  v13 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v12];
  v14 = [(OBTemplateLabel *)self displayText];
  v15 = [v14 stringByAppendingString:@" "];

  id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
  v17 = (void *)[v16 initWithString:v15];
  [v17 appendAttributedString:v13];
  [(OBTemplateLabel *)self setAttributedText:v17];
}

- (void)updateTextAlignmentIfNeeded
{
  uint64_t v3 = [(OBTemplateLabel *)self textAlignment];
  if (+[OBViewUtilities shouldUseAccessibilityLayout]) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  if (v4 != v3)
  {
    -[OBTemplateLabel setTextAlignment:](self, "setTextAlignment:");
    [(OBTemplateLabel *)self _textAlignmentDidChange];
  }
}

- (void)_textAlignmentDidChange
{
  uint64_t v3 = [(OBTemplateLabel *)self symbolName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [(OBTemplateLabel *)self symbolName];
    [(OBTemplateLabel *)self setTitleTrailingSymbol:v5];
  }
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end