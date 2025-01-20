@interface FCPersonalizationTodaySectionMapping
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationTodaySectionMapping)initWithCoder:(id)a3;
- (FCPersonalizationTodaySectionMapping)initWithPBTodaySectionMapping:(id)a3;
- (NSDictionary)todaySectionIdentifiersToFRGroupViewExposureTypes;
- (id)groupViewExposureTypesForTodaySectionIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTodaySectionIdentifiersToFRGroupViewExposureTypes:(id)a3;
@end

@implementation FCPersonalizationTodaySectionMapping

- (FCPersonalizationTodaySectionMapping)initWithPBTodaySectionMapping:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationTodaySectionMapping;
  v6 = [(FCPersonalizationTodaySectionMapping *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbTodaySectionMapping, a3);
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke;
    v12[3] = &unk_1E5B4BF78;
    id v13 = v5;
    uint64_t v9 = objc_msgSend(v8, "fc_dictionary:", v12);
    todaySectionIdentifiersToFRGroupViewExposureTypes = v7->_todaySectionIdentifiersToFRGroupViewExposureTypes;
    v7->_todaySectionIdentifiersToFRGroupViewExposureTypes = (NSDictionary *)v9;
  }
  return v7;
}

void __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) identifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_2;
  v6[3] = &unk_1E5B5AD70;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_3;
  v9[3] = &unk_1E5B4BF30;
  id v10 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "fc_array:", v9);
  id v7 = *(void **)(a1 + 32);
  v8 = [v5 personalizationSectionIdentifier];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

void __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) groupTypesCount])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "groupTypesAtIndex:", v3));
      [v5 setObject:v4 atIndexedSubscript:v3];

      ++v3;
    }
    while ([*(id *)(a1 + 32) groupTypesCount] > v3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTodaySectionMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"todaySectionMapping"];

  v6 = [(FCPersonalizationTodaySectionMapping *)self initWithPBTodaySectionMapping:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  pbTodaySectionMapping = self->_pbTodaySectionMapping;
  if (pbTodaySectionMapping) {
    [a3 encodeObject:pbTodaySectionMapping forKey:@"todaySectionMapping"];
  }
}

- (id)groupViewExposureTypesForTodaySectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPersonalizationTodaySectionMapping *)self todaySectionIdentifiersToFRGroupViewExposureTypes];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)todaySectionIdentifiersToFRGroupViewExposureTypes
{
  return self->_todaySectionIdentifiersToFRGroupViewExposureTypes;
}

- (void)setTodaySectionIdentifiersToFRGroupViewExposureTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todaySectionIdentifiersToFRGroupViewExposureTypes, 0);
  objc_storeStrong((id *)&self->_pbTodaySectionMapping, 0);
}

@end