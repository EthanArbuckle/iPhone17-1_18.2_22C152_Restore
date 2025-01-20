@interface ICTableLinkPresentationActivityItemSource
- (ICAttachment)attachment;
- (ICTableLinkPresentationActivityItemSource)init;
- (ICTableLinkPresentationActivityItemSource)initWithAttachment:(id)a3;
- (id)detail;
- (id)title;
- (void)setAttachment:(id)a3;
@end

@implementation ICTableLinkPresentationActivityItemSource

- (ICTableLinkPresentationActivityItemSource)init
{
  return 0;
}

- (ICTableLinkPresentationActivityItemSource)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTableLinkPresentationActivityItemSource;
  v5 = [(ICTableLinkPresentationActivityItemSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICTableLinkPresentationActivityItemSource *)v5 setAttachment:v4];
  }

  return v6;
}

- (id)title
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Table" value:@"Table" table:0 allowSiri:1];
}

- (id)detail
{
  objc_opt_class();
  v3 = [(ICTableLinkPresentationActivityItemSource *)self attachment];
  id v4 = [v3 attachmentModel];
  v5 = ICCheckedDynamicCast();

  v6 = [v5 stringsAtRow:0];
  v7 = [v6 componentsJoinedByString:@" "];

  return v7;
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end