@interface PXStoryRelatedResult
- (NSArray)storyConfigurations;
- (NSString)debugInfo;
- (PXStoryRelatedResult)initWithStoryConfigurations:(id)a3 debugInfo:(id)a4;
@end

@implementation PXStoryRelatedResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_storyConfigurations, 0);
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (NSArray)storyConfigurations
{
  return self->_storyConfigurations;
}

- (PXStoryRelatedResult)initWithStoryConfigurations:(id)a3 debugInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryRelatedResult;
  v8 = [(PXStoryRelatedResult *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    storyConfigurations = v8->_storyConfigurations;
    v8->_storyConfigurations = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_debugInfo, a4);
  }

  return v8;
}

@end