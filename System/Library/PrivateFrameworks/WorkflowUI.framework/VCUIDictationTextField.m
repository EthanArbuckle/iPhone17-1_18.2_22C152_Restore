@interface VCUIDictationTextField
+ (double)bottomPadding;
- (CGSize)intrinsicContentSize;
- (id)placeholderLabel;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setAttributedPlaceholder:(id)a3;
- (void)startDictation;
@end

@implementation VCUIDictationTextField

- (void)startDictation
{
  [(VCUIDictationTextField *)self becomeFirstResponder];
  id v2 = [MEMORY[0x263F828C0] sharedInputModeController];
  [v2 switchToDictationInputMode];
}

- (CGSize)intrinsicContentSize
{
  v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
  [v3 lineHeight];
  double v5 = v4 * 3.25;

  v6 = [(VCUIDictationTextField *)self placeholderLabel];
  v7 = [(VCUIDictationTextField *)self text];
  uint64_t v8 = [v7 length];

  [(VCUIDictationTextField *)self bounds];
  if (v8 || !v6)
  {
    -[VCUIDictationTextField sizeThatFits:](self, "sizeThatFits:", v9, v5);
    double v11 = v16;
    double v15 = v17;
  }
  else
  {
    objc_msgSend(v6, "sizeThatFits:", v9, v5);
    double v11 = v10;
    double v13 = v12;
    +[VCUIDictationTextField bottomPadding];
    double v15 = v13 + v14;
  }

  double v18 = v11;
  double v19 = v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)VCUIDictationTextField;
  [(VCUIDictationTextField *)&v10 layoutSubviews];
  v3 = [(VCUIDictationTextField *)self placeholderLabel];
  double v4 = v3;
  if (v3)
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    +[VCUIDictationTextField bottomPadding];
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, v6, v8 + v9);
  }
}

- (id)placeholderLabel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(VCUIDictationTextField *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(id *)(*((void *)&v9 + 1) + 8 * v6);
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v7 = 0;
  }

  return v7;
}

- (void)setAttributedPlaceholder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VCUIDictationTextField;
  [(VCUIDictationTextField *)&v5 setAttributedPlaceholder:a3];
  uint64_t v4 = [(VCUIDictationTextField *)self placeholderLabel];
  if (v4) {
    objc_msgSend(v4, "setTextAlignment:", -[VCUIDictationTextField textAlignment](self, "textAlignment"));
  }
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)VCUIDictationTextField;
  [(VCUIDictationTextField *)&v4 didMoveToSuperview];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_dictationDidFinish_ name:*MEMORY[0x263F834B0] object:0];

  if ([(VCUIDictationTextField *)self conformsToProtocol:&unk_26E2154C0]) {
    [(VCUIDictationTextField *)self setAcceptsDictationSearchResults:1];
  }
}

+ (double)bottomPadding
{
  return 16.0;
}

@end