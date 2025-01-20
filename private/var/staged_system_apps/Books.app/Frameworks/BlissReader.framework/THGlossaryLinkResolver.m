@interface THGlossaryLinkResolver
+ (THGlossaryLinkResolver)glossaryLinkResolverWithGlossaryController:(id)a3;
- (THGlossaryController)glossaryController;
- (THGlossaryLinkResolver)initWithGlossaryController:(id)a3;
- (id)anchorFromAbsoluteLink:(id)a3;
- (void)dealloc;
- (void)setGlossaryController:(id)a3;
@end

@implementation THGlossaryLinkResolver

+ (THGlossaryLinkResolver)glossaryLinkResolverWithGlossaryController:(id)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithGlossaryController:a3];

  return (THGlossaryLinkResolver *)v3;
}

- (THGlossaryLinkResolver)initWithGlossaryController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THGlossaryLinkResolver;
  v4 = [(THGlossaryLinkResolver *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THGlossaryLinkResolver *)v4 setGlossaryController:a3];
  }
  return v5;
}

- (void)dealloc
{
  self->mGlossaryController = 0;
  v2.receiver = self;
  v2.super_class = (Class)THGlossaryLinkResolver;
  [(THGlossaryLinkResolver *)&v2 dealloc];
}

- (id)anchorFromAbsoluteLink:(id)a3
{
  id v4 = [a3 docRelativePath];
  if (!v4) {
    return 0;
  }
  id v5 = -[THGlossaryController entryForPath:](-[THGlossaryLinkResolver glossaryController](self, "glossaryController"), "entryForPath:", [@"/" stringByAppendingString:v4]);
  if (!v5) {
    return 0;
  }

  return +[THModelGlossaryEntryAnchor glossaryEntryAnchorWithGlossaryEntry:v5];
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->mGlossaryController = (THGlossaryController *)a3;
}

@end