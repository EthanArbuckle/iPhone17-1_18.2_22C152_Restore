@interface WBSTemplateIconRequest
- (NSString)monogramTitle;
- (UIColor)overrideForegroundColor;
- (WBSTemplateIconMonogramConfiguration)monogramConfiguration;
- (WBSTemplateIconRequest)initWithURL:(id)a3 title:(id)a4 monogramConfiguration:(id)a5 overrideForegroundColor:(id)a6;
@end

@implementation WBSTemplateIconRequest

- (WBSTemplateIconRequest)initWithURL:(id)a3 title:(id)a4 monogramConfiguration:(id)a5 overrideForegroundColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v11 length])
  {
    v15 = (void *)[v11 copy];
    [v14 setObject:v15 forKeyedSubscript:@"monogramTitleExtraInfoKey"];
  }
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:@"monogramConfigurationExtraInfoKey"];
  }
  if (v13) {
    [v14 setObject:v13 forKeyedSubscript:@"overrideForegroundColorKey"];
  }
  v18.receiver = self;
  v18.super_class = (Class)WBSTemplateIconRequest;
  v16 = [(WBSSiteMetadataRequest *)&v18 initWithURL:v10 extraInfo:v14];

  return v16;
}

- (NSString)monogramTitle
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"monogramTitleExtraInfoKey"];

  return (NSString *)v3;
}

- (WBSTemplateIconMonogramConfiguration)monogramConfiguration
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"monogramConfigurationExtraInfoKey"];

  return (WBSTemplateIconMonogramConfiguration *)v3;
}

- (UIColor)overrideForegroundColor
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"overrideForegroundColorKey"];

  return (UIColor *)v3;
}

@end