@interface NTKEditOptionCollection
+ (NTKEditOptionCollection)editOptionCollectionWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)options;
- (NSString)localizedName;
- (NSString)optionsDescription;
- (NSString)slot;
- (NTKEditOptionCollection)initWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6;
- (NTKEditOptionCollection)initWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6 slot:(id)a7;
- (id)filteredCollectionForDevice:(id)a3;
- (id)filteredCollectionWithObjectsPassingTest:(id)a3;
- (int64_t)mode;
- (int64_t)swatchStyle;
- (unint64_t)collectionType;
- (void)setCollectionType:(unint64_t)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation NTKEditOptionCollection

- (int64_t)swatchStyle
{
  v2 = [(NTKEditOptionCollection *)self options];
  v3 = [v2 firstObject];
  int64_t v4 = [v3 swatchStyle];

  return v4;
}

- (NSString)optionsDescription
{
  v2 = [(NTKEditOptionCollection *)self options];
  v3 = [v2 firstObject];
  int64_t v4 = [(id)objc_opt_class() optionsDescription];

  return (NSString *)v4;
}

+ (NTKEditOptionCollection)editOptionCollectionWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)[objc_alloc((Class)a1) initWithEditMode:a3 localizedName:v11 options:v10 collectionType:a6];

  return (NTKEditOptionCollection *)v12;
}

- (NTKEditOptionCollection)initWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6
{
  return [(NTKEditOptionCollection *)self initWithEditMode:a3 localizedName:a4 options:a5 collectionType:a6 slot:0];
}

- (NTKEditOptionCollection)initWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)NTKEditOptionCollection;
  v15 = [(NTKEditOptionCollection *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(NTKEditOptionCollection *)v15 setMode:a3];
    [(NTKEditOptionCollection *)v16 setLocalizedName:v12];
    [(NTKEditOptionCollection *)v16 setOptions:v13];
    [(NTKEditOptionCollection *)v16 setCollectionType:a6];
    [(NTKEditOptionCollection *)v16 setSlot:v14];
  }

  return v16;
}

- (id)filteredCollectionWithObjectsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(NTKEditOptionCollection *)self options];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __68__NTKEditOptionCollection_filteredCollectionWithObjectsPassingTest___block_invoke;
  v17 = &unk_1E62C7D70;
  id v18 = v5;
  id v19 = v4;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:&v14];

  v9 = [NTKEditOptionCollection alloc];
  int64_t v10 = [(NTKEditOptionCollection *)self mode];
  id v11 = [(NTKEditOptionCollection *)self localizedName];
  id v12 = [(NTKEditOptionCollection *)v9 initWithEditMode:v10 localizedName:v11 options:v7 collectionType:[(NTKEditOptionCollection *)self collectionType]];

  return v12;
}

void __68__NTKEditOptionCollection_filteredCollectionWithObjectsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)filteredCollectionForDevice:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NTKEditOptionCollection_filteredCollectionForDevice___block_invoke;
  v8[3] = &unk_1E62C7D98;
  id v9 = v4;
  id v5 = v4;
  v6 = [(NTKEditOptionCollection *)self filteredCollectionWithObjectsPassingTest:v8];

  return v6;
}

uint64_t __55__NTKEditOptionCollection_filteredCollectionForDevice___block_invoke(uint64_t a1, void *a2)
{
  return [a2 optionExistsInDevice:*(void *)(a1 + 32)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v4 mode] != self->_mode) {
    goto LABEL_14;
  }
  id v5 = [v4 localizedName];
  v6 = v5;
  if (v5 && self->_localizedName)
  {
    id v7 = [v4 localizedName];
    localizedName = self->_localizedName;

    if (v7 != localizedName)
    {
LABEL_14:
      char v16 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v9 = [v4 options];
  uint64_t v10 = [v9 count];
  NSUInteger v11 = [(NSArray *)self->_options count];

  if (v10 != v11) {
    goto LABEL_14;
  }
  if ([(NSArray *)self->_options count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v4 options];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v12];
      uint64_t v15 = [(NSArray *)self->_options objectAtIndexedSubscript:v12];
      char v16 = [v14 isEqual:v15];

      if ((v16 & 1) == 0) {
        break;
      }
      ++v12;
    }
    while (v12 < [(NSArray *)self->_options count]);
  }
  else
  {
    char v16 = 1;
  }
LABEL_15:

  return v16;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (NSString)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end