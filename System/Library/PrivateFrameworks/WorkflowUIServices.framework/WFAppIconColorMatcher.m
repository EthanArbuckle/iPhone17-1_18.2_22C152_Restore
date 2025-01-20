@interface WFAppIconColorMatcher
- (NSString)bundleIdentifier;
- (WFAppIconColorMatcher)initWithBundleIdentifier:(id)a3;
- (WFMatchedAppIconColorData)cachedColor;
- (id)matchedColor;
- (void)setBundleIdentifier:(id)a3;
- (void)setCachedColor:(id)a3;
@end

@implementation WFAppIconColorMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setCachedColor:(id)a3
{
}

- (WFMatchedAppIconColorData)cachedColor
{
  return self->_cachedColor;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)matchedColor
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = [(WFAppIconColorMatcher *)self cachedColor];

  if (v3)
  {
    v4 = [(WFAppIconColorMatcher *)self cachedColor];
  }
  else
  {
    v5 = (void *)MEMORY[0x263F85308];
    v6 = [(WFAppIconColorMatcher *)self bundleIdentifier];
    v7 = [v5 applicationIconImageForBundleIdentifier:v6];

    v8 = +[WFJoeColorUtility colorForImage:v7];
    v11[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

    v4 = [[WFMatchedAppIconColorData alloc] initWithColors:v9];
    objc_storeStrong((id *)&self->_cachedColor, v4);
  }
  return v4;
}

- (WFAppIconColorMatcher)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAppIconColorMatcher;
  v6 = [(WFAppIconColorMatcher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

@end