@interface STMutableBackgroundActivitiesStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (STMutableBackgroundActivitiesStatusDomainData)initWithBackgroundActivitiesAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4;
- (STMutableDictionaryData)visualDescriptorsByIdentifierDictionaryData;
- (STMutableListData)backgroundActivitiesAttributionListData;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAttribution:(id)a3;
- (void)removeAttribution:(id)a3;
- (void)setAttributions:(id)a3;
- (void)setVisualDescriptor:(id)a3 forBackgroundActivityWithIdentifier:(id)a4;
@end

@implementation STMutableBackgroundActivitiesStatusDomainData

- (STMutableBackgroundActivitiesStatusDomainData)initWithBackgroundActivitiesAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  v8 = (void *)[v6 mutableCopy];

  v11.receiver = self;
  v11.super_class = (Class)STMutableBackgroundActivitiesStatusDomainData;
  v9 = [(STBackgroundActivitiesStatusDomainData *)&v11 _initWithBackgroundActivitiesAttributionListData:v7 visualDescriptorsByIdentifierDictionaryData:v8];

  return v9;
}

- (void)setAttributions:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableBackgroundActivitiesStatusDomainData *)self backgroundActivitiesAttributionListData];
    [v5 setObjects:v4];
  }
}

- (void)addAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableBackgroundActivitiesStatusDomainData *)self backgroundActivitiesAttributionListData];
    [v5 addObject:v4];
  }
}

- (void)removeAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableBackgroundActivitiesStatusDomainData *)self backgroundActivitiesAttributionListData];
    [v5 removeObject:v4];
  }
}

- (void)setVisualDescriptor:(id)a3 forBackgroundActivityWithIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(STMutableBackgroundActivitiesStatusDomainData *)self visualDescriptorsByIdentifierDictionaryData];
  v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[STBackgroundActivitiesStatusDomainData allocWithZone:a3];

  return [(STBackgroundActivitiesStatusDomainData *)v4 initWithData:self];
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableData:self];
  }

  return isKindOfClass & 1;
}

- (STMutableListData)backgroundActivitiesAttributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableBackgroundActivitiesStatusDomainData;
  v2 = [(STBackgroundActivitiesStatusDomainData *)&v4 backgroundActivitiesAttributionListData];

  return (STMutableListData *)v2;
}

- (STMutableDictionaryData)visualDescriptorsByIdentifierDictionaryData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableBackgroundActivitiesStatusDomainData;
  v2 = [(STBackgroundActivitiesStatusDomainData *)&v4 visualDescriptorsByIdentifierDictionaryData];

  return (STMutableDictionaryData *)v2;
}

@end