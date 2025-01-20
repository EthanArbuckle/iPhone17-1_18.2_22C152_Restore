@interface OBSetupAssistantMultitaskingHeaderView
- (double)iconToHeaderLabelPadding;
@end

@implementation OBSetupAssistantMultitaskingHeaderView

- (double)iconToHeaderLabelPadding
{
  v3 = +[OBDevice currentDevice];
  uint64_t v4 = [v3 templateType];

  if (v4 == 6)
  {
    v5 = +[OBDevice currentDevice];
    int v6 = [v5 isMiniPad];

    double result = 16.0;
    if (v6) {
      return 8.0;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBSetupAssistantMultitaskingHeaderView;
    [(OBHeaderView *)&v8 iconToHeaderLabelPadding];
  }
  return result;
}

@end