@interface CNVCardLine30SerializationStrategy
- (id)detectedTypeOfData:(id)a3;
- (void)_addAutomagicParametersForData:(id)a3;
- (void)serializeArray:(id)a3 withItemSeparator:(id)a4;
- (void)serializeData:(id)a3;
- (void)serializeGroupedLines:(id)a3 withGroupingName:(id)a4;
- (void)serializeGroupingName:(id)a3;
- (void)serializeParameters:(id)a3;
- (void)serializeString:(id)a3;
- (void)serializeVersionPlaceholder;
- (void)willSerializeValue;
@end

@implementation CNVCardLine30SerializationStrategy

- (void)willSerializeValue
{
  self->_startingLineLength = [(CNVCardSerializationStorage *)self->super._storage currentLength];
}

- (void)serializeGroupingName:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0) {
    [(CNVCardSerializationStorage *)self->super._storage appendFormat:@"%@.", v4];
  }
}

- (void)serializeParameters:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_9);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", @";%@",
          *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

id __58__CNVCardLine30SerializationStrategy_serializeParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 value];
  id v4 = +[CNVCardParameterEncoder encodeParameterValue:v3];

  uint64_t v5 = *MEMORY[0x1E4F5A298];
  uint64_t v6 = [v2 name];
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if (v5)
  {
    id v7 = v4;
  }
  else
  {
    uint64_t v8 = NSString;
    long long v9 = [v2 name];
    [v8 stringWithFormat:@"%@=%@", v9, v4];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)serializeGroupedLines:(id)a3 withGroupingName:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        [(CNVCardSerializationStorage *)self->super._storage appendFormat:@"%@.", v7];
        [v12 serializeWithStrategy:self];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)serializeString:(id)a3
{
  storage = self->super._storage;
  id v4 = +[CNVCardValueEncoder encodeValue:a3];
  [(CNVCardSerializationStorage *)storage appendFormat:@":%@", v4];
}

- (void)serializeArray:(id)a3 withItemSeparator:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_106);
  id v10 = v7;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = @";";
  }
  uint64_t v9 = [v7 componentsJoinedByString:v8];
  [(CNVCardSerializationStorage *)self->super._storage appendFormat:@":%@", v9];
}

id __71__CNVCardLine30SerializationStrategy_serializeArray_withItemSeparator___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNVCardValueEncoder encodeValue:a2];
}

- (void)serializeData:(id)a3
{
  id v4 = a3;
  [(CNVCardLine30SerializationStrategy *)self _addAutomagicParametersForData:v4];
  [(CNVCardSerializationStorage *)self->super._storage appendString:@":"];
  objc_msgSend(v4, "_cn_encodeVCardBase64DataWithInitialLength:", -[CNVCardSerializationStorage currentLength](self->super._storage, "currentLength") - self->_startingLineLength);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = (void *)[[NSString alloc] initWithData:v6 encoding:1];
  [(CNVCardSerializationStorage *)self->super._storage appendString:v5];
}

- (void)_addAutomagicParametersForData:(id)a3
{
  storage = self->super._storage;
  id v5 = a3;
  [(CNVCardSerializationStorage *)storage appendString:@";ENCODING=b"];
  uint64_t v6 = [(CNVCardLine30SerializationStrategy *)self detectedTypeOfData:v5];

  if (v6) {
    [(CNVCardSerializationStorage *)self->super._storage appendFormat:@";TYPE=%@", v6];
  }
  MEMORY[0x1F41817F8]();
}

- (id)detectedTypeOfData:(id)a3
{
  if (+[CNVCardData isJPEGData:a3]) {
    return @"JPEG";
  }
  else {
    return 0;
  }
}

- (void)serializeVersionPlaceholder
{
}

@end