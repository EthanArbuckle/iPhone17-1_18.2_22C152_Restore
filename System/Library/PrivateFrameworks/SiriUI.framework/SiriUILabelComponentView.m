@interface SiriUILabelComponentView
+ (id)labelForComponentModel:(id)a3;
+ (id)viewForComponent:(id)a3;
- (NSArray)labels;
- (void)setLabels:(id)a3;
@end

@implementation SiriUILabelComponentView

+ (id)viewForComponent:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = +[SiriUIDetailLabelComponentView viewForComponent:v4];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 labelForComponentModel:v4];
    goto LABEL_5;
  }
  v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    +[SiriUILabelComponentView viewForComponent:](v7);
  }
  v6 = 0;
LABEL_9:

  return v6;
}

+ (id)labelForComponentModel:(id)a3
{
  id v3 = a3;
  switch([v3 style])
  {
    case 0:
      uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredHeadlineLabel");
      goto LABEL_9;
    case 1:
      uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredBodyLabel");
      goto LABEL_9;
    case 2:
      uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredSubheadLabel");
      goto LABEL_9;
    case 3:
      uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredCaptionLabel");
      goto LABEL_9;
    case 4:
      uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredFootnoteLabel");
      goto LABEL_9;
    case 5:
      uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredTitleLabel");
LABEL_9:
      uint64_t v5 = (void *)v4;
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [v3 text];

  [v5 setText:v6];
  LODWORD(v7) = 1144750080;
  [v5 setContentHuggingPriority:1 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [v5 setContentCompressionResistancePriority:1 forAxis:v8];
  [v5 sizeToFit];
  return v5;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)viewForComponent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 136315394;
  uint64_t v4 = "+[SiriUILabelComponentView viewForComponent:]";
  __int16 v5 = 2114;
  id v6 = (id)objc_opt_class();
  id v2 = v6;
  _os_log_error_impl(&dword_2231EF000, v1, OS_LOG_TYPE_ERROR, "%s Unsupported Object for SiriUILabelComponentView %{public}@", (uint8_t *)&v3, 0x16u);
}

@end