@interface TIAnalyticsEventSpec
+ (id)eventSpecWithName:(id)a3 inputModeRequired:(BOOL)a4;
+ (id)eventSpecWithName:(id)a3 inputModeRequired:(BOOL)a4 fieldSpecs:(id)a5;
- (BOOL)isInputModeRequired;
- (NSArray)fieldSpecs;
- (NSDictionary)fieldSpecsByName;
- (NSString)name;
- (TIAnalyticsEventSpec)initWithName:(id)a3 inputModeRequired:(BOOL)a4 fieldSpecs:(id)a5;
- (id)fieldSpecWithName:(id)a3;
@end

@implementation TIAnalyticsEventSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldSpecs, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_fieldSpecsByName, 0);
}

- (NSArray)fieldSpecs
{
  return self->_fieldSpecs;
}

- (BOOL)isInputModeRequired
{
  return self->_isInputModeRequired;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)fieldSpecsByName
{
  return self->_fieldSpecsByName;
}

- (id)fieldSpecWithName:(id)a3
{
  return [(NSDictionary *)self->_fieldSpecsByName objectForKey:a3];
}

- (TIAnalyticsEventSpec)initWithName:(id)a3 inputModeRequired:(BOOL)a4 fieldSpecs:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TIAnalyticsEventSpec;
  v10 = [(TIAnalyticsEventSpec *)&v31 init];
  if (v10)
  {
    BOOL v26 = a4;
    v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v18 = [v17 name];
          [v11 setObject:v17 forKey:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v19;

    v10->_isInputModeRequired = v26;
    if (v12)
    {
      uint64_t v21 = [v12 copy];
      fieldSpecs = v10->_fieldSpecs;
      v10->_fieldSpecs = (NSArray *)v21;
    }
    else
    {
      fieldSpecs = v10->_fieldSpecs;
      v10->_fieldSpecs = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    uint64_t v23 = [v11 copy];
    fieldSpecsByName = v10->_fieldSpecsByName;
    v10->_fieldSpecsByName = (NSDictionary *)v23;
  }
  return v10;
}

+ (id)eventSpecWithName:(id)a3 inputModeRequired:(BOOL)a4 fieldSpecs:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[TIAnalyticsEventSpec alloc] initWithName:v8 inputModeRequired:v5 fieldSpecs:v7];

  return v9;
}

+ (id)eventSpecWithName:(id)a3 inputModeRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[TIAnalyticsEventSpec alloc] initWithName:v5 inputModeRequired:v4 fieldSpecs:0];

  return v6;
}

@end