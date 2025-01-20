@interface VUIMLFactory
+ (id)sharedInstance;
+ (void)_registerElements;
- (Class)collectionViewCellClassForElement:(id)a3;
- (VUIMLFactory)init;
- (id)URLForResource:(id)a3;
- (id)_URLForResource:(id)a3 inBundle:(id)a4;
- (id)imageForResource:(id)a3;
- (id)imageProxyForElement:(id)a3 withLayout:(id)a4;
- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4;
- (id)viewForElement:(id)a3 existingView:(id)a4;
@end

@implementation VUIMLFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25 != -1) {
    dispatch_once(&sharedInstance_onceToken_25, &__block_literal_global_112);
  }
  v2 = (void *)sharedInstance_factory;
  return v2;
}

void __30__VUIMLFactory_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_factory;
  sharedInstance_factory = v0;
}

- (VUIMLFactory)init
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMLFactory;
  v2 = [(VUIMLFactory *)&v4 init];
  if (v2) {
    +[VUIMLFactory _registerElements];
  }
  return v2;
}

+ (void)_registerElements
{
  [MEMORY[0x1E4FA9C80] registerIKClass:objc_opt_class() forElementName:@"confirmationCardTemplate" elementType:4037 dependent:0];
  [MEMORY[0x1E4FA9C80] registerIKClass:objc_opt_class() forElementName:@"upsellOfferTemplate" elementType:4030 dependent:0];
  [MEMORY[0x1E4FA9C80] registerIKClass:objc_opt_class() forElementName:*MEMORY[0x1E4FA9D20] elementType:36 dependent:0];
  [MEMORY[0x1E4FA9C80] registerIKClass:objc_opt_class() forElementName:@"timeline" elementType:4020 dependent:0];
  v2 = (void *)MEMORY[0x1E4FA9C80];
  uint64_t v3 = objc_opt_class();
  [v2 registerIKClass:v3 forElementName:@"event" elementType:4021 dependent:0];
}

- (id)viewForElement:(id)a3 existingView:(id)a4
{
  return 0;
}

- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4
{
  return 0;
}

- (Class)collectionViewCellClassForElement:(id)a3
{
  return 0;
}

- (id)imageProxyForElement:(id)a3 withLayout:(id)a4
{
  return 0;
}

- (id)URLForResource:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    v6 = [(VUIMLFactory *)self _URLForResource:v4 inBundle:v5];
    if (!v6)
    {
      v7 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [(VUIMLFactory *)self _URLForResource:v4 inBundle:v7];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageForResource:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    v5 = [MEMORY[0x1E4FB1818] imageNamed:v3 inBundle:v4];
    if (!v5)
    {
      v6 = [MEMORY[0x1E4F28B50] mainBundle];
      v5 = [MEMORY[0x1E4FB1818] imageNamed:v3 inBundle:v6];

      if (!v5)
      {
        v5 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_URLForResource:(id)a3 inBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 pathForResource:v5 ofType:@"png"];
  if (!v7)
  {
    v7 = [v6 pathForResource:v5 ofType:@"jpeg"];
  }
  if ([v7 length])
  {
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end