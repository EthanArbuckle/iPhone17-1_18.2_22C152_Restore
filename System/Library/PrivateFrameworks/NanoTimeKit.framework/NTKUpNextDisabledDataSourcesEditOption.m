@interface NTKUpNextDisabledDataSourcesEditOption
+ (BOOL)supportsSecureCoding;
+ (id)optionWithDisabledDataSourceIdentifiers:(id)a3 forDevice:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidOption;
- (NSSet)disabledBundleIdentifiers;
- (NTKUpNextDisabledDataSourcesEditOption)initWithCoder:(id)a3;
- (NTKUpNextDisabledDataSourcesEditOption)initWithDisabledDataSourceIdentifiers:(id)a3 forDevice:(id)a4;
- (NTKUpNextDisabledDataSourcesEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)_alphabeticallySortedIdentifiers;
- (id)dailySnapshotKey;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKUpNextDisabledDataSourcesEditOption

- (NTKUpNextDisabledDataSourcesEditOption)initWithDisabledDataSourceIdentifiers:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKUpNextDisabledDataSourcesEditOption;
  v7 = [(NTKEditOption *)&v11 initWithDevice:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    disabledBundleIdentifiers = v7->_disabledBundleIdentifiers;
    v7->_disabledBundleIdentifiers = (NSSet *)v8;
  }
  return v7;
}

+ (id)optionWithDisabledDataSourceIdentifiers:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NTKUpNextDisabledDataSourcesEditOption alloc] initWithDisabledDataSourceIdentifiers:v6 forDevice:v5];

  return v7;
}

- (NTKUpNextDisabledDataSourcesEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    self = [(NTKUpNextDisabledDataSourcesEditOption *)self initWithDisabledDataSourceIdentifiers:v8 forDevice:v7];

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dailySnapshotKey
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_disabledBundleIdentifiers;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hash", (void)v11);
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
  v9 = [v8 stringValue];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextDisabledDataSourcesEditOption;
  id v4 = a3;
  [(NTKEditOption *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(NTKUpNextDisabledDataSourcesEditOption *)self _alphabeticallySortedIdentifiers];
  [v4 encodeObject:v5 forKey:@"kDisabledDataSourcesKey"];
}

- (NTKUpNextDisabledDataSourcesEditOption)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextDisabledDataSourcesEditOption;
  uint64_t v5 = [(NTKEditOption *)&v14 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v8 = [v6 setWithArray:v7];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = [v4 decodeObjectOfClasses:v8 forKey:@"kDisabledDataSourcesKey"];
    uint64_t v11 = [v9 setWithArray:v10];
    disabledBundleIdentifiers = v5->_disabledBundleIdentifiers;
    v5->_disabledBundleIdentifiers = (NSSet *)v11;
  }
  return v5;
}

- (id)_alphabeticallySortedIdentifiers
{
  v2 = [(NSSet *)self->_disabledBundleIdentifiers allObjects];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_1640];

  return v3;
}

uint64_t __74__NTKUpNextDisabledDataSourcesEditOption__alphabeticallySortedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isValidOption
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = NTKEqualObjects(self->_disabledBundleIdentifiers, v4[2]);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_disabledBundleIdentifiers hash];
}

- (NSSet)disabledBundleIdentifiers
{
  return self->_disabledBundleIdentifiers;
}

- (void).cxx_destruct
{
}

@end