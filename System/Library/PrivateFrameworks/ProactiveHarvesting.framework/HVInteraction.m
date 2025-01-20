@interface HVInteraction
+ (id)domainIdForInteractionGroupId:(id)a3;
+ (id)uniqueIdForInteractionIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HVInteraction)initWithInteraction:(id)a3 bundleIdentifier:(id)a4;
- (INInteraction)interaction;
- (NSString)bundleId;
- (NSString)bundleIdentifier;
- (NSString)domainId;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation HVInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_interaction, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HVInteraction *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      interaction = self->_interaction;
      v7 = [(HVInteraction *)v5 interaction];
      if ([(INInteraction *)interaction isEqual:v7])
      {
        bundleIdentifier = self->_bundleIdentifier;
        v9 = [(HVInteraction *)v5 bundleIdentifier];
        char v10 = [(NSString *)bundleIdentifier isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HVInteraction alloc];
  v5 = (void *)[(INInteraction *)self->_interaction copy];
  v6 = (void *)[(NSString *)self->_bundleIdentifier copy];
  v7 = [(HVInteraction *)v4 initWithInteraction:v5 bundleIdentifier:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(INInteraction *)self->_interaction identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)bundleId
{
  return self->_bundleIdentifier;
}

- (NSString)domainId
{
  unint64_t v3 = [(INInteraction *)self->_interaction groupIdentifier];

  if (v3)
  {
    v4 = [(INInteraction *)self->_interaction groupIdentifier];
    v5 = +[HVInteraction domainIdForInteractionGroupId:v4];
  }
  else
  {
    v5 = @"__ProactiveHarvesting__.HVInteraction";
  }

  return (NSString *)v5;
}

- (NSString)uniqueId
{
  v2 = [(INInteraction *)self->_interaction identifier];
  unint64_t v3 = +[HVInteraction uniqueIdForInteractionIdentifier:v2];

  return (NSString *)v3;
}

- (double)absoluteTimestamp
{
  v2 = [(INInteraction *)self->_interaction dateInterval];
  unint64_t v3 = [v2 startDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (HVInteraction)initWithInteraction:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HVInteraction;
  v9 = [(HVInteraction *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interaction, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

+ (id)domainIdForInteractionGroupId:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = (void *)MEMORY[0x22A6667F0]();
  double v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"%."];
  v6 = [v5 invertedSet];

  id v7 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v6];
  v11[0] = @"__ProactiveHarvesting__.HVInteraction";
  v11[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v9 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @".");

  return v9;
}

+ (id)uniqueIdForInteractionIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x22A6667F0]();
  double v5 = [@"__ProactiveHarvesting__interactionIdentifier:" stringByAppendingString:v3];

  return v5;
}

@end