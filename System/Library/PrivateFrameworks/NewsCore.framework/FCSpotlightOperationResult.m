@interface FCSpotlightOperationResult
- (FCCardStyleProviding)spotlightItemDarkStyle;
- (FCCardStyleProviding)spotlightItemStyle;
- (FCColor)titleColor;
- (FCHeadlineProviding)headline;
- (FCSpotlightOperationResult)initWithSpotlightGroupConfig:(id)a3 headline:(id)a4;
- (NSDate)publishDate;
- (NSString)channelID;
- (NSString)ctaText;
- (NSString)eyebrowTitle;
- (NSString)subTitleText;
- (NSString)titleText;
@end

@implementation FCSpotlightOperationResult

- (FCSpotlightOperationResult)initWithSpotlightGroupConfig:(id)a3 headline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)FCSpotlightOperationResult;
  v8 = [(FCSpotlightOperationResult *)&v33 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_headline, a4);
    v10 = [v6 spotlightEyebrowTitle];
    uint64_t v11 = [v10 copy];
    eyebrowTitle = v9->_eyebrowTitle;
    v9->_eyebrowTitle = (NSString *)v11;

    v13 = [v6 groupName];
    uint64_t v14 = [v13 copy];
    titleText = v9->_titleText;
    v9->_titleText = (NSString *)v14;

    v16 = [v6 groupSubtitle];
    uint64_t v17 = [v16 copy];
    subTitleText = v9->_subTitleText;
    v9->_subTitleText = (NSString *)v17;

    v19 = [v6 spotlightCallToActionTitle];
    uint64_t v20 = [v19 copy];
    ctaText = v9->_ctaText;
    v9->_ctaText = (NSString *)v20;

    v22 = [v6 publishDate];
    uint64_t v23 = [v22 copy];
    publishDate = v9->_publishDate;
    v9->_publishDate = (NSDate *)v23;

    v25 = [v6 groupTitleColor];
    uint64_t v26 = [v25 copy];
    titleColor = v9->_titleColor;
    v9->_titleColor = (FCColor *)v26;

    uint64_t v28 = [v6 spotlightItemStyle];
    spotlightItemStyle = v9->_spotlightItemStyle;
    v9->_spotlightItemStyle = (FCCardStyleProviding *)v28;

    uint64_t v30 = [v6 spotlightItemDarkStyle];
    spotlightItemDarkStyle = v9->_spotlightItemDarkStyle;
    v9->_spotlightItemDarkStyle = (FCCardStyleProviding *)v30;
  }
  return v9;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)eyebrowTitle
{
  return self->_eyebrowTitle;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subTitleText
{
  return self->_subTitleText;
}

- (NSString)ctaText
{
  return self->_ctaText;
}

- (FCColor)titleColor
{
  return self->_titleColor;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (FCCardStyleProviding)spotlightItemStyle
{
  return self->_spotlightItemStyle;
}

- (FCCardStyleProviding)spotlightItemDarkStyle
{
  return self->_spotlightItemDarkStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightItemDarkStyle, 0);
  objc_storeStrong((id *)&self->_spotlightItemStyle, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_ctaText, 0);
  objc_storeStrong((id *)&self->_subTitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_eyebrowTitle, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end