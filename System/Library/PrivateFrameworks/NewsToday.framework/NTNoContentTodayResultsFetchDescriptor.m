@interface NTNoContentTodayResultsFetchDescriptor
- (Class)descriptorsOperationClass;
- (Class)fetchOperationClass;
- (NSString)sourceIdentifier;
- (NTNoContentTodayResultsFetchDescriptor)init;
- (id)placeholderSectionDescriptorsWithContentRequest:(id)a3;
@end

@implementation NTNoContentTodayResultsFetchDescriptor

- (NTNoContentTodayResultsFetchDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTNoContentTodayResultsFetchDescriptor;
  return [(NTNoContentTodayResultsFetchDescriptor *)&v3 init];
}

- (NSString)sourceIdentifier
{
  return (NSString *)@"unknown";
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
  id v3 = a3;
  v4 = objc_alloc_init(NTNewsTodayResultsFetchDescriptor);
  v5 = [(NTNewsTodayResultsFetchDescriptor *)v4 placeholderSectionDescriptorsWithContentRequest:v3];

  return v5;
}

@end