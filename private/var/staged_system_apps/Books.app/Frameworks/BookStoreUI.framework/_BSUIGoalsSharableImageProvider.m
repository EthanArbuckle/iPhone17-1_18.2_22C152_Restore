@interface _BSUIGoalsSharableImageProvider
- (_BSUIGoalsSharableImageProvider)initWithSharableImage:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation _BSUIGoalsSharableImageProvider

- (_BSUIGoalsSharableImageProvider)initWithSharableImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BSUIGoalsSharableImageProvider;
  v6 = [(_BSUIGoalsSharableImageProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sharedImage, a3);
  }

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeMail]) {
    id v5 = 0;
  }
  else {
    id v5 = self->_sharedImage;
  }

  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = objc_alloc_init((Class)UIImage);

  return v3;
}

- (void).cxx_destruct
{
}

@end