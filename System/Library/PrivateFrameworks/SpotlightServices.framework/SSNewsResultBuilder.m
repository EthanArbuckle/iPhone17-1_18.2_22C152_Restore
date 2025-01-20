@interface SSNewsResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
+ (id)newsFootnoteWithNewsSource:(id)a3 publishedDate:(id)a4;
- (NSDate)publishedDate;
- (NSString)newsSource;
- (NSString)title;
- (SSNewsResultBuilder)initWithResult:(id)a3;
- (id)buildDescriptions;
- (id)buildInlineCardSection;
- (void)setNewsSource:(id)a3;
- (void)setPublishedDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SSNewsResultBuilder

+ (id)bundleId
{
  return @"com.apple.news";
}

+ (id)newsFootnoteWithNewsSource:(id)a3 publishedDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = v7;
  if (v5) {
    [v7 addObject:v5];
  }
  if (v6)
  {
    v9 = +[SSDateFormatManager dynamicCompactStringFromDate:v6];
    [v8 addObject:v9];
  }
  if ([v8 count])
  {
    v10 = [v8 componentsJoinedByString:@" - "];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSNewsResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSNewsResultBuilder;
  id v5 = [(SSResultBuilder *)&v10 initWithResult:v4];
  if (v5)
  {
    id v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSNewsResultBuilder *)v5 setPublishedDate:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSNewsResultBuilder *)v5 setTitle:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F23160] withType:objc_opt_class()];
    [(SSNewsResultBuilder *)v5 setNewsSource:v8];
  }
  return v5;
}

- (id)buildInlineCardSection
{
  v11.receiver = self;
  v11.super_class = (Class)SSNewsResultBuilder;
  v3 = [(SSResultBuilder *)&v11 buildInlineCardSection];
  if (SSSnippetModernizationEnabled())
  {
    id v4 = [v3 title];
    [v4 setMaxLines:2];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F9A378];
    id v6 = objc_opt_class();
    id v4 = [(SSNewsResultBuilder *)self newsSource];
    v7 = [(SSNewsResultBuilder *)self publishedDate];
    v8 = [v6 newsFootnoteWithNewsSource:v4 publishedDate:v7];
    v9 = [v5 textWithString:v8];
    [v3 setFootnote:v9];
  }
  return v3;
}

- (id)buildDescriptions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (SSSnippetModernizationEnabled())
  {
    v11.receiver = self;
    v11.super_class = (Class)SSNewsResultBuilder;
    v3 = [(SSResultBuilder *)&v11 buildDescriptions];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F9A378];
    id v5 = objc_opt_class();
    id v6 = [(SSNewsResultBuilder *)self newsSource];
    v7 = [(SSNewsResultBuilder *)self publishedDate];
    v8 = [v5 newsFootnoteWithNewsSource:v6 publishedDate:v7];
    v9 = [v4 textWithString:v8];
    v12[0] = v9;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  return v3;
}

- (NSDate)publishedDate
{
  return self->_publishedDate;
}

- (void)setPublishedDate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)newsSource
{
  return self->_newsSource;
}

- (void)setNewsSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsSource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publishedDate, 0);
}

@end