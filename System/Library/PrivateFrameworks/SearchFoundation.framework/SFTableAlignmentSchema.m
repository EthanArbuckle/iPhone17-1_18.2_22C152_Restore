@interface SFTableAlignmentSchema
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)tableColumnAlignment;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)metadata;
- (SFTableAlignmentSchema)initWithCoder:(id)a3;
- (SFTableAlignmentSchema)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setTableColumnAlignment:(id)a3;
@end

@implementation SFTableAlignmentSchema

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tableColumnAlignment, 0);
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setTableColumnAlignment:(id)a3
{
}

- (NSArray)tableColumnAlignment
{
  return self->_tableColumnAlignment;
}

- (unint64_t)hash
{
  v3 = [(SFTableAlignmentSchema *)self tableColumnAlignment];
  uint64_t v4 = [v3 hash];
  v5 = [(SFTableAlignmentSchema *)self metadata];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFTableAlignmentSchema *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFTableAlignmentSchema *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFTableAlignmentSchema *)self tableColumnAlignment];
      v8 = [(SFTableAlignmentSchema *)v6 tableColumnAlignment];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFTableAlignmentSchema *)self tableColumnAlignment];
      if (v9)
      {
        v3 = [(SFTableAlignmentSchema *)self tableColumnAlignment];
        v10 = [(SFTableAlignmentSchema *)v6 tableColumnAlignment];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(SFTableAlignmentSchema *)self metadata];
      v13 = [(SFTableAlignmentSchema *)v6 metadata];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFTableAlignmentSchema *)self metadata];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFTableAlignmentSchema *)self metadata];
          [(SFTableAlignmentSchema *)v6 metadata];
          v17 = v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFTableAlignmentSchema *)self tableColumnAlignment];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setTableColumnAlignment:v6];

  v7 = [(SFTableAlignmentSchema *)self metadata];
  v8 = (void *)[v7 copy];
  [v4 setMetadata:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTableAlignmentSchema alloc] initWithFacade:self];
  v3 = [(_SFPBTableAlignmentSchema *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTableAlignmentSchema alloc] initWithFacade:self];
  v3 = [(_SFPBTableAlignmentSchema *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBTableAlignmentSchema alloc] initWithFacade:self];
  v5 = [(_SFPBTableAlignmentSchema *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFTableAlignmentSchema)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBTableAlignmentSchema alloc] initWithData:v5];
  v7 = [(SFTableAlignmentSchema *)self initWithProtobuf:v6];

  return v7;
}

- (SFTableAlignmentSchema)initWithProtobuf:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFTableAlignmentSchema;
  v5 = [(SFTableAlignmentSchema *)&v23 init];
  if (v5)
  {
    unint64_t v6 = [v4 tableColumnAlignments];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = objc_msgSend(v4, "tableColumnAlignments", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFTableColumnAlignment alloc] initWithProtobuf:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    [(SFTableAlignmentSchema *)v5 setTableColumnAlignment:v7];
    v14 = [v4 metadata];

    if (v14)
    {
      uint64_t v15 = [v4 metadata];
      v16 = _SFPBStringDictionaryHandwrittenTranslator(v15);
      [(SFTableAlignmentSchema *)v5 setMetadata:v16];
    }
    v17 = v5;
  }
  return v5;
}

@end