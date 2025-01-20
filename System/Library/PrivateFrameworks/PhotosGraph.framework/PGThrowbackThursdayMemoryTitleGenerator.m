@interface PGThrowbackThursdayMemoryTitleGenerator
- (PGThrowbackThursdayMemoryTitleGenerator)initWithMomentNode:(id)a3 numberOfYearsAgo:(int64_t)a4 titleGenerationContext:(id)a5;
- (id)titleGenerator:(id)a3 inputForArgument:(id)a4;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGThrowbackThursdayMemoryTitleGenerator

- (id)titleGenerator:(id)a3 inputForArgument:(id)a4
{
  return (id)objc_msgSend(NSNumber, "numberWithInteger:", self->_numberOfYearsAgo, a4);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  v21 = (void (**)(id, void *, void *))a3;
  v4 = [(PGTitleGenerator *)self momentNodes];
  v5 = [v4 anyObject];
  v6 = [v5 universalStartDate];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  if ((unint64_t)v8)
  {
    v13 = NSString;
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v11 localizedStringForKey:@"PGMemoryTitleFormatWithNumberOfYears %lu" value:@"PGMemoryTitleFormatWithNumberOfYears %lu" table:@"Localizable"];
    v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, self->_numberOfYearsAgo);
  }
  else
  {
    int64_t numberOfYearsAgo = self->_numberOfYearsAgo;
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = v10;
    if (numberOfYearsAgo < 6) {
      v12 = @"PGThrowbackThursdayTitleMoreRecent";
    }
    else {
      v12 = @"PGThrowbackThursdayTitleLongerAgo";
    }
    v15 = [v10 localizedStringForKey:v12 value:v12 table:@"Localizable"];
  }

  v16 = +[PGTitle titleWithString:v15 category:1];
  v17 = objc_alloc_init(PGTimeTitleOptions);
  v18 = [(PGTitleGenerator *)self momentNodes];
  [(PGTimeTitleOptions *)v17 setMomentNodes:v18];

  [(PGTimeTitleOptions *)v17 setAllowedFormats:1];
  v19 = +[PGTimeTitleUtility timeTitleWithOptions:v17];
  if (v19)
  {
    v20 = +[PGTitle titleWithString:v19 category:5];
  }
  else
  {
    v20 = 0;
  }
  if (v21) {
    v21[2](v21, v16, v20);
  }
}

- (PGThrowbackThursdayMemoryTitleGenerator)initWithMomentNode:(id)a3 numberOfYearsAgo:(int64_t)a4 titleGenerationContext:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGThrowbackThursdayMemoryTitleGenerator;
  result = [(PGTitleGenerator *)&v7 initWithMomentNode:a3 type:6 titleGenerationContext:a5];
  if (result) {
    result->_int64_t numberOfYearsAgo = a4;
  }
  return result;
}

@end