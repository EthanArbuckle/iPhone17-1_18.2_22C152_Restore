@interface SyntheticLongFusionPlist
- (id)getConfigForSceneMode:(id)a3;
@end

@implementation SyntheticLongFusionPlist

- (id)getConfigForSceneMode:(id)a3
{
  return [(NSDictionary *)self->slSceneModeDict objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->syntheticLongPedestal, 0);

  objc_storeStrong((id *)&self->slSceneModeDict, 0);
}

@end