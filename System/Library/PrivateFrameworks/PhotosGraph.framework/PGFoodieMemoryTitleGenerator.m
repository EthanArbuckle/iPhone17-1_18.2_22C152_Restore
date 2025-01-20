@interface PGFoodieMemoryTitleGenerator
- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 addressNode:(id)a4 titleGenerationContext:(id)a5;
- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 businessNode:(id)a4 titleGenerationContext:(id)a5;
- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 cityNode:(id)a4 titleGenerationContext:(id)a5;
- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNode:(id)a4 titleGenerationContext:(id)a5;
- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 tripLocationNode:(id)a4 tripTitleLocationType:(unint64_t)a5 titleGenerationContext:(id)a6;
- (id)_timeTitleForTripAndWeekend;
- (id)_typeString;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGFoodieMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripLocationNode, 0);
  objc_storeStrong((id *)&self->_addressNode, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
  objc_storeStrong((id *)&self->_businessNode, 0);
  objc_storeStrong((id *)&self->_cityNode, 0);
}

- (id)_typeString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PGTripMemoryTypeStringTrip" value:@"PGTripMemoryTypeStringTrip" table:@"Localizable"];

  return v3;
}

- (id)_timeTitleForTripAndWeekend
{
  v3 = objc_alloc_init(PGTimeTitleOptions);
  v4 = [(PGTitleGenerator *)self momentNodes];
  [(PGTimeTitleOptions *)v3 setMomentNodes:v4];

  v5 = [(PGTitleGenerator *)self locale];
  [(PGTimeTitleOptions *)v3 setLocale:v5];

  v6 = +[PGTimeTitleUtility timeTitleWithOptions:v3];
  v7 = [(PGFoodieMemoryTitleGenerator *)self _typeString];
  if (!v7)
  {
    id v12 = v6;
LABEL_6:
    v11 = v12;
    goto LABEL_7;
  }
  if (![v6 length])
  {
    id v12 = v7;
    goto LABEL_6;
  }
  v8 = NSString;
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGTripMemorySubtitleFormatWithLocalizedDate %@" value:@"PGTripMemorySubtitleFormatWithLocalizedDate %@" table:@"Localizable"];
  v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v6);

LABEL_7:
  id v13 = v11;

  return v13;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  id v4 = a3;
  switch(self->_type)
  {
    case 0:
      v5 = +[PGTitleSpecFactory specCollectionForFoodieMemoryWithPersonNodes:0 locationName:0 tripTitleLocationType:0 allowInspiredTastesTitle:0 genericOnly:1];
      v6 = [PGSpecBasedTitleGenerator alloc];
      v7 = [(PGTitleGenerator *)self momentNodes];
      v8 = [(PGTitleGenerator *)self titleGenerationContext];
      uint64_t v9 = [(PGSpecBasedTitleGenerator *)v6 initWithMomentNodes:v7 specCollection:v5 titleGenerationContext:v8];
      goto LABEL_12;
    case 1:
      v18 = [(PGGraphNamedLocationNode *)self->_cityNode name];
      uint64_t v19 = [v18 length];

      if (!v19) {
        goto LABEL_8;
      }
      cityNode = self->_cityNode;
      v21 = [(PGTitleGenerator *)self titleGenerationContext];
      v22 = [v21 locationHelper];
      v5 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:cityNode locationHelper:v22];

      v7 = +[PGTitleSpecFactory specCollectionForFoodieMemoryWithPersonNodes:0 locationName:v5 tripTitleLocationType:0 allowInspiredTastesTitle:0 genericOnly:0];
      v23 = [PGSpecBasedTitleGenerator alloc];
      v8 = [(PGTitleGenerator *)self momentNodes];
      v24 = [(PGTitleGenerator *)self titleGenerationContext];
      v25 = [(PGSpecBasedTitleGenerator *)v23 initWithMomentNodes:v8 specCollection:v7 titleGenerationContext:v24];

LABEL_13:
      v26 = 0;
      if (!v25) {
        goto LABEL_26;
      }
      goto LABEL_21;
    case 2:
      id v12 = objc_alloc_init(PGLocationTitleOptions);
      v27 = [(PGTitleGenerator *)self momentNodes];
      [(PGLocationTitleOptions *)v12 setMomentNodes:v27];

      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__71063;
      v52 = __Block_byref_object_dispose__71064;
      id v53 = 0;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __68__PGFoodieMemoryTitleGenerator__generateTitleAndSubtitleWithResult___block_invoke;
      v47[3] = &unk_1E68F0288;
      v47[4] = &v48;
      +[PGLocationTitleUtility generateBusinessItemLocationWithOptions:v12 result:v47];
      if (v49[5])
      {
        v28 = NSString;
        v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v30 = [v29 localizedStringForKey:@"PGFoodieMemoryTitleWithBusinessName %@" value:@"PGFoodieMemoryTitleWithBusinessName %@" table:@"Localizable"];
        v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v49[5]);

        v17 = +[PGTitle titleWithString:v31 category:4];
      }
      else
      {
        v17 = 0;
      }
      _Block_object_dispose(&v48, 8);

      goto LABEL_25;
    case 3:
      v32 = [PGSpecBasedTitleGenerator alloc];
      v5 = [(PGTitleGenerator *)self momentNodes];
      v7 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_personNode];
      v8 = [(PGTitleGenerator *)self titleGenerationContext];
      uint64_t v9 = [(PGSpecBasedTitleGenerator *)v32 initWithMomentNodes:v5 personNodes:v7 memoryCategory:301 subcategory:218 titleGenerationContext:v8];
LABEL_12:
      v25 = (PGSpecBasedTitleGenerator *)v9;
      goto LABEL_13;
    case 4:
      v10 = [(PGGraphAddressNode *)self->_addressNode collection];
      v11 = [v10 homeNodes];
      id v12 = [v11 ownerNodes];

      id v13 = [(MANode *)self->_addressNode graph];
      v14 = +[PGGraphNodeCollection nodesInGraph:v13];

      if ([(PGLocationTitleOptions *)v12 intersectsCollection:v14]
        && ([MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
            v15 = objc_claimAutoreleasedReturnValue(),
            [v15 localizedStringForKey:@"PGFoodieMemoryTitleForHome" value:@"PGFoodieMemoryTitleForHome" table:@"Localizable"], v16 = objc_claimAutoreleasedReturnValue(), v15, v16))
      {
        v17 = +[PGTitle titleWithString:v16 category:4];
      }
      else
      {
        v17 = 0;
      }

LABEL_25:
      v26 = 0;
      v25 = 0;
      if (!v17) {
        goto LABEL_26;
      }
      goto LABEL_29;
    case 5:
      v33 = [(PGGraphLocationOrArea *)self->_tripLocationNode name];
      uint64_t v34 = [v33 length];

      if (v34)
      {
        tripLocationNode = self->_tripLocationNode;
        v36 = [(PGTitleGenerator *)self titleGenerationContext];
        v37 = [v36 locationHelper];
        v38 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:tripLocationNode locationHelper:v37];

        v39 = +[PGTitleSpecFactory specCollectionForFoodieMemoryWithPersonNodes:0 locationName:v38 tripTitleLocationType:self->_tripTitleLocationType allowInspiredTastesTitle:1 genericOnly:0];
        v40 = [PGSpecBasedTitleGenerator alloc];
        v41 = [(PGTitleGenerator *)self momentNodes];
        v42 = [(PGTitleGenerator *)self titleGenerationContext];
        v25 = [(PGSpecBasedTitleGenerator *)v40 initWithMomentNodes:v41 specCollection:v39 titleGenerationContext:v42];
      }
      else
      {
        v25 = 0;
      }
      v26 = [(PGFoodieMemoryTitleGenerator *)self _timeTitleForTripAndWeekend];
      if (!v25) {
        goto LABEL_26;
      }
LABEL_21:
      v17 = [(PGSpecBasedTitleGenerator *)v25 title];
      if (!v26) {
        goto LABEL_29;
      }
      goto LABEL_30;
    default:
LABEL_8:
      v26 = 0;
LABEL_26:
      if (v4)
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      }
      else
      {
        v25 = 0;
        v17 = 0;
        if (!v26)
        {
LABEL_29:
          v43 = objc_alloc_init(PGTimeTitleOptions);
          v44 = [(PGTitleGenerator *)self momentNodes];
          [(PGTimeTitleOptions *)v43 setMomentNodes:v44];

          v45 = [(PGTitleGenerator *)self featuredYearNodes];
          [(PGTimeTitleOptions *)v43 setFeaturedYearNodes:v45];

          [(PGTimeTitleOptions *)v43 setAllowedFormats:20];
          v26 = +[PGTimeTitleUtility timeTitleWithOptions:v43];
        }
LABEL_30:
        v46 = +[PGTitle titleWithString:v26 category:5];
        if (v4) {
          (*((void (**)(id, void *, void *))v4 + 2))(v4, v17, v46);
        }
      }
      return;
  }
}

void __68__PGFoodieMemoryTitleGenerator__generateTitleAndSubtitleWithResult___block_invoke(uint64_t a1, void *a2)
{
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 tripLocationNode:(id)a4 tripTitleLocationType:(unint64_t)a5 titleGenerationContext:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGFoodieMemoryTitleGenerator;
  id v12 = [(PGTitleGenerator *)&v15 initWithMomentNodes:a3 type:0 titleGenerationContext:a6];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tripLocationNode, a4);
    v13->_tripTitleLocationType = a5;
    v13->_type = 5;
  }

  return v13;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 addressNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = [(PGTitleGenerator *)&v13 initWithMomentNodes:a3 type:0 titleGenerationContext:a5];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_addressNode, a4);
    v11->_type = 4;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = [(PGTitleGenerator *)&v13 initWithMomentNodes:a3 type:0 titleGenerationContext:a5];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_personNode, a4);
    v11->_type = 3;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 businessNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = [(PGTitleGenerator *)&v13 initWithMomentNodes:a3 type:0 titleGenerationContext:a5];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_businessNode, a4);
    v11->_type = 2;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 cityNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = [(PGTitleGenerator *)&v13 initWithMomentNodes:a3 type:0 titleGenerationContext:a5];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cityNode, a4);
    v11->_type = 1;
  }

  return v11;
}

@end