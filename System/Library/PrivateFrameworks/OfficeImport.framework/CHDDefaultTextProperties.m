@interface CHDDefaultTextProperties
- (id)allTextDefaultProperties;
- (id)percentageTextDefaultProperties;
- (id)seriesTitlesTextDefaultProperties;
- (id)showLabelsTextDefaultProperties;
@end

@implementation CHDDefaultTextProperties

- (id)allTextDefaultProperties
{
  return [(EDKeyedCollection *)self objectWithKey:2];
}

- (id)showLabelsTextDefaultProperties
{
  return [(EDKeyedCollection *)self objectWithKey:0];
}

- (id)seriesTitlesTextDefaultProperties
{
  return [(EDKeyedCollection *)self objectWithKey:3];
}

- (id)percentageTextDefaultProperties
{
  return [(EDKeyedCollection *)self objectWithKey:1];
}

@end