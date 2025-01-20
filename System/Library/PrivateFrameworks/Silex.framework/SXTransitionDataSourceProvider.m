@interface SXTransitionDataSourceProvider
- (SXComponentController)componentController;
- (SXDocumentMetadataProviding)documentMetadataProvider;
- (SXTransitionDataSourceNode)currentNode;
- (SXTransitionDataSourceProvider)initWithComponentController:(id)a3 scrollView:(id)a4 documentMetadataProvider:(id)a5;
- (UIScrollView)scrollView;
- (id)transitionDataSourceForType:(unint64_t)a3;
- (void)setCurrentNode:(id)a3;
@end

@implementation SXTransitionDataSourceProvider

- (SXTransitionDataSourceProvider)initWithComponentController:(id)a3 scrollView:(id)a4 documentMetadataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXTransitionDataSourceProvider;
  v12 = [(SXTransitionDataSourceProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_componentController, a3);
    objc_storeStrong((id *)&v13->_scrollView, a4);
    objc_storeStrong((id *)&v13->_documentMetadataProvider, a5);
  }

  return v13;
}

- (id)transitionDataSourceForType:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SXTransitionDataSourceProvider *)self currentNode];
  if (!v5
    || (v6 = (void *)v5,
        [(SXTransitionDataSourceProvider *)self currentNode],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 transitionType],
        v7,
        v6,
        v8 != a3))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = [(SXTransitionDataSourceProvider *)self componentController];
    id v10 = [v9 flattenedComponentViews];

    id v11 = (id)[v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      unint64_t v26 = a3;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v14 transitionViewIsVisible])
          {
            if ([v14 isTransitionable])
            {
              objc_super v15 = [(SXTransitionDataSourceProvider *)self documentMetadataProvider];
              v16 = [v15 metadata];
              v17 = [v16 thumbnailImageIdentifier];
              int v18 = [v14 usesThumbnailWithImageIdentifier:v17];

              if (v18)
              {
                id v11 = v14;
                id v19 = [(SXTransitionDataSourceProvider *)self scrollView];

                v20 = v11;
                a3 = v26;
                if (v11)
                {
                  v20 = v11;
                  if (v11 != v19)
                  {
                    v21 = v11;
                    do
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        [v21 prepareForTransitionType:v26];
                      }
                      v20 = [v21 superview];

                      v22 = [(SXTransitionDataSourceProvider *)self scrollView];

                      if (!v20) {
                        break;
                      }
                      v21 = v20;
                    }
                    while (v20 != v22);
                  }
                }

                goto LABEL_22;
              }
            }
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      a3 = v26;
    }
LABEL_22:

    v23 = [[SXTransitionDataSourceNode alloc] initWithComponentView:v11 transitionType:a3 usesThumbnail:v11 != 0];
    [(SXTransitionDataSourceProvider *)self setCurrentNode:v23];
  }
  v24 = [(SXTransitionDataSourceProvider *)self currentNode];
  return v24;
}

- (SXComponentController)componentController
{
  return self->_componentController;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (SXDocumentMetadataProviding)documentMetadataProvider
{
  return self->_documentMetadataProvider;
}

- (SXTransitionDataSourceNode)currentNode
{
  return self->_currentNode;
}

- (void)setCurrentNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_documentMetadataProvider, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_componentController, 0);
}

@end