@interface PK_ipp_t
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)dataRemaining;
- (NSMutableArray)attrs;
- (PK_ipp_t)init;
- (PK_ipp_t)initWithCoder:(id)a3;
- (PK_ipp_t)initWithData:(id)a3;
- (id)_descriptionLeader;
- (id)_findAttribute0:(id)a3 valueTag:(int)a4;
- (id)_initWithAttrs:(id)a3;
- (id)addNewEmptyAttribute:(id)a3 groupTag:(int)a4 valueTag:(int)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)debugDescription;
- (id)description;
- (id)mutableCopy;
- (id)userCodableDictionary;
- (int)state;
- (unint64_t)hash;
- (unsigned)op_or_status;
- (unsigned)request_id;
- (void)_addAttrToAppropriateGroup:(id)a3;
- (void)_addBoolean:(int)a3 name:(id)a4 value:(BOOL)a5;
- (void)_addCollection:(int)a3 name:(id)a4 value:(id)a5;
- (void)_addInteger:(int)a3 valueTag:(int)a4 name:(id)a5 value:(int)a6;
- (void)_addIntegers:(int)a3 valueTag:(int)a4 name:(id)a5 count:(unint64_t)a6 adder:(id)a7;
- (void)_addOctetString:(int)a3 name:(id)a4 data:(const void *)a5 length:(int)a6;
- (void)_addRange:(int)a3 name:(id)a4 lower:(int)a5 upper:(int)a6;
- (void)_addRanges:(int)a3 name:(id)a4 values:(id)a5;
- (void)_addResolution:(int)a3 name:(id)a4 unit:(int)a5 xres:(int)a6 yres:(int)a7;
- (void)_addString:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 value:(id)a7;
- (void)_addStrings:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 values:(id)a7;
- (void)_deleteAttribute:(id)a3;
- (void)_withGroupingBehavior:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAttributes:(id)a3;
- (void)replaceOrAddAttribute:(id)a3 withAttribute:(id)a4 settingGroup:(int)a5;
- (void)setOp_or_status:(unsigned __int16)a3;
- (void)setRequest_id:(unsigned int)a3;
- (void)setState:(int)a3;
- (void)withNewAttr:(id)a3 groupTag:(int)a4 valueTag:(int)a5 apply:(id)a6;
@end

@implementation PK_ipp_t

- (PK_ipp_t)init
{
  v6.receiver = self;
  v6.super_class = (Class)PK_ipp_t;
  v2 = [(PK_ipp_t *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    attrs = v2->_attrs;
    v2->_attrs = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)_initWithAttrs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PK_ipp_t *)self init];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          attrs = v5->_attrs;
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "copy", (void)v13);
          [(NSMutableArray *)attrs addObject:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (void)_addAttrToAppropriateGroup:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(NSMutableArray *)self->_attrs count];
  int v5 = objc_msgSend(v10, "group_tag");
  if (!v4) {
    goto LABEL_13;
  }
  int v6 = v5;
  uint64_t v7 = 0;
  unint64_t v8 = -1;
  while (1)
  {
    uint64_t v9 = [(NSMutableArray *)self->_attrs objectAtIndexedSubscript:v7];
    if (objc_msgSend(v9, "group_tag") != v6) {
      break;
    }
    unint64_t v8 = ++v7;
LABEL_7:

    if (v7 == v4) {
      goto LABEL_10;
    }
  }
  if (v8 == -1)
  {
    ++v7;
    goto LABEL_7;
  }

LABEL_10:
  if (v8 != -1 && v8 < v4)
  {
    [(NSMutableArray *)self->_attrs insertObject:v10 atIndex:v8];
    goto LABEL_14;
  }
LABEL_13:
  [(NSMutableArray *)self->_attrs addObject:v10];
LABEL_14:
}

- (void)_withGroupingBehavior:(id)a3
{
  id v4 = a3;
  BOOL addAttributesInAppropriateGroups = self->_addAttributesInAppropriateGroups;
  self->_BOOL addAttributesInAppropriateGroups = 1;
  id v6 = v4;
  (*((void (**)(id, PK_ipp_t *))v4 + 2))(v4, self);
  self->_BOOL addAttributesInAppropriateGroups = addAttributesInAppropriateGroups;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PK_ipp_t)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dataRepresentation"];
  id v6 = [(PK_ipp_t *)self initWithData:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PK_ipp_t *)self dataRepresentation];
  [v5 encodeObject:v4 forKey:@"_dataRepresentation"];
}

- (id)_descriptionLeader
{
  return @"raw collection";
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PK_ipp_t;
  id v4 = [(PK_ipp_t *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ { %d attrs @ %p }", v4, -[NSMutableArray count](self->_attrs, "count"), self->_attrs];

  return v5;
}

- (id)debugDescription
{
  v2 = [(PK_ipp_t *)self userCodableDictionary];
  uint64_t v3 = [v2 allKeys];
  id v4 = [v3 firstObject];

  id v5 = NSString;
  id v6 = [v2 objectForKeyedSubscript:v4];
  objc_super v7 = [v5 stringWithFormat:@"%@ { %@ }", v4, v6];

  return v7;
}

- (id)userCodableDictionary
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  attrs = self->_attrs;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __33__PK_ipp_t_userCodableDictionary__block_invoke;
  v13[3] = &unk_2649EC008;
  id v5 = v3;
  id v14 = v5;
  [(NSMutableArray *)attrs enumerateObjectsUsingBlock:v13];
  id v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PK_ipp_t;
  objc_super v7 = [(PK_ipp_t *)&v12 description];
  unint64_t v8 = [(PK_ipp_t *)self _descriptionLeader];
  uint64_t v9 = [v6 stringWithFormat:@"%@ %@", v7, v8];

  long long v15 = v9;
  v16[0] = v5;
  id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  return v10;
}

- (void)enumerateAttributes:(id)a3
{
  id v4 = a3;
  attrs = self->_attrs;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__PK_ipp_t_enumerateAttributes___block_invoke;
  v7[3] = &unk_2649EC030;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)attrs enumerateObjectsUsingBlock:v7];
}

- (void)replaceOrAddAttribute:(id)a3 withAttribute:(id)a4 settingGroup:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  attrs = self->_attrs;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__PK_ipp_t_replaceOrAddAttribute_withAttribute_settingGroup___block_invoke;
  v15[3] = &unk_2649EC058;
  id v11 = v8;
  id v16 = v11;
  uint64_t v12 = [(NSMutableArray *)attrs indexOfObjectPassingTest:v15];
  long long v13 = (void *)[v9 _copySettingGroup:v5];
  id v14 = self->_attrs;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)v14 addObject:v13];
  }
  else {
    [(NSMutableArray *)v14 replaceObjectAtIndex:v12 withObject:v13];
  }
}

- (PK_ipp_t)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PK_ipp_t *)self init];
  if (v5)
  {
    uint64_t v17 = 0;
    id v6 = v4;
    id v18 = v6;
    objc_super v7 = (void *)MEMORY[0x230FA8DB0]([(PK_ipp_t *)v5 setState:0]);
    do
    {
      int v8 = ippReadIO(&v17, (uint64_t (*)(void *, unsigned __int8 *, unint64_t))_read_cb, v5);
      int v9 = v8;
    }
    while (v8 != -1 && v8 != 3);
    if (v9 == 3)
    {
      uint64_t v11 = [v6 length];
      if (v11 - v17 < 1)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v12 = objc_msgSend(v6, "subdataWithRange:");
      dataRemaining = v5->_dataRemaining;
      v5->_dataRemaining = (NSData *)v12;
    }
    else
    {
      id v14 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_22EA54000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't convert data to ipp", v16, 2u);
      }

      dataRemaining = v5;
      uint64_t v5 = 0;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (id)dataRepresentation
{
  [(PK_ipp_t *)self setState:0];
  uint64_t v3 = [MEMORY[0x263EFF990] dataWithCapacity:0];
  id v4 = (void *)MEMORY[0x230FA8DB0]();
  ippWriteIO(v3, (uint64_t (*)(void *, unsigned __int8 *, unint64_t))_write_cb, self);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PK_ipp_t *)self dataRepresentation];
  id v6 = [v4 dataRepresentation];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PK_ipp_t *)self dataRepresentation];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v3 = [(PK_ipp_t *)self dataRepresentation];
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v3];

  return v4;
}

- (id)mutableCopy
{
  return [(PK_ipp_t *)self copyWithZone:0];
}

- (void)withNewAttr:(id)a3 groupTag:(int)a4 valueTag:(int)a5 apply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v12 = a3;
  id v10 = (void (**)(id, PK_ipp_attribute_t *))a6;
  uint64_t v11 = [[PK_ipp_attribute_t alloc] initWithName:v12 group:v8 value:v7];
  v10[2](v10, v11);
  if (self->_addAttributesInAppropriateGroups) {
    [(PK_ipp_t *)self _addAttrToAppropriateGroup:v11];
  }
  else {
    [(NSMutableArray *)self->_attrs addObject:v11];
  }
}

- (id)addNewEmptyAttribute:(id)a3 groupTag:(int)a4 valueTag:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v9 = [[PK_ipp_attribute_t alloc] initWithName:v8 group:v6 value:v5];
  if (self->_addAttributesInAppropriateGroups) {
    [(PK_ipp_t *)self _addAttrToAppropriateGroup:v9];
  }
  else {
    [(NSMutableArray *)self->_attrs addObject:v9];
  }

  return v9;
}

- (void)_addRange:(int)a3 name:(id)a4 lower:(int)a5 upper:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  if (v10 && v8 <= 5 && v8 != 3)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__PK_ipp_t__addRange_name_lower_upper___block_invoke;
    v11[3] = &__block_descriptor_40_e28_v16__0__PK_ipp_attribute_t_8l;
    int v12 = a5;
    int v13 = a6;
    [(PK_ipp_t *)self withNewAttr:v10 groupTag:v8 valueTag:51 apply:v11];
  }
}

- (void)_addRanges:(int)a3 name:(id)a4 values:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v6 <= 5 && v6 != 3 && [v9 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__PK_ipp_t__addRanges_name_values___block_invoke;
    v11[3] = &unk_2649EC0E8;
    id v12 = v10;
    [(PK_ipp_t *)self withNewAttr:v8 groupTag:v6 valueTag:51 apply:v11];
  }
}

- (void)_addBoolean:(int)a3 name:(id)a4 value:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v8 && v6 <= 5 && v6 != 3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__PK_ipp_t__addBoolean_name_value___block_invoke;
    v9[3] = &__block_descriptor_33_e28_v16__0__PK_ipp_attribute_t_8l;
    BOOL v10 = a5;
    [(PK_ipp_t *)self withNewAttr:v8 groupTag:v6 valueTag:34 apply:v9];
  }
}

- (void)_addInteger:(int)a3 valueTag:(int)a4 name:(id)a5 value:(int)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  if (v10 && v8 <= 5 && v8 != 3)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke;
    v11[3] = &__block_descriptor_36_e28_v16__0__PK_ipp_attribute_t_8l;
    int v12 = a6;
    [(PK_ipp_t *)self withNewAttr:v10 groupTag:v8 valueTag:v7 apply:v11];
  }
}

- (void)_addString:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 value:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  v17[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = v14;
  if (v14 && v10 <= 5 && v10 != 3)
  {
    v17[0] = v14;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(PK_ipp_t *)self _addStrings:v10 valueTag:v9 name:v12 lang:v13 values:v16];
  }
}

- (void)_addStrings:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 values:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = v14;
  if (v12 && v10 <= 5 && v10 != 3 && [v14 count])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke;
    v16[3] = &unk_2649EC190;
    id v17 = v15;
    id v18 = v13;
    int v19 = v9;
    [(PK_ipp_t *)self withNewAttr:v12 groupTag:v10 valueTag:v9 apply:v16];
  }
}

- (void)_addCollection:(int)a3 name:(id)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8 && v6 <= 5 && v6 != 3)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__PK_ipp_t__addCollection_name_value___block_invoke;
    v11[3] = &unk_2649EC0E8;
    id v12 = v9;
    [(PK_ipp_t *)self withNewAttr:v8 groupTag:v6 valueTag:52 apply:v11];
  }
}

- (void)_addResolution:(int)a3 name:(id)a4 unit:(int)a5 xres:(int)a6 yres:(int)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  if (v12
    && v10 <= 5
    && v10 != 3
    && ((a7 | a6) & 0x80000000) == 0
    && (a5 - 5) >= 0xFFFFFFFE)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke;
    v13[3] = &__block_descriptor_44_e28_v16__0__PK_ipp_attribute_t_8l;
    int v14 = a6;
    int v15 = a7;
    int v16 = a5;
    [(PK_ipp_t *)self withNewAttr:v12 groupTag:v10 valueTag:50 apply:v13];
  }
}

- (void)_addOctetString:(int)a3 name:(id)a4 data:(const void *)a5 length:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  if (v10 && v8 <= 5 && v8 != 3 && !(a6 >> 15))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__PK_ipp_t__addOctetString_name_data_length___block_invoke;
    v11[3] = &__block_descriptor_44_e28_v16__0__PK_ipp_attribute_t_8l;
    void v11[4] = a5;
    int v12 = a6;
    [(PK_ipp_t *)self withNewAttr:v10 groupTag:v8 valueTag:48 apply:v11];
  }
}

- (void)_deleteAttribute:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_attrs, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_attrs removeObjectAtIndex:v4];
  }
}

- (void)_addIntegers:(int)a3 valueTag:(int)a4 name:(id)a5 count:(unint64_t)a6 adder:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a7;
  int v14 = v13;
  if (v12 && v10 <= 5 && v10 != 3 && a6)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke;
    v15[3] = &unk_2649EC248;
    id v16 = v13;
    unint64_t v17 = a6;
    [(PK_ipp_t *)self withNewAttr:v12 groupTag:v10 valueTag:v9 apply:v15];
  }
}

- (id)_findAttribute0:(id)a3 valueTag:(int)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v16 = 0;
    unint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    int v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    uint64_t v8 = [v6 lowercaseString];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__PK_ipp_t__findAttribute0_valueTag___block_invoke;
    v12[3] = &unk_2649EC270;
    id v13 = v8;
    int v14 = &v16;
    int v15 = a4;
    id v9 = v8;
    [(PK_ipp_t *)self enumerateAttributes:v12];
    id v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSData)dataRemaining
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (unsigned)request_id
{
  return self->_request_id;
}

- (void)setRequest_id:(unsigned int)a3
{
  self->_request_id = a3;
}

- (unsigned)op_or_status
{
  return self->_op_or_status;
}

- (void)setOp_or_status:(unsigned __int16)a3
{
  self->_op_or_status = a3;
}

- (NSMutableArray)attrs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRemaining, 0);

  objc_storeStrong((id *)&self->_attrs, 0);
}

@end