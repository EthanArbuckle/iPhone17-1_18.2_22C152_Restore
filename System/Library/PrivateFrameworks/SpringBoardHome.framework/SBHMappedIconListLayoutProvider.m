@interface SBHMappedIconListLayoutProvider
- (SBHMappedIconListLayoutProvider)initWithTargetListLayoutProvider:(id)a3;
- (SBIconListLayoutProvider)targetListLayoutProvider;
- (id)layoutForIconLocation:(id)a3;
- (void)mapIconLocation:(id)a3 toIconLocation:(id)a4;
@end

@implementation SBHMappedIconListLayoutProvider

- (SBHMappedIconListLayoutProvider)initWithTargetListLayoutProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHMappedIconListLayoutProvider;
  v6 = [(SBHMappedIconListLayoutProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_targetListLayoutProvider, a3);
  }

  return v7;
}

- (void)mapIconLocation:(id)a3 toIconLocation:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  mappedIconLocations = self->_mappedIconLocations;
  if (!mappedIconLocations)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v9 = self->_mappedIconLocations;
    self->_mappedIconLocations = v8;

    mappedIconLocations = self->_mappedIconLocations;
  }
  [(NSMutableDictionary *)mappedIconLocations setObject:v6 forKey:v10];
}

- (id)layoutForIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_mappedIconLocations objectForKey:v4];
  if (!v5) {
    id v5 = v4;
  }
  id v6 = [(SBHMappedIconListLayoutProvider *)self targetListLayoutProvider];
  v7 = [v6 layoutForIconLocation:v5];

  return v7;
}

- (SBIconListLayoutProvider)targetListLayoutProvider
{
  return self->_targetListLayoutProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetListLayoutProvider, 0);
  objc_storeStrong((id *)&self->_mappedIconLocations, 0);
}

@end