@interface WFLinkFavoriteEntityAction
+ (id)overrideInputParameterName;
- (id)entityParameterName;
- (id)overrideDefaultValuesByParameter;
- (id)overrideLabelsByParameter;
@end

@implementation WFLinkFavoriteEntityAction

+ (id)overrideInputParameterName
{
  return @"entities";
}

- (id)overrideDefaultValuesByParameter
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"operation";
  v5[0] = @"add";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)overrideLabelsByParameter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFLinkEntityAction *)self entityName];

  if (v3)
  {
    v7 = @"entities";
    v4 = [(WFLinkEntityAction *)self entityName];
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)entityParameterName
{
  return @"entities";
}

@end