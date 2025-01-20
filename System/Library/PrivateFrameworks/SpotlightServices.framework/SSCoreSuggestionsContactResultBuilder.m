@interface SSCoreSuggestionsContactResultBuilder
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (NSString)suggestedContactIdentifier;
- (SSCoreSuggestionsContactResultBuilder)initWithResult:(id)a3;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildCommand;
- (void)setSuggestedContactIdentifier:(id)a3;
@end

@implementation SSCoreSuggestionsContactResultBuilder

+ (id)bundleId
{
  return @"com.apple.CoreSuggestions";
}

+ (BOOL)supportsResult:(id)a3
{
  v4 = [a3 sectionBundleIdentifier];
  v5 = [a1 bundleId];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (SSCoreSuggestionsContactResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSCoreSuggestionsContactResultBuilder;
  v5 = [(SSContactResultBuilder *)&v8 initWithResult:v4];
  if (v5)
  {
    char v6 = [v4 identifier];
    [(SSCoreSuggestionsContactResultBuilder *)v5 setSuggestedContactIdentifier:v6];
  }
  return v5;
}

- (id)buildCommand
{
  v3 = objc_opt_new();
  id v4 = [(SSCoreSuggestionsContactResultBuilder *)self suggestedContactIdentifier];
  [v3 setContactIdentifier:v4];

  [v3 setIsSuggestedContact:1];
  return v3;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (NSString)suggestedContactIdentifier
{
  return self->_suggestedContactIdentifier;
}

- (void)setSuggestedContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end