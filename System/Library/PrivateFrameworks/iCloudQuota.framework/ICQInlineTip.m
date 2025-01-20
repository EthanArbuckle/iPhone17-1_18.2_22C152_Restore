@interface ICQInlineTip
+ (BOOL)supportsSecureCoding;
+ (NSArray)downwardArrowConfigurationStrings;
+ (NSArray)upwardArrowConfigurationStrings;
- (ICQInlineTip)initWithCoder:(id)a3;
- (ICQTipCriteria)criteria;
- (ICQTipIcon)icon;
- (NSArray)actions;
- (NSString)anchor;
- (NSString)arrowConfiguration;
- (NSString)id;
- (NSString)subTitle;
- (NSString)title;
- (NSURL)dismissURL;
- (NSURL)displayURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setArrowConfiguration:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setDismissURL:(id)a3;
- (void)setDisplayURL:(id)a3;
- (void)setIcon:(id)a3;
- (void)setId:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQInlineTip

- (id)description
{
  return (id)[NSString stringWithFormat:@"id: %@ anchor: %@, title: %@, subtitle: %@ actions: %@, criteria: %@, arrowConfiguration:%@ icon: %@ dismissURL:%@, displayURL: %@", self->_id, self->_anchor, self->_title, self->_subTitle, self->_actions, self->_criteria, self->_arrowConfiguration, self->_icon, self->_dismissURL, self->_displayURL];
}

+ (NSArray)upwardArrowConfigurationStrings
{
  if (upwardArrowConfigurationStrings_onceToken != -1) {
    dispatch_once(&upwardArrowConfigurationStrings_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)upwardArrowConfigurationStrings_strings;
  return (NSArray *)v2;
}

void __47__ICQInlineTip_upwardArrowConfigurationStrings__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"TOP";
  v2[1] = @"TOPLEFT";
  v2[2] = @"TOPRIGHT";
  v2[3] = @"NONE";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)upwardArrowConfigurationStrings_strings;
  upwardArrowConfigurationStrings_strings = v0;
}

+ (NSArray)downwardArrowConfigurationStrings
{
  if (downwardArrowConfigurationStrings_onceToken != -1) {
    dispatch_once(&downwardArrowConfigurationStrings_onceToken, &__block_literal_global_223);
  }
  v2 = (void *)downwardArrowConfigurationStrings_strings;
  return (NSArray *)v2;
}

void __49__ICQInlineTip_downwardArrowConfigurationStrings__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"BOTTOM";
  v2[1] = @"BOTTOMLEFT";
  v2[2] = @"BOTTOMRIGHT";
  v2[3] = @"NONE";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)downwardArrowConfigurationStrings_strings;
  downwardArrowConfigurationStrings_strings = v0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQInlineTip);
  [(ICQInlineTip *)v4 setId:self->_id];
  [(ICQInlineTip *)v4 setAnchor:self->_anchor];
  [(ICQInlineTip *)v4 setTitle:self->_title];
  [(ICQInlineTip *)v4 setSubTitle:self->_subTitle];
  [(ICQInlineTip *)v4 setActions:self->_actions];
  [(ICQInlineTip *)v4 setCriteria:self->_criteria];
  [(ICQInlineTip *)v4 setIcon:self->_icon];
  [(ICQInlineTip *)v4 setArrowConfiguration:self->_arrowConfiguration];
  [(ICQInlineTip *)v4 setDismissURL:self->_dismissURL];
  [(ICQInlineTip *)v4 setDisplayURL:self->_displayURL];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id = self->_id;
  id v5 = a3;
  [v5 encodeObject:id forKey:@"id"];
  [v5 encodeObject:self->_anchor forKey:@"anchor"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subTitle forKey:@"subTitle"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_criteria forKey:@"criteria"];
  [v5 encodeObject:self->_arrowConfiguration forKey:@"arrowConfiguration"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_dismissURL forKey:@"dismissURL"];
  [v5 encodeObject:self->_displayURL forKey:@"displayURL"];
}

- (ICQInlineTip)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ICQInlineTip;
  id v5 = [(ICQInlineTip *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    id = v5->_id;
    v5->_id = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v16 = [v14 setWithArray:v15];

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"criteria"];
    criteria = v5->_criteria;
    v5->_criteria = (ICQTipCriteria *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrowConfiguration"];
    arrowConfiguration = v5->_arrowConfiguration;
    v5->_arrowConfiguration = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (ICQTipIcon *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissURL"];
    dismissURL = v5->_dismissURL;
    v5->_dismissURL = (NSURL *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayURL"];
    displayURL = v5->_displayURL;
    v5->_displayURL = (NSURL *)v27;
  }
  return v5;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (ICQTipIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (ICQTipCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (NSString)arrowConfiguration
{
  return self->_arrowConfiguration;
}

- (void)setArrowConfiguration:(id)a3
{
}

- (NSURL)dismissURL
{
  return self->_dismissURL;
}

- (void)setDismissURL:(id)a3
{
}

- (NSURL)displayURL
{
  return self->_displayURL;
}

- (void)setDisplayURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayURL, 0);
  objc_storeStrong((id *)&self->_dismissURL, 0);
  objc_storeStrong((id *)&self->_arrowConfiguration, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end