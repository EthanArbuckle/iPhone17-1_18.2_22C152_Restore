@interface JSAShare
+ (void)shareURL:(id)a3 fromViewController:(id)a4 options:(id)a5 completionHandler:(id)a6;
+ (void)shareURL:(id)a3 fromViewController:(id)a4 sourceView:(id)a5 sourceBarButtonItem:(id)a6;
- (JSValue)callback;
- (NSDictionary)options;
- (UIViewController)presentingViewController;
- (id)activityItem;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(void *)a1;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setActivityItem:(id)a3;
- (void)setCallback:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation JSAShare

+ (void)shareURL:(id)a3 fromViewController:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v13 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = +[NSURL URLWithString:a3];
  if (v12) {
    sub_D07C((uint64_t)a1, v12, v13, v10, v11);
  }
}

+ (void)shareURL:(id)a3 fromViewController:(id)a4 sourceView:(id)a5 sourceBarButtonItem:(id)a6
{
  id v15 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = +[NSURL URLWithString:a3];
  if (v12)
  {
    id v13 = objc_opt_new();
    v14 = v13;
    if (v10) {
      [v13 setObject:v10 forKeyedSubscript:@"sourceView"];
    }
    if (v11) {
      [v14 setObject:v11 forKeyedSubscript:@"sourceBarButtonItem"];
    }
    sub_D07C((uint64_t)a1, v12, v15, v14, 0);
  }
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = objc_alloc_init((Class)NSString);

  return v3;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v5 = [(JSAShare *)self options];
  v6 = [v5 objectForKeyedSubscript:@"linkPresentation"];
  if (v6)
  {
    v7 = [(JSAShare *)self options];
    v8 = [v7 objectForKeyedSubscript:@"linkPresentation"];
    v9 = [v8 objectForKeyedSubscript:@"title"];
    if (v9)
    {
      id v10 = [(JSAShare *)self options];
      id v11 = [v10 objectForKeyedSubscript:@"linkPresentation"];
      v12 = [v11 objectForKeyedSubscript:@"title"];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)activityViewControllerLinkPresentationMetadata:(void *)a1
{
  if (a1)
  {
    id v2 = objc_alloc_init((Class)LPLinkMetadata);
    id v3 = [a1 options];
    v4 = [v3 objectForKeyedSubscript:@"linkPresentation"];
    v5 = [v4 objectForKeyedSubscript:@"title"];
    [v2 setTitle:v5];

    v6 = [a1 options];
    v7 = [v6 objectForKeyedSubscript:@"linkPresentation"];
    v8 = [v7 objectForKeyedSubscript:@"summary"];
    [v2 setSummary:v8];

    v9 = [a1 options];
    id v10 = [v9 objectForKeyedSubscript:@"linkPresentation"];
    id v11 = [v10 objectForKeyedSubscript:@"imageUrl"];

    v12 = [a1 options];
    id v13 = [v12 objectForKeyedSubscript:@"linkPresentation"];
    v14 = [v13 objectForKeyedSubscript:@"artworkUrl"];

    if (v14)
    {
      id v15 = [a1 options];
      v16 = [v15 objectForKeyedSubscript:@"linkPresentation"];
      v17 = [v16 objectForKeyedSubscript:@"artworkAspect"];

      if (v17)
      {
        [v17 floatValue];
        double v19 = v18 * 80.0;
      }
      else
      {
        double v19 = 80.0;
      }
      [v14 jsa_normalizedArtworkURLOfSize:@"jpg" withFormat:v19];
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = +[NSURL URLWithString:v27];
      if (v28)
      {
        v29 = sub_DCDC((uint64_t)a1, v28);
        v30 = objc_opt_new();
        id v31 = [objc_alloc((Class)LPImage) initWithItemProvider:v29 properties:v30 placeholderImage:0];
        [v2 setImage:v31];
      }
    }
    else
    {
      if (!v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      v20 = +[NSURL URLWithString:v11];
      v17 = v20;
      if (!v20)
      {
LABEL_16:

        goto LABEL_17;
      }
      if ([v20 isFileURL])
      {
        v21 = [a1 options];
        v22 = [v21 objectForKeyedSubscript:@"linkPresentation"];
        uint64_t v23 = [v22 objectForKeyedSubscript:@"imageMIMEType"];
        v24 = (void *)v23;
        v25 = @"image/png";
        if (v23) {
          v25 = (__CFString *)v23;
        }
        v26 = v25;

        id v27 = [objc_alloc((Class)LPImage) initByReferencingFileURL:v17 MIMEType:v26];
        [v2 setImage:v27];
      }
      else
      {
        sub_DCDC((uint64_t)a1, v17);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v33 = [objc_alloc((Class)LPImage) initWithItemProvider:v27 properties:0 placeholderImage:0];
        [v2 setImage:v33];
      }
    }

    goto LABEL_16;
  }
  id v2 = 0;
LABEL_18:

  return v2;
}

- (id)activityItem
{
  return self->_activityItem;
}

- (void)setActivityItem:(id)a3
{
}

- (JSValue)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_callback, 0);

  objc_storeStrong(&self->_activityItem, 0);
}

@end