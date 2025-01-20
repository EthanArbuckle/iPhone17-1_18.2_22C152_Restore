@interface WFPreviewTextViewDelegate
- (_TtC14WorkflowUICoreP33_86AAE41B33C87C2A40B2E228A8FE182B25WFPreviewTextViewDelegate)init;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
@end

@implementation WFPreviewTextViewDelegate

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  v5 = (void *)OUTLINED_FUNCTION_8_8();
  return v5;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_2353DABEC((uint64_t)v8, (uint64_t)v9, v10);

  return v12;
}

- (_TtC14WorkflowUICoreP33_86AAE41B33C87C2A40B2E228A8FE182B25WFPreviewTextViewDelegate)init
{
  return (_TtC14WorkflowUICoreP33_86AAE41B33C87C2A40B2E228A8FE182B25WFPreviewTextViewDelegate *)sub_2353DB5D4();
}

@end