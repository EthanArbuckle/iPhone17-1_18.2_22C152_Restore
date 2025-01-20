@interface PXPlaceholder
+ (id)featureNotEnabledWithDocumentationURLString:(id)a3;
+ (id)featureNotImplementedWithTrackingRadar:(int64_t)a3;
- (NSString)fallbackActionTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)url;
- (PXPlaceholder)init;
- (PXPlaceholder)initWithTitle:(id)a3 subtitle:(id)a4 fallbackActionTitle:(id)a5 url:(id)a6;
- (PXPlaceholder)initWithTitle:(id)a3 trackingRadar:(int64_t)a4;
- (void)performFallbackAction;
@end

@implementation PXPlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fallbackActionTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)fallbackActionTitle
{
  return self->_fallbackActionTitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)performFallbackAction
{
  v2 = [(PXPlaceholder *)self url];
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PXPlaceholder_performFallbackAction__block_invoke;
  v5[3] = &unk_1E5DD2188;
  id v6 = v2;
  id v4 = v2;
  [v3 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:v5];
}

void __38__PXPlaceholder_performFallbackAction__block_invoke(uint64_t a1, char a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v9[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v5 = (void *)[v3 initWithActivityItems:v4 applicationActivities:0];

    id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    v7 = objc_msgSend(v6, "px_firstKeyWindow");
    v8 = [v7 rootViewController];
    objc_msgSend(v8, "px_presentOverTopmostPresentedViewController:animated:completion:", v5, 1, 0);
  }
}

- (PXPlaceholder)initWithTitle:(id)a3 subtitle:(id)a4 fallbackActionTitle:(id)a5 url:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPlaceholder;
  v14 = [(PXPlaceholder *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    fallbackActionTitle = v14->_fallbackActionTitle;
    v14->_fallbackActionTitle = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    url = v14->_url;
    v14->_url = (NSURL *)v21;
  }
  return v14;
}

- (PXPlaceholder)initWithTitle:(id)a3 trackingRadar:(int64_t)a4
{
  id v7 = a3;
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"Tracked with rdar://%ti", a4);
  v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"rdar://%ti", a4);
  id v11 = [v9 URLWithString:v10];

  if (!v11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPlaceholder.m", 47, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  id v12 = [(PXPlaceholder *)self initWithTitle:v7 subtitle:v8 fallbackActionTitle:@"Show Radar" url:v11];

  return v12;
}

- (PXPlaceholder)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlaceholder.m", 41, @"%s is not available as initializer", "-[PXPlaceholder init]");

  abort();
}

+ (id)featureNotEnabledWithDocumentationURLString:(id)a3
{
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PXPlaceholder.m", 36, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc((Class)a1) initWithTitle:@"Feature Not Enabled" subtitle:0 fallbackActionTitle:@"How To Enable" url:v5];

  return v6;
}

+ (id)featureNotImplementedWithTrackingRadar:(int64_t)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithTitle:@"Not Implemented Yet" trackingRadar:a3];
  return v3;
}

@end