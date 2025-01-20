@interface VUITVApplicationControllerContext
- (NSDictionary)launchOptions;
- (NSURL)javaScriptApplicationURL;
- (VUITVApplicationControllerContext)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setJavaScriptApplicationURL:(id)a3;
- (void)setLaunchOptions:(id)a3;
@end

@implementation VUITVApplicationControllerContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[VUITVApplicationControllerContext allocWithZone:a3] init];
  v5 = [(VUITVApplicationControllerContext *)self javaScriptApplicationURL];
  [(VUITVApplicationControllerContext *)v4 setJavaScriptApplicationURL:v5];

  v6 = [(VUITVApplicationControllerContext *)self launchOptions];
  [(VUITVApplicationControllerContext *)v4 setLaunchOptions:v6];

  return v4;
}

- (NSURL)javaScriptApplicationURL
{
  return self->_javaScriptApplicationURL;
}

- (void)setLaunchOptions:(id)a3
{
}

- (void)setJavaScriptApplicationURL:(id)a3
{
}

- (VUITVApplicationControllerContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUITVApplicationControllerContext;
  v2 = [(VUITVApplicationControllerContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    launchOptions = v2->_launchOptions;
    v2->_launchOptions = (NSDictionary *)v3;
  }
  return v2;
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_javaScriptApplicationURL, 0);
}

@end