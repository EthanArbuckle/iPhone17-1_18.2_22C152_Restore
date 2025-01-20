@interface ICActivityItemProvider
- (ICActivityItemProvider)initWithItemProvider:(id)a3 title:(id)a4 image:(id)a5;
- (ICLinkPresentationMetadata)linkPresentationMetadata;
- (NSItemProvider)itemProvider;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setLinkPresentationMetadata:(id)a3;
@end

@implementation ICActivityItemProvider

- (ICActivityItemProvider)initWithItemProvider:(id)a3 title:(id)a4 image:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICActivityItemProvider;
  v11 = [(ICActivityItemProvider *)&v15 initWithPlaceholderItem:v8];
  v12 = v11;
  if (v11)
  {
    [(ICActivityItemProvider *)v11 setItemProvider:v8];
    v13 = [[ICLinkPresentationMetadata alloc] initWithTitle:v9 image:v10];
    [(ICActivityItemProvider *)v12 setLinkPresentationMetadata:v13];
  }
  return v12;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  v3 = [(ICActivityItemProvider *)self linkPresentationMetadata];
  v4 = [v3 linkMetadata];

  return v4;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (ICLinkPresentationMetadata)linkPresentationMetadata
{
  return self->_linkPresentationMetadata;
}

- (void)setLinkPresentationMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationMetadata, 0);

  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end