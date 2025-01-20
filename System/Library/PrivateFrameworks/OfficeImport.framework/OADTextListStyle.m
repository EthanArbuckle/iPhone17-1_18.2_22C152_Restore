@interface OADTextListStyle
+ (id)defaultObject;
- (NSString)language;
- (OADTextListStyle)init;
- (OADTextListStyle)initWithDefaults;
- (id)defaultProperties;
- (id)description;
- (id)propertiesForListLevel:(unint64_t)a3;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)enumerateParagraphPropertiesUsingBlock:(id)a3;
- (void)flatten;
- (void)overrideWithTextStyle:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setLanguage:(id)a3;
- (void)setParentTextListStyle:(id)a3;
- (void)setPropertiesForListLevel:(unint64_t)a3 properties:(id)a4;
@end

@implementation OADTextListStyle

- (OADTextListStyle)initWithDefaults
{
  v8.receiver = self;
  v8.super_class = (Class)OADTextListStyle;
  v2 = [(OADTextListStyle *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    mParagraphProperties = v2->mParagraphProperties;
    v2->mParagraphProperties = (NSMutableArray *)v3;

    int v5 = 10;
    do
    {
      v6 = [[OADParagraphProperties alloc] initWithDefaults];
      [(NSMutableArray *)v2->mParagraphProperties addObject:v6];

      --v5;
    }
    while (v5);
  }
  return v2;
}

- (id)propertiesForListLevel:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mParagraphProperties objectAtIndex:a3 + 1];
}

- (OADTextListStyle)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADTextListStyle;
  v2 = [(OADTextListStyle *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    mParagraphProperties = v2->mParagraphProperties;
    v2->mParagraphProperties = (NSMutableArray *)v3;

    int v5 = 10;
    do
    {
      v6 = objc_alloc_init(OADParagraphProperties);
      [(NSMutableArray *)v2->mParagraphProperties addObject:v6];

      --v5;
    }
    while (v5);
  }
  return v2;
}

- (void)setParentTextListStyle:(id)a3
{
  id v9 = a3;
  v4 = [(OADTextListStyle *)self defaultProperties];
  int v5 = [v9 defaultProperties];
  [v4 setParent:v5];

  for (uint64_t i = 0; i != 9; ++i)
  {
    v7 = [(OADTextListStyle *)self propertiesForListLevel:i];
    objc_super v8 = [v9 propertiesForListLevel:i];
    [v7 setParent:v8];
  }
}

- (id)defaultProperties
{
  return (id)[(NSMutableArray *)self->mParagraphProperties objectAtIndex:0];
}

- (void)removeUnnecessaryOverrides
{
  for (uint64_t i = 0; i != 9; ++i)
  {
    v4 = [(OADTextListStyle *)self propertiesForListLevel:i];
    [v4 removeUnnecessaryOverrides];
  }
}

- (void)overrideWithTextStyle:(id)a3
{
  id v7 = a3;
  for (uint64_t i = 0; i != 9; ++i)
  {
    int v5 = [(OADTextListStyle *)self propertiesForListLevel:i];
    v6 = [v7 propertiesForListLevel:i];
    [v5 overrideWithProperties:v6];
  }
}

+ (id)defaultObject
{
  v2 = (void *)+[OADTextListStyle defaultObject]::defaultObject;
  if (!+[OADTextListStyle defaultObject]::defaultObject)
  {
    uint64_t v3 = [[OADTextListStyle alloc] initWithDefaults];
    v4 = (void *)+[OADTextListStyle defaultObject]::defaultObject;
    +[OADTextListStyle defaultObject]::defaultObject = (uint64_t)v3;

    v2 = (void *)+[OADTextListStyle defaultObject]::defaultObject;
  }
  return v2;
}

- (void)setPropertiesForListLevel:(unint64_t)a3 properties:(id)a4
{
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v9 = a3;
  v4 = [(OADTextListStyle *)self defaultProperties];
  int v5 = [v9 defaultProperties];
  [v4 changeParentPreservingEffectiveValues:v5];

  for (uint64_t i = 0; i != 9; ++i)
  {
    id v7 = [(OADTextListStyle *)self propertiesForListLevel:i];
    objc_super v8 = [v9 propertiesForListLevel:i];
    [v7 changeParentPreservingEffectiveValues:v8];
  }
}

- (void)flatten
{
  for (uint64_t i = 0; i != 9; ++i)
  {
    v4 = [(OADTextListStyle *)self propertiesForListLevel:i];
    [v4 flatten];
  }
}

- (void)enumerateParagraphPropertiesUsingBlock:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTextListStyle;
  v2 = [(OADTextListStyle *)&v4 description];
  return v2;
}

- (NSString)language
{
  return self->mLanguage;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLanguage, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
}

@end