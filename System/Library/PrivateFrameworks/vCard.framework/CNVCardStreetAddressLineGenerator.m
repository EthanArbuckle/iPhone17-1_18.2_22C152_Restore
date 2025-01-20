@interface CNVCardStreetAddressLineGenerator
- (id)lineWithValue:(id)a3 label:(id)a4;
- (id)makeLineWithName:(id)a3 value:(id)a4;
- (id)standardLabelsForLabel:(id)a3;
- (void)addGroupedLineWithName:(id)a3 value:(id)a4 toLine:(id)a5;
@end

@implementation CNVCardStreetAddressLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [v10 objectForKeyedSubscript:@"postOfficeBox"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v12, &stru_1F362EAE0);

  v13 = [v10 objectForKeyedSubscript:@"extendedStreet"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v13, &stru_1F362EAE0);

  v14 = [v10 objectForKeyedSubscript:@"street"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v14, &stru_1F362EAE0);

  v15 = [v10 objectForKeyedSubscript:@"city"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v15, &stru_1F362EAE0);

  v16 = [v10 objectForKeyedSubscript:@"state"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v16, &stru_1F362EAE0);

  v17 = [v10 objectForKeyedSubscript:@"postalCode"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v17, &stru_1F362EAE0);

  v18 = [v10 objectForKeyedSubscript:@"country"];
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v18, &stru_1F362EAE0);

  v24.receiver = self;
  v24.super_class = (Class)CNVCardStreetAddressLineGenerator;
  v19 = [(CNVCardLineGenerator *)&v24 lineWithValue:v11 label:v7];

  v20 = [v10 objectForKeyedSubscript:@"ISOCountryCode"];
  [(CNVCardStreetAddressLineGenerator *)self addGroupedLineWithName:@"X-ABADR" value:v20 toLine:v19];

  v21 = [v10 objectForKeyedSubscript:@"subLocality"];
  [(CNVCardStreetAddressLineGenerator *)self addGroupedLineWithName:@"X-APPLE-SUBLOCALITY" value:v21 toLine:v19];

  v22 = [v10 objectForKeyedSubscript:@"subAdministrativeArea"];
  [(CNVCardStreetAddressLineGenerator *)self addGroupedLineWithName:@"X-APPLE-SUBADMINISTRATIVEAREA" value:v22 toLine:v19];

  return v19;
}

- (void)addGroupedLineWithName:(id)a3 value:(id)a4 toLine:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    id v10 = [(CNVCardLineFactory *)self->super._lineFactory stringLineWithName:v11 value:v8];
    [v9 addGroupedLine:v10 withCounter:self->super._groupingCount];
  }
}

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  return [(CNVCardLineFactory *)self->super._lineFactory arrayLineWithName:a3 value:a4];
}

- (id)standardLabelsForLabel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"_$!<Work>!$_"])
  {
    id v9 = @"WORK";
    v4 = &v9;
LABEL_7:
    v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1, v7, v8, v9, v10);
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"_$!<Home>!$_"])
  {
    id v8 = @"HOME";
    v4 = &v8;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"_$!<Other>!$_"])
  {
    id v7 = @"OTHER";
    v4 = &v7;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

@end