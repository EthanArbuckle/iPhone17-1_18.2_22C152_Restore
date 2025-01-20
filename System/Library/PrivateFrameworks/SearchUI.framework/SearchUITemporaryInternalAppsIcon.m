@interface SearchUITemporaryInternalAppsIcon
+ (BOOL)canGenerateIconsInBackground;
- (SFSearchResult)searchResult;
- (SearchUITemporaryInternalAppsIcon)initWithResult:(id)a3 variant:(unint64_t)a4;
- (id)displayNameForLocation:(id)a3;
- (id)iconImageWithInfo:(SBIconImageInfo *)a3;
- (unint64_t)variant;
@end

@implementation SearchUITemporaryInternalAppsIcon

- (SearchUITemporaryInternalAppsIcon)initWithResult:(id)a3 variant:(unint64_t)a4
{
  id v7 = a3;
  v8 = [v7 applicationBundleIdentifier];
  v9 = [v7 applicationBundleIdentifier];
  v12.receiver = self;
  v12.super_class = (Class)SearchUITemporaryInternalAppsIcon;
  v10 = [(SBLeafIcon *)&v12 initWithLeafIdentifier:v8 applicationBundleID:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchResult, a3);
    v10->_variant = a4;
  }

  return v10;
}

+ (BOOL)canGenerateIconsInBackground
{
  return 1;
}

- (id)iconImageWithInfo:(SBIconImageInfo *)a3
{
  double v4 = v3;
  v6 = [(SearchUITemporaryInternalAppsIcon *)self searchResult];
  if (v6)
  {
    id v7 = [(SearchUITemporaryInternalAppsIcon *)self searchResult];
    v8 = +[SearchUIAppIconImage appIconForResult:v7 variant:[(SearchUITemporaryInternalAppsIcon *)self variant]];
    v9 = [v8 loadImageWithScale:0 isDarkStyle:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)displayNameForLocation:(id)a3
{
  double v3 = [(SearchUITemporaryInternalAppsIcon *)self searchResult];
  double v4 = [v3 title];
  v5 = [v4 text];

  return v5;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void).cxx_destruct
{
}

@end