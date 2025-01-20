@interface PXStoryColorGradingCubeInfo
- (BOOL)isAutoSelectable;
- (BOOL)isUserSelectable;
- (NSArray)categories;
- (NSString)name;
- (NSString)resource;
- (NSString)tier;
- (PXStoryColorGradingCubeInfo)init;
- (PXStoryColorGradingCubeInfo)initWithDictionary:(id)a3;
@end

@implementation PXStoryColorGradingCubeInfo

- (NSString)resource
{
  return (NSString *)[(NSDictionary *)self->_backingDict objectForKeyedSubscript:@"resource"];
}

- (PXStoryColorGradingCubeInfo)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryColorGradingCubeInfo;
  v6 = [(PXStoryColorGradingCubeInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingDict, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (NSArray)categories
{
  return (NSArray *)[(NSDictionary *)self->_backingDict objectForKeyedSubscript:@"categories"];
}

- (BOOL)isUserSelectable
{
  v2 = [(NSDictionary *)self->_backingDict objectForKeyedSubscript:@"user-selectable"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isAutoSelectable
{
  v2 = [(NSDictionary *)self->_backingDict objectForKeyedSubscript:@"auto-selectable"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)tier
{
  return (NSString *)[(NSDictionary *)self->_backingDict objectForKeyedSubscript:@"tier"];
}

- (NSString)name
{
  return (NSString *)[(NSDictionary *)self->_backingDict objectForKeyedSubscript:@"name"];
}

- (PXStoryColorGradingCubeInfo)init
{
  return [(PXStoryColorGradingCubeInfo *)self initWithDictionary:&unk_1F02DB810];
}

@end