@interface SFIndexState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)indexedMessageCount;
- (NSNumber)percentAttachmentsIndexed;
- (NSNumber)percentMessagesIndexed;
- (NSNumber)searchIndex;
- (NSNumber)totalMessageCount;
- (SFIndexState)initWithCoder:(id)a3;
- (SFIndexState)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIndexedMessageCount:(id)a3;
- (void)setPercentAttachmentsIndexed:(id)a3;
- (void)setPercentMessagesIndexed:(id)a3;
- (void)setSearchIndex:(id)a3;
- (void)setTotalMessageCount:(id)a3;
@end

@implementation SFIndexState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexedMessageCount, 0);
  objc_storeStrong((id *)&self->_totalMessageCount, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_percentAttachmentsIndexed, 0);
  objc_storeStrong((id *)&self->_percentMessagesIndexed, 0);
}

- (void)setIndexedMessageCount:(id)a3
{
}

- (NSNumber)indexedMessageCount
{
  return self->_indexedMessageCount;
}

- (void)setTotalMessageCount:(id)a3
{
}

- (NSNumber)totalMessageCount
{
  return self->_totalMessageCount;
}

- (void)setSearchIndex:(id)a3
{
}

- (NSNumber)searchIndex
{
  return self->_searchIndex;
}

- (void)setPercentAttachmentsIndexed:(id)a3
{
}

- (NSNumber)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (void)setPercentMessagesIndexed:(id)a3
{
}

- (NSNumber)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (unint64_t)hash
{
  v3 = [(SFIndexState *)self percentMessagesIndexed];
  uint64_t v4 = [v3 hash];
  v5 = [(SFIndexState *)self percentAttachmentsIndexed];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFIndexState *)self searchIndex];
  uint64_t v8 = [v7 hash];
  v9 = [(SFIndexState *)self totalMessageCount];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(SFIndexState *)self indexedMessageCount];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFIndexState *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(SFIndexState *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      uint64_t v6 = [(SFIndexState *)self percentMessagesIndexed];
      v7 = [(SFIndexState *)v5 percentMessagesIndexed];
      if ((v6 == 0) == (v7 != 0))
      {
        char v10 = 0;
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v8 = [(SFIndexState *)self percentMessagesIndexed];
      if (v8)
      {
        v9 = [(SFIndexState *)self percentMessagesIndexed];
        v47 = [(SFIndexState *)v5 percentMessagesIndexed];
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_35;
        }
        v46 = v9;
      }
      v48 = [(SFIndexState *)self percentAttachmentsIndexed];
      v11 = [(SFIndexState *)v5 percentAttachmentsIndexed];
      if ((v48 == 0) != (v11 != 0))
      {
        uint64_t v12 = [(SFIndexState *)self percentAttachmentsIndexed];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [(SFIndexState *)self percentAttachmentsIndexed];
          [(SFIndexState *)v5 percentAttachmentsIndexed];
          v44 = v43 = v14;
          if (!objc_msgSend(v14, "isEqual:"))
          {
            char v10 = 0;
            v18 = v44;
            goto LABEL_32;
          }
          v45 = v13;
        }
        else
        {
          v45 = 0;
        }
        v15 = [(SFIndexState *)self searchIndex];
        v16 = [(SFIndexState *)v5 searchIndex];
        if ((v15 == 0) != (v16 != 0))
        {
          v41 = v15;
          v42 = v16;
          uint64_t v40 = [(SFIndexState *)self searchIndex];
          if (v40)
          {
            v17 = [(SFIndexState *)self searchIndex];
            v38 = [(SFIndexState *)v5 searchIndex];
            v39 = v17;
            if (!objc_msgSend(v17, "isEqual:"))
            {
              char v10 = 0;
              v13 = v45;
              v18 = v44;
              v19 = (void *)v40;
              goto LABEL_30;
            }
          }
          v20 = [(SFIndexState *)self totalMessageCount];
          v21 = [(SFIndexState *)v5 totalMessageCount];
          if ((v20 == 0) == (v21 != 0))
          {

            char v10 = 0;
            v13 = v45;
            v18 = v44;
            v19 = (void *)v40;
            if (!v40) {
              goto LABEL_31;
            }
            goto LABEL_30;
          }
          v36 = v21;
          v37 = v20;
          v22 = [(SFIndexState *)self totalMessageCount];
          v18 = v44;
          if (v22)
          {
            v23 = [(SFIndexState *)self totalMessageCount];
            v33 = [(SFIndexState *)v5 totalMessageCount];
            v34 = v23;
            if (![v23 isEqual:v33])
            {
              char v10 = 0;
              goto LABEL_48;
            }
            v35 = v22;
          }
          else
          {
            v35 = 0;
          }
          v25 = [(SFIndexState *)self indexedMessageCount];
          v26 = [(SFIndexState *)v5 indexedMessageCount];
          if ((v25 == 0) == (v26 != 0))
          {

            char v10 = 0;
            v18 = v44;
            v22 = v35;
            if (!v35)
            {
LABEL_49:

              v19 = (void *)v40;
              v13 = v45;
              if (!v40)
              {
LABEL_31:

                if (!v13)
                {
LABEL_33:

LABEL_34:
                  v9 = v46;
                  if (!v8)
                  {
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_35:

                  goto LABEL_36;
                }
LABEL_32:

                goto LABEL_33;
              }
LABEL_30:

              goto LABEL_31;
            }
          }
          else
          {
            v31 = v26;
            v32 = v25;
            uint64_t v27 = [(SFIndexState *)self indexedMessageCount];
            v18 = v44;
            v22 = v35;
            if (v27)
            {
              v30 = (void *)v27;
              v29 = [(SFIndexState *)self indexedMessageCount];
              v28 = [(SFIndexState *)v5 indexedMessageCount];
              char v10 = [v29 isEqual:v28];

              if (!v35) {
                goto LABEL_49;
              }
            }
            else
            {

              char v10 = 1;
              if (!v35) {
                goto LABEL_49;
              }
            }
          }
LABEL_48:

          goto LABEL_49;
        }

        if (v45)
        {
        }
      }

      char v10 = 0;
      goto LABEL_34;
    }
    char v10 = 0;
  }
LABEL_38:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFIndexState *)self percentMessagesIndexed];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPercentMessagesIndexed:v6];

  v7 = [(SFIndexState *)self percentAttachmentsIndexed];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPercentAttachmentsIndexed:v8];

  v9 = [(SFIndexState *)self searchIndex];
  char v10 = (void *)[v9 copy];
  [v4 setSearchIndex:v10];

  v11 = [(SFIndexState *)self totalMessageCount];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setTotalMessageCount:v12];

  v13 = [(SFIndexState *)self indexedMessageCount];
  v14 = (void *)[v13 copy];
  [v4 setIndexedMessageCount:v14];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBIndexState alloc] initWithFacade:self];
  v3 = [(_SFPBIndexState *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBIndexState alloc] initWithFacade:self];
  v3 = [(_SFPBIndexState *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBIndexState alloc] initWithFacade:self];
  v5 = [(_SFPBIndexState *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFIndexState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBIndexState alloc] initWithData:v5];
  v7 = [(SFIndexState *)self initWithProtobuf:v6];

  return v7;
}

- (SFIndexState)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFIndexState;
  v5 = [(SFIndexState *)&v13 init];
  if (v5)
  {
    if ([v4 percentMessagesIndexed])
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "percentMessagesIndexed"));
      [(SFIndexState *)v5 setPercentMessagesIndexed:v6];
    }
    if ([v4 percentAttachmentsIndexed])
    {
      v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "percentAttachmentsIndexed"));
      [(SFIndexState *)v5 setPercentAttachmentsIndexed:v7];
    }
    if ([v4 searchIndex])
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "searchIndex"));
      [(SFIndexState *)v5 setSearchIndex:v8];
    }
    if ([v4 totalMessageCount])
    {
      v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "totalMessageCount"));
      [(SFIndexState *)v5 setTotalMessageCount:v9];
    }
    if ([v4 indexedMessageCount])
    {
      char v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "indexedMessageCount"));
      [(SFIndexState *)v5 setIndexedMessageCount:v10];
    }
    v11 = v5;
  }

  return v5;
}

@end