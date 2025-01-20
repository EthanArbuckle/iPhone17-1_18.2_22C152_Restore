@interface WBSCRDTField
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldIncrementGeneration;
- (NSCopying)value;
- (NSString)deviceIdentifier;
- (WBSCRDTField)init;
- (WBSCRDTField)initWithValue:(id)a3 generation:(id)a4 deviceIdentifier:(id)a5;
- (WBSCRDTField)initWithValue:(id)a3 valueSource:(id)a4 valueProvider:(id)a5 valueUpdater:(id)a6 generation:(id)a7 deviceIdentifier:(id)a8 metadata:(id)a9;
- (WBSCRDTField)initWithValueSource:(id)a3 valueProvider:(id)a4 valueUpdater:(id)a5 generation:(id)a6 deviceIdentifier:(id)a7;
- (WBSCRDTGeneration)generation;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)mergeWithField:(id)a3;
- (unint64_t)hash;
- (void)incrementGenerationIfNeeded;
- (void)setDeviceIdentifier:(id)a3;
- (void)setGeneration:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setShouldIncrementGeneration:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValue:(id)a3 incrementGenerationIfNeeded:(BOOL)a4;
@end

@implementation WBSCRDTField

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (void)setShouldIncrementGeneration:(BOOL)a3
{
  self->_shouldIncrementGeneration = a3;
}

- (void)incrementGenerationIfNeeded
{
  if (self->_shouldIncrementGeneration)
  {
    generation = self->_generation;
    deviceIdentifier = self->_deviceIdentifier;
    v5 = deviceIdentifier;
    if (!deviceIdentifier)
    {
      v5 = [(WBSCRDTGeneration *)self->_generation deviceIdentifier];
    }
    v6 = [(WBSCRDTGeneration *)generation incrementedGenerationWithDeviceIdentifier:v5];
    v7 = self->_generation;
    self->_generation = v6;

    if (!deviceIdentifier) {
    self->_shouldIncrementGeneration = 0;
    }
  }
}

- (void)setValue:(id)a3 incrementGenerationIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  [(WBSCRDTField *)self setValue:a3];
  if (v4)
  {
    [(WBSCRDTField *)self incrementGenerationIfNeeded];
  }
}

- (void)setValue:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_valueSource);
  if (WeakRetained)
  {
    v5 = [(WBSCRDTField *)self value];
    char v6 = WBSIsEqual();

    if ((v6 & 1) == 0) {
      (*((void (**)(void))self->_valueUpdater + 2))();
    }
  }
}

- (NSCopying)value
{
  id WeakRetained = objc_loadWeakRetained(&self->_valueSource);
  if (WeakRetained)
  {
    BOOL v4 = (*((void (**)(void))self->_valueProvider + 2))();
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSCopying *)v4;
}

id __58__WBSCRDTField_initWithValue_generation_deviceIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 8);
}

void __58__WBSCRDTField_initWithValue_generation_deviceIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = a2;
  uint64_t v5 = [a3 copyWithZone:0];
  id v6 = (id)v4[1];
  v4[1] = v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id result = (id)[v4 initWithValue:self->_value valueSource:v4 valueProvider:self->_valueProvider valueUpdater:self->_valueUpdater generation:self->_generation deviceIdentifier:self->_deviceIdentifier metadata:self->_metadata];
  *((unsigned char *)result + 48) = self->_shouldIncrementGeneration;
  return result;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) initWithValue:self->_value valueSource:v4 valueProvider:self->_valueProvider valueUpdater:self->_valueUpdater generation:self->_generation deviceIdentifier:self->_deviceIdentifier metadata:self->_metadata];

  v5[48] = self->_shouldIncrementGeneration;
  return v5;
}

- (WBSCRDTField)initWithValue:(id)a3 generation:(id)a4 deviceIdentifier:(id)a5
{
  return [(WBSCRDTField *)self initWithValue:a3 valueSource:self valueProvider:&__block_literal_global_31 valueUpdater:&__block_literal_global_3_0 generation:a4 deviceIdentifier:a5 metadata:0];
}

- (WBSCRDTField)initWithValueSource:(id)a3 valueProvider:(id)a4 valueUpdater:(id)a5 generation:(id)a6 deviceIdentifier:(id)a7
{
  return [(WBSCRDTField *)self initWithValue:0 valueSource:a3 valueProvider:a4 valueUpdater:a5 generation:a6 deviceIdentifier:a7 metadata:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_valueUpdater, 0);
  objc_storeStrong(&self->_valueProvider, 0);
  objc_destroyWeak(&self->_valueSource);
  objc_storeStrong(&self->_value, 0);
}

- (WBSCRDTField)initWithValue:(id)a3 valueSource:(id)a4 valueProvider:(id)a5 valueUpdater:(id)a6 generation:(id)a7 deviceIdentifier:(id)a8 metadata:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v40.receiver = self;
  v40.super_class = (Class)WBSCRDTField;
  v22 = [(WBSCRDTField *)&v40 init];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak(&v22->_valueSource, v16);
    uint64_t v24 = [v15 copyWithZone:0];
    id value = v23->_value;
    v23->_id value = (id)v24;

    uint64_t v26 = MEMORY[0x1AD0C4F80](v17);
    id valueProvider = v23->_valueProvider;
    v23->_id valueProvider = (id)v26;

    uint64_t v28 = MEMORY[0x1AD0C4F80](v18);
    id valueUpdater = v23->_valueUpdater;
    v23->_id valueUpdater = (id)v28;

    v30 = (void *)[v19 copy];
    v31 = v30;
    if (v30) {
      v32 = v30;
    }
    else {
      v32 = objc_alloc_init(WBSCRDTGeneration);
    }
    generation = v23->_generation;
    v23->_generation = v32;

    uint64_t v34 = [v20 copy];
    deviceIdentifier = v23->_deviceIdentifier;
    v23->_deviceIdentifier = (NSString *)v34;

    if (v21) {
      v36 = (NSMutableDictionary *)[v21 mutableCopy];
    }
    else {
      v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    metadata = v23->_metadata;
    v23->_metadata = v36;

    v23->_shouldIncrementGeneration = 1;
    v38 = v23;
  }

  return v23;
}

- (WBSCRDTField)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCRDTField *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      id v6 = [(WBSCRDTField *)self value];
      id v7 = [(WBSCRDTField *)v5 value];
      if (WBSIsEqual())
      {
        v8 = [(WBSCRDTField *)self generation];
        v9 = [(WBSCRDTField *)v5 generation];
        if (WBSIsEqual())
        {
          v10 = [(WBSCRDTField *)self deviceIdentifier];
          v11 = [(WBSCRDTField *)v5 deviceIdentifier];
          char v12 = WBSIsEqual();
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(WBSCRDTGeneration *)self->_generation hash];
  return [(NSString *)self->_deviceIdentifier hash] ^ v3;
}

- (int64_t)mergeWithField:(id)a3
{
  id v4 = (WBSCRDTField *)a3;
  uint64_t v5 = [(WBSCRDTField *)self generation];
  id v6 = [(WBSCRDTField *)v4 generation];
  int64_t v7 = [v5 compare:v6];

  if (v7 == -1) {
    v8 = v4;
  }
  else {
    v8 = self;
  }
  v9 = [(WBSCRDTField *)v8 value];
  v10 = [(WBSCRDTField *)v8 generation];
  [(WBSCRDTField *)self setValue:v9];
  [(WBSCRDTField *)self setGeneration:v10];
  [(WBSCRDTField *)v4 setValue:v9];
  [(WBSCRDTField *)v4 setGeneration:v10];

  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:a3];
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(WBSCRDTField *)self value];
  id v6 = [(WBSCRDTField *)self generation];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; value: %@; generation: %@; metadata: %@>",
    v4,
    self,
    v5,
    v6,
  int64_t v7 = self->_metadata);

  return v7;
}

- (WBSCRDTGeneration)generation
{
  return self->_generation;
}

- (void)setGeneration:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (BOOL)shouldIncrementGeneration
{
  return self->_shouldIncrementGeneration;
}

@end