@interface CMState
- (BOOL)isOffice12;
- (BOOL)isOnPhone;
- (BOOL)isThumbnail;
- (CMState)init;
- (OADColorMap)colorMap;
- (OADColorScheme)colorScheme;
- (OCDDocument)document;
- (id)componentByName:(id)a3;
- (id)getHtmlResource;
- (id)resourceUrlPrefix;
- (id)resources;
- (int64_t)textLevel;
- (unint64_t)sourceFormat;
- (void)copyFromCMStateWithoutComponents:(id)a3;
- (void)popTextLevel;
- (void)pushTextLevel;
- (void)setColorMap:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setComponentWithName:(id)a3 value:(id)a4;
- (void)setDocument:(id)a3;
- (void)setHtmlResource:(id)a3;
- (void)setIsOnPhone:(BOOL)a3;
- (void)setIsThumbnail:(BOOL)a3;
- (void)setResourceUrlPrefix:(id)a3;
- (void)setResources:(id)a3;
- (void)setSourceFormat:(unint64_t)a3;
@end

@implementation CMState

- (CMState)init
{
  v7.receiver = self;
  v7.super_class = (Class)CMState;
  v2 = [(CMState *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    components = v2->components;
    v2->components = v3;

    htmlResource = v2->htmlResource;
    v2->htmlResource = 0;

    v2->mSourceFormat = 0;
  }
  return v2;
}

- (void)setColorMap:(id)a3
{
}

- (void)setColorScheme:(id)a3
{
}

- (OADColorMap)colorMap
{
  return (OADColorMap *)objc_getProperty(self, a2, 40, 1);
}

- (OADColorScheme)colorScheme
{
  return (OADColorScheme *)objc_getProperty(self, a2, 48, 1);
}

- (id)resources
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setIsOnPhone:(BOOL)a3
{
  self->mIsOnPhone = a3;
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (void)pushTextLevel
{
}

- (void)popTextLevel
{
}

- (unint64_t)sourceFormat
{
  return self->mSourceFormat;
}

- (void)setResources:(id)a3
{
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (BOOL)isOffice12
{
  return (self->mSourceFormat < 7) & (0x54u >> self->mSourceFormat);
}

- (void)copyFromCMStateWithoutComponents:(id)a3
{
  id v11 = a3;
  v4 = [v11 getHtmlResource];
  [(CMState *)self setHtmlResource:v4];

  v5 = [v11 resourceUrlPrefix];
  mResourceUrlPrefix = self->mResourceUrlPrefix;
  self->mResourceUrlPrefix = v5;

  self->mSourceFormat = [v11 sourceFormat];
  objc_super v7 = [v11 colorScheme];
  mColorScheme = self->mColorScheme;
  self->mColorScheme = v7;

  v9 = [v11 colorMap];
  mColorMap = self->mColorMap;
  self->mColorMap = v9;
}

- (id)getHtmlResource
{
  return self->htmlResource;
}

- (void)setHtmlResource:(id)a3
{
}

- (id)resourceUrlPrefix
{
  return self->mResourceUrlPrefix;
}

- (id)componentByName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->components objectForKey:a3];
  return v3;
}

- (void)setComponentWithName:(id)a3 value:(id)a4
{
}

- (void)setResourceUrlPrefix:(id)a3
{
}

- (BOOL)isOnPhone
{
  return self->mIsOnPhone;
}

- (int64_t)textLevel
{
  return self->_textLevel;
}

- (void)setSourceFormat:(unint64_t)a3
{
  self->mSourceFormat = a3;
}

- (OCDDocument)document
{
  return (OCDDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mResources, 0);
  objc_storeStrong((id *)&self->mColorScheme, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mResourceUrlPrefix, 0);
  objc_storeStrong((id *)&self->htmlResource, 0);
  objc_storeStrong((id *)&self->components, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end