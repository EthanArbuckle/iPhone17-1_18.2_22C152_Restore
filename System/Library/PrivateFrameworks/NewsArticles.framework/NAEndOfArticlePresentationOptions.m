@interface NAEndOfArticlePresentationOptions
- (NAEndOfArticlePresentationOptions)init;
- (NAEndOfArticlePresentationOptions)initWithSuppressMoreFromSection:(BOOL)a3 suppressMoreToReadSection:(BOOL)a4 suppressMoreFromIssueSection:(BOOL)a5 suppressRelatedSection:(BOOL)a6 suppressRecommendedReadsSection:(int64_t)a7 articleBackgroundColor:(id)a8 isIssueArticle:(BOOL)a9;
@end

@implementation NAEndOfArticlePresentationOptions

- (NAEndOfArticlePresentationOptions)initWithSuppressMoreFromSection:(BOOL)a3 suppressMoreToReadSection:(BOOL)a4 suppressMoreFromIssueSection:(BOOL)a5 suppressRelatedSection:(BOOL)a6 suppressRecommendedReadsSection:(int64_t)a7 articleBackgroundColor:(id)a8 isIssueArticle:(BOOL)a9
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressMoreFromSection) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressMoreToReadSection) = a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressMoreFromIssueSection) = a5;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressRelatedSection) = a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressRecommendedReadsSection) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_articleBackgroundColor) = (Class)a8;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_isIssueArticle) = a9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EndOfArticlePresentationOptions();
  id v10 = a8;
  return [(NAEndOfArticlePresentationOptions *)&v12 init];
}

- (NAEndOfArticlePresentationOptions)init
{
  result = (NAEndOfArticlePresentationOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end