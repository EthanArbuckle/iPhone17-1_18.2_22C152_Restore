@interface SSBookResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
- (NSDate)date;
- (NSString)author;
- (NSString)genre;
- (SSBookResultBuilder)initWithResult:(id)a3;
- (id)buildCompactCardSection;
- (void)setAuthor:(id)a3;
- (void)setDate:(id)a3;
- (void)setGenre:(id)a3;
@end

@implementation SSBookResultBuilder

+ (id)bundleId
{
  return @"com.apple.iBooks";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSBookResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSBookResultBuilder;
  v5 = [(SSResultBuilder *)&v13 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22C78] withType:objc_opt_class()];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 firstObject];
      [(SSBookResultBuilder *)v5 setAuthor:v8];
    }
    else
    {
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"NO_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
      [(SSBookResultBuilder *)v5 setAuthor:v9];
    }
    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22FD0] withType:objc_opt_class()];
    [(SSBookResultBuilder *)v5 setGenre:v10];

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F230F0] withType:objc_opt_class()];
    [(SSBookResultBuilder *)v5 setDate:v11];
  }
  return v5;
}

- (id)buildCompactCardSection
{
  v3 = objc_opt_new();
  id v4 = [(SSBookResultBuilder *)self author];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(SSBookResultBuilder *)self genre];
  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [(SSBookResultBuilder *)self date];
  v7 = [(SSBookResultBuilder *)self date];

  if (v7)
  {
    v8 = +[SSDateFormatManager stringsFromDate:v6 toDate:v6 isAllDay:0];
    [v3 addObjectsFromArray:v8];
  }
  v12.receiver = self;
  v12.super_class = (Class)SSBookResultBuilder;
  v9 = [(SSResultBuilder *)&v12 buildCompactCardSection];
  v10 = [(id)objc_opt_class() richTextsFromStrings:v3];
  [v9 setDescriptions:v10];

  return v9;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
}

@end