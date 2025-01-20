@interface SXInsertedAdComponent
- (BOOL)hidden;
- (NSString)identifier;
- (NSString)layout;
- (NSString)placementIdentifier;
- (NSString)style;
- (NSString)type;
- (SXComponentAnchor)anchor;
- (SXComponentAnimation)animation;
- (SXComponentClassification)classification;
- (SXComponentConditions)conditions;
- (SXInsertedAdComponent)initWithAdType:(unint64_t)a3;
- (SXJSONArray)additions;
- (SXJSONArray)behaviors;
- (SXJSONDictionary)advertising;
- (SXJSONDictionary)analytics;
- (UIColor)debugColor;
- (int)role;
- (unint64_t)adType;
- (unint64_t)contentRelevance;
- (unint64_t)placementType;
- (unint64_t)traits;
- (void)setAnchor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation SXInsertedAdComponent

- (SXInsertedAdComponent)initWithAdType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXInsertedAdComponent;
  v4 = [(SXInsertedAdComponent *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_adType = a3;
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    placementIdentifier = v5->_placementIdentifier;
    v5->_placementIdentifier = (NSString *)v7;
  }
  return v5;
}

- (NSString)type
{
  return (NSString *)@"advertisement";
}

- (int)role
{
  return 34;
}

- (unint64_t)contentRelevance
{
  return 1;
}

- (SXComponentClassification)classification
{
  v2 = [(SXInsertedAdComponent *)self type];
  v3 = +[SXComponentClassification classificationForComponentWithType:v2];

  return (SXComponentClassification *)v3;
}

- (unint64_t)traits
{
  return 16;
}

- (UIColor)debugColor
{
  return (UIColor *)[MEMORY[0x263F1C550] cyanColor];
}

- (unint64_t)placementType
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (SXComponentAnimation)animation
{
  return self->_animation;
}

- (SXJSONArray)behaviors
{
  return self->_behaviors;
}

- (unint64_t)adType
{
  return self->_adType;
}

- (NSString)placementIdentifier
{
  return self->_placementIdentifier;
}

- (NSString)style
{
  return self->_style;
}

- (SXComponentAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (SXComponentConditions)conditions
{
  return self->_conditions;
}

- (SXJSONDictionary)advertising
{
  return self->_advertising;
}

- (SXJSONDictionary)analytics
{
  return self->_analytics;
}

- (SXJSONArray)additions
{
  return self->_additions;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_advertising, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_placementIdentifier, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end