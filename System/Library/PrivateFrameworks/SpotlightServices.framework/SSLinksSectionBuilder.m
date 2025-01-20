@interface SSLinksSectionBuilder
+ (id)supportedBundleId;
- (BOOL)useCompactRowOnMac;
- (BOOL)useHorizontallyScrollingCardSectionUI;
- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4;
- (id)buildCollectionStyle;
- (int64_t)maxCardSections;
@end

@implementation SSLinksSectionBuilder

+ (id)supportedBundleId
{
  return @"com.apple.searchd.syndicatedLinks";
}

- (BOOL)useCompactRowOnMac
{
  int v3 = isMacOS();
  if (v3) {
    LOBYTE(v3) = ![(SSSectionBuilder *)self hasEntities];
  }
  return v3;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  if (SSSnippetModernizationEnabled()) {
    return ![(SSLinksSectionBuilder *)self useCompactRowOnMac];
  }
  v4.receiver = self;
  v4.super_class = (Class)SSLinksSectionBuilder;
  return [(SSSectionBuilder *)&v4 useHorizontallyScrollingCardSectionUI];
}

- (id)buildCollectionStyle
{
  if ([(SSLinksSectionBuilder *)self useCompactRowOnMac]
    && (SSSnippetModernizationEnabled() & 1) == 0)
  {
    int v3 = objc_opt_new();
  }
  else if ([(SSLinksSectionBuilder *)self useHorizontallyScrollingCardSectionUI]|| SSSnippetModernizationEnabled())
  {
    int v3 = objc_opt_new();
    [v3 setNumberOfRows:1];
  }
  else
  {
    int v3 = objc_opt_new();
    objc_super v4 = [(SSSectionBuilder *)self section];
    if ([v4 resultsCount] == 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    [v3 setNumberOfColumns:v5];

    objc_msgSend(v3, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v3, "numberOfColumns"));
  }
  return v3;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  id v5 = a4;
  if ([(SSLinksSectionBuilder *)self useCompactRowOnMac]
    && (SSSnippetModernizationEnabled() & 1) == 0)
  {
    uint64_t v6 = [v5 buildCompactCardSection];
  }
  else
  {
    uint64_t v6 = [v5 buildHorizontallyScrollingCardSection];
  }
  v7 = (void *)v6;

  return v7;
}

- (int64_t)maxCardSections
{
  if (SSSnippetModernizationEnabled())
  {
    uint64_t v6 = self;
    int v3 = &v6;
  }
  else
  {
    if (isMacOS() && ![(SSLinksSectionBuilder *)self useCompactRowOnMac]) {
      return 2;
    }
    id v5 = self;
    int v3 = &v5;
  }
  v3[1] = (SSLinksSectionBuilder *)SSLinksSectionBuilder;
  return (int64_t)objc_msgSendSuper2((objc_super *)v3, sel_maxCardSections, v5);
}

@end