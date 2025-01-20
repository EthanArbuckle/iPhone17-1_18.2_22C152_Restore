@interface OADDrawableCategoryDefaults
- (OADDrawableCategoryDefaults)init;
- (OADDrawableCategoryDefaults)initWithDefaults;
- (id)description;
- (id)shapeProperties;
- (id)textBodyProperties;
- (id)textListStyle;
- (void)setShapeProperties:(id)a3;
- (void)setTextBodyProperties:(id)a3;
- (void)setTextListStyle:(id)a3;
@end

@implementation OADDrawableCategoryDefaults

- (OADDrawableCategoryDefaults)init
{
  v10.receiver = self;
  v10.super_class = (Class)OADDrawableCategoryDefaults;
  v2 = [(OADDrawableCategoryDefaults *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADShapeProperties);
    mShapeProperties = v2->mShapeProperties;
    v2->mShapeProperties = v3;

    v5 = objc_alloc_init(OADTextBodyProperties);
    mTextBodyProperties = v2->mTextBodyProperties;
    v2->mTextBodyProperties = v5;

    v7 = objc_alloc_init(OADTextListStyle);
    mTextListStyle = v2->mTextListStyle;
    v2->mTextListStyle = v7;
  }
  return v2;
}

- (OADDrawableCategoryDefaults)initWithDefaults
{
  v10.receiver = self;
  v10.super_class = (Class)OADDrawableCategoryDefaults;
  v2 = [(OADDrawableCategoryDefaults *)&v10 init];
  if (v2)
  {
    v3 = [(OADGraphicProperties *)[OADShapeProperties alloc] initWithDefaults];
    mShapeProperties = v2->mShapeProperties;
    v2->mShapeProperties = v3;

    v5 = [[OADTextBodyProperties alloc] initWithDefaults];
    mTextBodyProperties = v2->mTextBodyProperties;
    v2->mTextBodyProperties = v5;

    v7 = [[OADTextListStyle alloc] initWithDefaults];
    mTextListStyle = v2->mTextListStyle;
    v2->mTextListStyle = v7;
  }
  return v2;
}

- (void)setShapeProperties:(id)a3
{
}

- (id)shapeProperties
{
  return self->mShapeProperties;
}

- (void)setTextBodyProperties:(id)a3
{
}

- (id)textBodyProperties
{
  return self->mTextBodyProperties;
}

- (void)setTextListStyle:(id)a3
{
}

- (id)textListStyle
{
  return self->mTextListStyle;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADDrawableCategoryDefaults;
  v2 = [(OADDrawableCategoryDefaults *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextListStyle, 0);
  objc_storeStrong((id *)&self->mTextBodyProperties, 0);
  objc_storeStrong((id *)&self->mShapeProperties, 0);
}

@end