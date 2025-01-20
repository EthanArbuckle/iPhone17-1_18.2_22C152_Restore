@interface NotesMigrationMapping
+ (id)customMappingFromSourceModelName:(id)a3 toDestinationModelName:(id)a4;
+ (id)descriptionStringFromSourceStoreNames:(id)a3 destinationStoreName:(id)a4;
+ (id)inferredMappingFromSourceModelNames:(id)a3 toDestinationModelName:(id)a4;
+ (id)mappings;
+ (id)modelForModelName:(id)a3;
- (BOOL)canMigrateStoreMetadata:(id)a3;
- (NSArray)sourceModels;
- (NSManagedObjectModel)destinationModel;
- (NSString)descriptionString;
- (id)description;
- (id)mappingModelForStoreMetadata:(id)a3;
- (id)sourceModelForStoreMetadata:(id)a3;
- (int64_t)type;
- (void)setDescriptionString:(id)a3;
- (void)setDestinationModel:(id)a3;
- (void)setSourceModels:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation NotesMigrationMapping

+ (id)descriptionStringFromSourceStoreNames:(id)a3 destinationStoreName:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ((unint64_t)[v5 count] >= 2) {
    [v7 appendString:@"["];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "appendString:", v13, (void)v18);
        v14 = [v8 lastObject];
        LODWORD(v13) = [v13 isEqualToString:v14];

        v15 = @"|";
        if (v13)
        {
          unint64_t v16 = objc_msgSend(v8, "count", @"|");
          v15 = @"]";
          if (v16 < 2) {
            continue;
          }
        }
        [v7 appendString:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [v7 appendString:@" -> "];
  [v7 appendString:v6];

  return v7;
}

+ (id)modelForModelName:(id)a3
{
  id v3 = a3;
  v4 = NoteContextManagedObjectModelPath();
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [v4 stringByAppendingPathComponent:v3];

  id v7 = [v6 stringByAppendingPathExtension:@"mom"];
  id v8 = [v5 fileURLWithPath:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v8];
  return v9;
}

+ (id)mappings
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[NotesMigrationMapping inferredMappingFromSourceModelNames:&unk_1F26798E0 toDestinationModelName:@"DidChooseToMigrate"];
  [v2 addObject:v3];

  v4 = +[NotesMigrationMapping customMappingFromSourceModelName:@"ExternalSequenceNumber" toDestinationModelName:@"Attachments"];
  [v2 addObject:v4];

  id v5 = +[NotesMigrationMapping inferredMappingFromSourceModelNames:&unk_1F26798F8 toDestinationModelName:@"ExternalSequenceNumber"];
  [v2 addObject:v5];

  id v6 = (void *)[v2 copy];
  return v6;
}

+ (id)inferredMappingFromSourceModelNames:(id)a3 toDestinationModelName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(a1, "modelForModelName:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init((Class)objc_opt_class());
  [v15 setSourceModels:v8];
  unint64_t v16 = [a1 modelForModelName:v7];
  [v15 setDestinationModel:v16];

  [v15 setType:1];
  v17 = [a1 descriptionStringFromSourceStoreNames:v9 destinationStoreName:v7];
  [v15 setDescriptionString:v17];

  return v15;
}

+ (id)customMappingFromSourceModelName:(id)a3 toDestinationModelName:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)objc_opt_class());
  id v9 = [a1 modelForModelName:v7];
  v16[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v8 setSourceModels:v10];

  uint64_t v11 = [a1 modelForModelName:v6];
  [v8 setDestinationModel:v11];

  [v8 setType:0];
  id v15 = v7;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  v13 = [a1 descriptionStringFromSourceStoreNames:v12 destinationStoreName:v6];

  [v8 setDescriptionString:v13];
  return v8;
}

- (id)sourceModelForStoreMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C120];
  id v5 = a3;
  id v6 = [(NotesMigrationMapping *)self sourceModels];
  id v7 = [v4 modelByMergingModels:v6 forStoreMetadata:v5];

  return v7;
}

- (id)mappingModelForStoreMetadata:(id)a3
{
  id v4 = a3;
  if ([(NotesMigrationMapping *)self type] == 1)
  {
    id v5 = [(NotesMigrationMapping *)self sourceModelForStoreMetadata:v4];
    id v6 = (void *)MEMORY[0x1E4F1C128];
    id v7 = [(NotesMigrationMapping *)self destinationModel];
    id v15 = 0;
    id v8 = [v6 inferredMappingModelForSourceModel:v5 destinationModel:v7 error:&v15];
    id v9 = v15;

    if (!v8) {
      NSLog(&cfstr_UnexpectedErro.isa, v4, v9);
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C128];
    uint64_t v11 = [(NotesMigrationMapping *)self sourceModels];
    uint64_t v12 = [v11 lastObject];
    v13 = [(NotesMigrationMapping *)self destinationModel];
    id v8 = [v10 mappingModelFromBundles:0 forSourceModel:v12 destinationModel:v13];
  }
  return v8;
}

- (BOOL)canMigrateStoreMetadata:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F1BF78]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NotesMigrationMapping *)self sourceModels];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) entityVersionHashesByName];
        char v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NotesMigrationMapping *)self descriptionString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p ; %@>", v5, self, v6];

  return v7;
}

- (NSManagedObjectModel)destinationModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDestinationModel:(id)a3
{
}

- (NSArray)sourceModels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourceModels:(id)a3
{
}

- (NSString)descriptionString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDescriptionString:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_sourceModels, 0);
  objc_storeStrong((id *)&self->_destinationModel, 0);
}

@end