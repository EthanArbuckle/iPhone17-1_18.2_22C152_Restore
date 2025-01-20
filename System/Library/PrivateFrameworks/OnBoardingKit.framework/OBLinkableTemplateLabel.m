@interface OBLinkableTemplateLabel
- (OBButtonTrayLinkAction)tapAction;
- (OBLinkableTemplateLabel)init;
- (UITapGestureRecognizer)tapRecognizer;
- (void)_linkTapped:(id)a3;
- (void)_setLinkText:(id)a3 withFormat:(id)a4 withAction:(id)a5;
- (void)setInstructionsForUseTextWithAction:(id)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setTapAction:(id)a3;
- (void)setTapRecognizer:(id)a3;
@end

@implementation OBLinkableTemplateLabel

- (OBLinkableTemplateLabel)init
{
  v6.receiver = self;
  v6.super_class = (Class)OBLinkableTemplateLabel;
  v2 = [(OBTemplateLabel *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v2 action:sel__linkTapped_];
    tapRecognizer = v2->_tapRecognizer;
    v2->_tapRecognizer = (UITapGestureRecognizer *)v3;

    [(OBLinkableTemplateLabel *)v2 addGestureRecognizer:v2->_tapRecognizer];
  }
  return v2;
}

- (void)_linkTapped:(id)a3
{
  id v3 = [(OBLinkableTemplateLabel *)self tapAction];
  [v3 performButtonTrayLinkAction];
}

- (void)setLearnMoreURL:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    v5 = [v4 scheme];
    char v6 = [v5 containsString:@"http"];

    if ((v6 & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Learn More links only support web URLs." userInfo:0];
      objc_exception_throw(v12);
    }
    v7 = [[OBButtonTrayLinkURLAction alloc] initWithURL:v13];
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = +[OBUtilities localizedString:@"LEARN_MORE_CAPTION_LINK" forTable:@"Localizable" inBundle:v8 forLanguage:0];

    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = +[OBUtilities localizedString:@"LEARN_MORE_CAPTION_LINK_FORMAT_STRING" forTable:@"Localizable" inBundle:v10 forLanguage:0];
    [(OBLinkableTemplateLabel *)self _setLinkText:v9 withFormat:v11 withAction:v7];
  }
  else
  {
    [(OBLinkableTemplateLabel *)self setUserInteractionEnabled:0];
    [(OBLinkableTemplateLabel *)self setTapAction:0];
  }
}

- (void)setInstructionsForUseTextWithAction:(id)a3
{
  id v4 = a3;
  v9 = [[OBButtonTrayLinkCallbackAction alloc] initWithCallback:v4];

  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = +[OBUtilities localizedString:@"INSTRUCTIONS_FOR_USE_CAPTION_LINK_TEXT" forTable:@"Localizable" inBundle:v5 forLanguage:0];

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = +[OBUtilities localizedString:@"INSTRUCTIONS_FOR_USE_CAPTION_LINK_FORMAT_STRING" forTable:@"Localizable" inBundle:v7 forLanguage:0];
  [(OBLinkableTemplateLabel *)self _setLinkText:v6 withFormat:v8 withAction:v9];
}

- (void)_setLinkText:(id)a3 withFormat:(id)a4 withAction:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(OBLinkableTemplateLabel *)self setUserInteractionEnabled:1];
  v11 = [(OBLinkableTemplateLabel *)self text];
  id v12 = +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", v9, v11, v10);

  [(OBTemplateLabel *)self setText:v12];
  id v13 = [(OBLinkableTemplateLabel *)self text];
  uint64_t v14 = [v13 rangeOfString:v10];
  uint64_t v16 = v15;

  v17 = [(OBLinkableTemplateLabel *)self attributedText];
  id v18 = (id)[v17 mutableCopy];

  objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], &stru_1EEC28768, v14, v16);
  [(OBLinkableTemplateLabel *)self setAttributedText:v18];
  [(OBLinkableTemplateLabel *)self setTapAction:v8];
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (OBButtonTrayLinkAction)tapAction
{
  return self->_tapAction;
}

- (void)setTapAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end