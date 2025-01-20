@interface STMutableCallingStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (STMutableCallingStatusDomainData)initWithCallDescriptorListData:(id)a3;
- (STMutableListData)callDescriptorListData;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addActiveCallAttribution:(id)a3;
- (void)addActiveVideoConferenceAttribution:(id)a3;
- (void)addCallDescriptor:(id)a3;
- (void)addRingingCallAttribution:(id)a3;
- (void)addRingingVideoConferenceAttribution:(id)a3;
- (void)removeActiveCallAttribution:(id)a3;
- (void)removeActiveVideoConferenceAttribution:(id)a3;
- (void)removeCallDescriptor:(id)a3;
- (void)removeRingingCallAttribution:(id)a3;
- (void)removeRingingVideoConferenceAttribution:(id)a3;
- (void)setActiveCallAttributions:(id)a3;
- (void)setActiveVideoConferenceAttributions:(id)a3;
- (void)setCallDescriptors:(id)a3;
- (void)setRingingCallAttributions:(id)a3;
- (void)setRingingVideoConferenceAttributions:(id)a3;
@end

@implementation STMutableCallingStatusDomainData

- (STMutableCallingStatusDomainData)initWithCallDescriptorListData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  v7.receiver = self;
  v7.super_class = (Class)STMutableCallingStatusDomainData;
  v5 = [(STCallingStatusDomainData *)&v7 _initWithCallDescriptorListData:v4];

  return v5;
}

- (void)setCallDescriptors:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    [v5 setObjects:v4];
  }
}

- (void)addCallDescriptor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    [v5 addObject:v4];
  }
}

- (void)removeCallDescriptor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    [v5 removeObject:v4];
  }
}

- (void)setActiveCallAttributions:(id)a3
{
  id v4 = a3;
  -[STCallingStatusDomainData _activeAudioCallDescriptors](self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 allObjects];

  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_128);

  if (([v10 isEqualToArray:v6] & 1) == 0)
  {
    objc_super v7 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v8 = [v7 objects];
    v9 = (void *)[v8 mutableCopy];

    [v9 removeObjectsInArray:v10];
    [v9 addObjectsFromArray:v6];
    [v7 setObjects:v9];
  }
}

id __62__STMutableCallingStatusDomainData_setActiveCallAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:0];
}

- (void)addActiveCallAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:0];
    [v4 addObject:v3];
  }
}

- (void)removeActiveCallAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:0];
    [v4 removeObject:v3];
  }
}

- (void)setRingingCallAttributions:(id)a3
{
  id v4 = a3;
  -[STCallingStatusDomainData _ringingAudioCallDescriptors](self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 allObjects];

  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_130);

  if (([v10 isEqualToArray:v6] & 1) == 0)
  {
    objc_super v7 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v8 = [v7 objects];
    v9 = (void *)[v8 mutableCopy];

    [v9 removeObjectsInArray:v10];
    [v9 addObjectsFromArray:v6];
    [v7 setObjects:v9];
  }
}

id __63__STMutableCallingStatusDomainData_setRingingCallAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:1];
}

- (void)addRingingCallAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:1];
    [v4 addObject:v3];
  }
}

- (void)removeRingingCallAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:1];
    [v4 removeObject:v3];
  }
}

- (void)setActiveVideoConferenceAttributions:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = [(STCallingStatusDomainData *)self callDescriptors];
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_23_1);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  v6 = [v4 allObjects];

  objc_super v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_132);

  if (([v11 isEqualToArray:v7] & 1) == 0)
  {
    v8 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v9 = [v8 objects];
    id v10 = (void *)[v9 mutableCopy];

    [v10 removeObjectsInArray:v11];
    [v10 addObjectsFromArray:v7];
    [v8 setObjects:v10];
  }
}

id __73__STMutableCallingStatusDomainData_setActiveVideoConferenceAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:0];
}

- (void)addActiveVideoConferenceAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:0];
    [v4 addObject:v3];
  }
}

- (void)removeActiveVideoConferenceAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:0];
    [v4 removeObject:v3];
  }
}

- (void)setRingingVideoConferenceAttributions:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = [(STCallingStatusDomainData *)self callDescriptors];
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_25);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  v6 = [v4 allObjects];

  objc_super v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_134);

  if (([v11 isEqualToArray:v7] & 1) == 0)
  {
    v8 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v9 = [v8 objects];
    id v10 = (void *)[v9 mutableCopy];

    [v10 removeObjectsInArray:v11];
    [v10 addObjectsFromArray:v7];
    [v8 setObjects:v10];
  }
}

id __74__STMutableCallingStatusDomainData_setRingingVideoConferenceAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:1];
}

- (void)addRingingVideoConferenceAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:1];
    [v4 addObject:v3];
  }
}

- (void)removeRingingVideoConferenceAttribution:(id)a3
{
  if (a3)
  {
    id v4 = [(STMutableCallingStatusDomainData *)self callDescriptorListData];
    v3 = +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:1];
    [v4 removeObject:v3];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[STCallingStatusDomainData allocWithZone:a3];

  return [(STCallingStatusDomainData *)v4 initWithData:self];
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

- (STMutableListData)callDescriptorListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableCallingStatusDomainData;
  v2 = [(STCallingStatusDomainData *)&v4 callDescriptorListData];

  return (STMutableListData *)v2;
}

@end