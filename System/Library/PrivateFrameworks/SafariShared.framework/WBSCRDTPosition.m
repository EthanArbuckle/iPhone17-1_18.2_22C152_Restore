@interface WBSCRDTPosition
+ (BOOL)supportsSecureCoding;
+ (id)positionBetweenPosition:(id)a3 andPosition:(id)a4 withDeviceIdentifier:(id)a5 changeID:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)sortValues;
- (NSDictionary)dictionaryRepresentation;
- (WBSCRDTPosition)init;
- (WBSCRDTPosition)initWithCoder:(id)a3;
- (WBSCRDTPosition)initWithDictionaryRepresentation:(id)a3;
- (WBSCRDTPosition)initWithSortValue:(id)a3 parentSortValues:(id)a4;
- (WBSCRDTPosition)initWithSortValues:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSCRDTPosition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCRDTPosition)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"sortValues"];

  if ([v8 count])
  {
    self = [(WBSCRDTPosition *)self initWithSortValues:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WBSCRDTPosition)initWithSortValues:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCRDTPosition;
  id v5 = [(WBSCRDTPosition *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sortValues = v5->_sortValues;
    v5->_sortValues = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)positionBetweenPosition:(id)a3 andPosition:(id)a4 withDeviceIdentifier:(id)a5 changeID:(int64_t)a6
{
  v59[1] = *MEMORY[0x1E4F143B8];
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  v13 = [[WBSCRDTPositionSortValue alloc] initWithSortValue:0 deviceIdentifier:v12 changeID:a6];
  v14 = v13;
  if (!(v10 | v11))
  {
    id v27 = objc_alloc((Class)a1);
    v59[0] = v14;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
    v26 = (void *)[v27 initWithSortValues:v28];
LABEL_18:

    goto LABEL_19;
  }
  if (!v11)
  {
    id v29 = objc_alloc((Class)a1);
    v28 = [(id)v10 sortValues];
    v30 = [v28 firstObject];
    v31 = -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v14, "positionSortValueWithSortValue:", [v30 sortValue] + 1000);
    v58 = v31;
    v32 = (void *)MEMORY[0x1E4F1C978];
    v33 = &v58;
LABEL_17:
    v34 = [v32 arrayWithObjects:v33 count:1];
    v26 = (void *)[v29 initWithSortValues:v34];

    goto LABEL_18;
  }
  if (!v10)
  {
    id v29 = objc_alloc((Class)a1);
    v28 = [(id)v11 sortValues];
    v30 = [v28 firstObject];
    v31 = -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v14, "positionSortValueWithSortValue:", [v30 sortValue] - 1000);
    v57 = v31;
    v32 = (void *)MEMORY[0x1E4F1C978];
    v33 = &v57;
    goto LABEL_17;
  }
  id v55 = v12;
  v56 = v13;
  unint64_t v54 = v10;
  v15 = [(id)v10 sortValues];
  unint64_t v53 = v11;
  v16 = [(id)v11 sortValues];
  unint64_t v17 = [v15 count];
  unint64_t v18 = [v16 count];
  unint64_t v52 = v18;
  if (v17 >= v18) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = v17;
  }
  if (v19)
  {
    uint64_t v20 = 0;
    while (1)
    {
      v21 = [v15 objectAtIndexedSubscript:v20];
      v22 = [v16 objectAtIndexedSubscript:v20];
      if (([v21 isEqualToPositionSortValue:v22] & 1) == 0)
      {
        uint64_t v23 = [v21 sortValue];
        uint64_t v24 = [v22 sortValue];
        if (v24 != v23) {
          break;
        }
      }

      if (v19 == ++v20) {
        goto LABEL_12;
      }
    }
    if (v24 - v23 < 2)
    {
      unint64_t v46 = v20 + 1;
      if (v17 > v46)
      {
        id v47 = objc_alloc((Class)a1);
        v43 = [v15 objectAtIndexedSubscript:v46];
        v48 = -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", [v43 sortValue] + 1000);
        v49 = objc_msgSend(v15, "subarrayWithRange:", 0, v46);
        v26 = (void *)[v47 initWithSortValue:v48 parentSortValues:v49];

        goto LABEL_36;
      }
      id v50 = objc_alloc((Class)a1);
      if (v52 <= v46)
      {
        v43 = objc_msgSend(v15, "subarrayWithRange:", 0, v46);
        v26 = (void *)[v50 initWithSortValue:v56 parentSortValues:v43];
        goto LABEL_36;
      }
      v43 = [v16 objectAtIndexedSubscript:v46];
      v44 = -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", [v43 sortValue] - 1000);
      v51 = objc_msgSend(v16, "subarrayWithRange:", 0, v46);
      v26 = (void *)[v50 initWithSortValue:v44 parentSortValues:v51];
    }
    else
    {
      uint64_t v40 = v24;
      id v41 = objc_alloc((Class)a1);
      uint64_t v42 = v40 + v23;
      if (v40 + v23 < 0 != __OFADD__(v40, v23)) {
        ++v42;
      }
      v43 = [(WBSCRDTPositionSortValue *)v56 positionSortValueWithSortValue:v42 >> 1];
      v44 = objc_msgSend(v15, "subarrayWithRange:", 0, v20);
      v26 = (void *)[v41 initWithSortValue:v43 parentSortValues:v44];
    }

LABEL_36:
    goto LABEL_37;
  }
LABEL_12:
  if (v17 != v52)
  {
    id v36 = objc_alloc((Class)a1);
    unint64_t v11 = v53;
    if (v17 <= v52)
    {
      v21 = [v16 objectAtIndexedSubscript:v17];
      v37 = -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", [v21 sortValue] - 1000);
      v38 = v16;
      unint64_t v39 = v17;
    }
    else
    {
      v21 = [v15 objectAtIndexedSubscript:v52];
      v37 = -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", [v21 sortValue] + 1000);
      v38 = v15;
      unint64_t v39 = v52;
    }
    v45 = objc_msgSend(v38, "subarrayWithRange:", 0, v39);
    v26 = (void *)[v36 initWithSortValue:v37 parentSortValues:v45];

    unint64_t v10 = v54;
    goto LABEL_38;
  }
  id v25 = objc_alloc((Class)a1);
  v21 = [(WBSCRDTPositionSortValue *)v56 positionSortValueWithSortValue:0];
  v26 = (void *)[v25 initWithSortValue:v21 parentSortValues:v15];
LABEL_37:
  unint64_t v11 = v53;
  unint64_t v10 = v54;
LABEL_38:

  id v12 = v55;
  v14 = v56;
LABEL_19:

  return v26;
}

- (WBSCRDTPosition)init
{
  return 0;
}

- (WBSCRDTPosition)initWithSortValue:(id)a3 parentSortValues:(id)a4
{
  id v6 = a4;
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v8 = [v7 arrayByAddingObject:a3];
  v9 = [(WBSCRDTPosition *)self initWithSortValues:v8];

  return v9;
}

- (WBSCRDTPosition)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = objc_msgSend(v4, "safari_arrayForKey:", @"sortValues", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (id v12 = [[WBSCRDTPositionSortValue alloc] initWithDictionaryRepresentation:v11]) == 0)
        {

          v15 = 0;
          goto LABEL_15;
        }
        v13 = v12;
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if ([v5 count])
  {
    self = [(WBSCRDTPosition *)self initWithSortValues:v5];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
LABEL_15:

  return v15;
}

- (NSDictionary)dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"sortValues";
  v2 = [(NSArray *)self->_sortValues valueForKey:@"dictionaryRepresentation"];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (unint64_t)hash
{
  v2 = [(NSArray *)self->_sortValues lastObject];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCRDTPosition *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSArray *)self->_sortValues isEqualToArray:v4->_sortValues];
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = (WBSCRDTPosition *)a3;
  if (self == v4)
  {
    int64_t v12 = 0;
  }
  else
  {
    NSUInteger v5 = [(NSArray *)self->_sortValues count];
    unint64_t v6 = [(NSArray *)v4->_sortValues count];
    NSUInteger v7 = v6;
    if (v5 >= v6) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = v5;
    }
    if (v8)
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = [(NSArray *)self->_sortValues objectAtIndexedSubscript:v9];
        uint64_t v11 = [(NSArray *)v4->_sortValues objectAtIndexedSubscript:v9];
        int64_t v12 = [v10 compare:v11];

        if (v12) {
          break;
        }
        if (v8 == ++v9) {
          goto LABEL_9;
        }
      }
    }
    else
    {
LABEL_9:
      if (v5 >= v7) {
        int64_t v12 = v5 > v7;
      }
      else {
        int64_t v12 = -1;
      }
    }
  }

  return v12;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(NSArray *)self->_sortValues valueForKey:@"description"];
  id v4 = [v3 componentsJoinedByString:@", "];
  NSUInteger v5 = [v2 stringWithFormat:@"[ %@ ]", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)sortValues
{
  return self->_sortValues;
}

- (void).cxx_destruct
{
}

@end