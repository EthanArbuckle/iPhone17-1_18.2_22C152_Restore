@interface NTNewsTodayResultsFetchDescriptor
- (Class)descriptorsOperationClass;
- (Class)fetchOperationClass;
- (NSString)sourceIdentifier;
- (NTNewsTodayResultsFetchDescriptor)init;
- (id)placeholderSectionDescriptorsWithContentRequest:(id)a3;
@end

@implementation NTNewsTodayResultsFetchDescriptor

- (NSString)sourceIdentifier
{
  return (NSString *)@"news";
}

- (NTNewsTodayResultsFetchDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTNewsTodayResultsFetchDescriptor;
  return [(NTNewsTodayResultsFetchDescriptor *)&v3 init];
}

- (Class)descriptorsOperationClass
{
  return (Class)objc_opt_class();
}

- (Class)fetchOperationClass
{
  return (Class)objc_opt_class();
}

- (id)placeholderSectionDescriptorsWithContentRequest:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 moduleDescriptorType];
  if (v4 == 1)
  {
    v10 = [NTSectionPlaceholderDescriptor alloc];
    v5 = [v3 name];
    v6 = [v3 nameColorLight];
    v7 = [v3 nameColorDark];
    v8 = [v3 tagID];
    v11 = [(NTSectionPlaceholderDescriptor *)v10 initWithName:v5 nameColorLight:v6 nameColorDark:v7 minimumStoriesAllocation:0 maximumStoriesAllocation:-1 backingTagID:v8];
    v13 = v11;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];

    goto LABEL_5;
  }
  if (!v4)
  {
    v5 = __85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke();
    v6 = __85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke_2();
    v7 = [[NTSectionPlaceholderDescriptor alloc] initWithName:v5 nameColorLight:@"FF2D54" nameColorDark:@"FF375F" minimumStoriesAllocation:1 maximumStoriesAllocation:2 backingTagID:0];
    v14[0] = v7;
    v8 = [[NTSectionPlaceholderDescriptor alloc] initWithName:v6 nameColorLight:@"ff8e00" nameColorDark:0 minimumStoriesAllocation:1 maximumStoriesAllocation:-1 backingTagID:0];
    v14[1] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
LABEL_5:

    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x263EFFA68];
LABEL_7:

  return v9;
}

__CFString *__85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke()
{
  v0 = [MEMORY[0x263F59350] sharedAccount];
  uint64_t v1 = [v0 dynamicSupportedContentLanguage];

  if (v1) {
    return @"À la une";
  }
  else {
    return @"Top Stories";
  }
}

__CFString *__85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke_2()
{
  v0 = [MEMORY[0x263F59350] sharedAccount];
  uint64_t v1 = [v0 dynamicSupportedContentLanguage];

  if (v1) {
    return @"Populaires";
  }
  else {
    return @"Trending";
  }
}

@end