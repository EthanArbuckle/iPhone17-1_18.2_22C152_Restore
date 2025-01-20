@interface STUIMutableDataAccessStatusDomainData
- (STMutableListData)attributionListData;
- (STUIMutableDataAccessStatusDomainData)initWithAttributionListData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDataAccessAttributions:(id)a3;
@end

@implementation STUIMutableDataAccessStatusDomainData

- (STMutableListData)attributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STUIMutableDataAccessStatusDomainData;
  v2 = [(STUIDataAccessStatusDomainData *)&v4 attributionListData];
  return (STMutableListData *)v2;
}

- (void)setDataAccessAttributions:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STUIMutableDataAccessStatusDomainData *)self attributionListData];
    if (self)
    {
      self = [v4 sortedArrayUsingComparator:&__block_literal_global_24];
    }

    [v5 setObjects:self];
  }
}

- (STUIMutableDataAccessStatusDomainData)initWithAttributionListData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v7.receiver = self;
  v7.super_class = (Class)STUIMutableDataAccessStatusDomainData;
  id v5 = [(STUIDataAccessStatusDomainData *)&v7 _initWithAttributionListData:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[STUIDataAccessStatusDomainData allocWithZone:a3];
  return [(STUIDataAccessStatusDomainData *)v4 initWithData:self];
}

@end