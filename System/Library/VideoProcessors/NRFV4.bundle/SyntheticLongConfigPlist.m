@interface SyntheticLongConfigPlist
- (id)getConfigForFusionType:(id)a3;
@end

@implementation SyntheticLongConfigPlist

- (id)getConfigForFusionType:(id)a3
{
  return [(NSDictionary *)self->fusionTypeDict objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end