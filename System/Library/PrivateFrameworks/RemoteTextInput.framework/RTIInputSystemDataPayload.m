@interface RTIInputSystemDataPayload
+ (BOOL)supportsSecureCoding;
+ (id)payloadWithData:(id)a3;
+ (id)payloadWithData:(id)a3 version:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSUUID)sessionUUID;
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (RTIInputSystemDataPayload)initWithCoder:(id)a3;
- (RTITextOperations)textOperations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (void)_unarchiveData;
- (void)setDocumentState:(id)a3;
- (void)setDocumentTraits:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTextOperations:(id)a3;
- (void)updateData;
@end

@implementation RTIInputSystemDataPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTIInputSystemDataPayload)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RTIInputSystemDataPayload;
  v3 = [(RTIDataPayload *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RTIInputSystemDataPayload *)v3 _unarchiveData];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [RTIInputSystemDataPayload alloc];
  v5 = [(RTIInputSystemDataPayload *)self data];
  uint64_t v6 = [(RTIDataPayload *)v4 initWithData:v5 version:[(RTIDataPayload *)self version]];

  uint64_t v7 = [(NSUUID *)self->_sessionUUID copy];
  v8 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v7;

  *(unsigned char *)(v6 + 24) = self->_disableUpdate;
  uint64_t v9 = [(RTIDocumentState *)self->_documentState copy];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(RTIDocumentTraits *)self->_documentTraits copy];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTIInputSystemDataPayload *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v32.receiver = self;
      v32.super_class = (Class)RTIInputSystemDataPayload;
      if ([(RTIDataPayload *)&v32 isEqual:v5])
      {
        uint64_t v6 = [(RTIInputSystemDataPayload *)self sessionUUID];
        uint64_t v7 = [v5 sessionUUID];
        if (v6 == (void *)v7)
        {
        }
        else
        {
          v8 = (void *)v7;
          uint64_t v9 = [(RTIInputSystemDataPayload *)self sessionUUID];
          v10 = [v5 sessionUUID];
          int v11 = [v9 isEqual:v10];

          if (!v11) {
            goto LABEL_20;
          }
        }
        v13 = [(RTIInputSystemDataPayload *)self documentState];
        uint64_t v14 = [v5 documentState];
        if (v13 == (void *)v14)
        {
        }
        else
        {
          v15 = (void *)v14;
          v16 = [(RTIInputSystemDataPayload *)self documentState];
          v17 = [v5 documentState];
          int v18 = [v16 isEqual:v17];

          if (!v18) {
            goto LABEL_20;
          }
        }
        v19 = [(RTIInputSystemDataPayload *)self documentTraits];
        uint64_t v20 = [v5 documentTraits];
        if (v19 == (void *)v20)
        {
        }
        else
        {
          v21 = (void *)v20;
          v22 = [(RTIInputSystemDataPayload *)self documentTraits];
          v23 = [v5 documentTraits];
          int v24 = [v22 isEqual:v23];

          if (!v24) {
            goto LABEL_20;
          }
        }
        v25 = [(RTIInputSystemDataPayload *)self textOperations];
        uint64_t v26 = [v5 textOperations];
        if (v25 == (void *)v26)
        {
        }
        else
        {
          v27 = (void *)v26;
          v28 = [(RTIInputSystemDataPayload *)self textOperations];
          v29 = [v5 textOperations];
          int v30 = [v28 isEqual:v29];

          if (!v30) {
            goto LABEL_20;
          }
        }
        BOOL v12 = self->_disableUpdate == v5[24];
        goto LABEL_21;
      }
LABEL_20:
      BOOL v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    BOOL v12 = 0;
  }
LABEL_22:

  return v12;
}

+ (id)payloadWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithData:v4 version:1];

  [v5 _unarchiveData];
  return v5;
}

+ (id)payloadWithData:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithData:v6 version:a4];

  [v7 _unarchiveData];
  return v7;
}

- (id)data
{
  if (!self->_disableUpdate)
  {
    v7.receiver = self;
    v7.super_class = (Class)RTIInputSystemDataPayload;
    v3 = [(RTIDataPayload *)&v7 data];

    if (!v3) {
      [(RTIInputSystemDataPayload *)self updateData];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)RTIInputSystemDataPayload;
  id v4 = [(RTIDataPayload *)&v6 data];
  return v4;
}

- (void)updateData
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(RTIDocumentTraits *)self->_documentTraits fenceHandle];

  if (!v3)
  {
    id v4 = [(NSKeyedArchiver *)[RTIKeyedArchiver alloc] initRequiringSecureCoding:1];
    objc_msgSend(v4, "setRtiVersion:", -[RTIDataPayload version](self, "version"));
    documentState = self->_documentState;
    if (documentState) {
      [v4 encodeObject:documentState forKey:@"documentState"];
    }
    documentTraits = self->_documentTraits;
    if (documentTraits) {
      [v4 encodeObject:documentTraits forKey:@"documentTraits"];
    }
    textOperations = self->_textOperations;
    if (textOperations) {
      [v4 encodeObject:textOperations forKey:@"textOperations"];
    }
    sessionUUID = self->_sessionUUID;
    if (sessionUUID)
    {
      v11[0] = 0;
      v11[1] = 0;
      [(NSUUID *)sessionUUID getUUIDBytes:v11];
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v11 length:16];
      [v4 encodeObject:v9 forKey:@"sessionUUID"];
    }
    v10 = [v4 encodedData];
    [(RTIDataPayload *)self setData:v10];
  }
}

- (void)_unarchiveData
{
  self->_disableUpdate = 1;
  v3 = [(RTIInputSystemDataPayload *)self data];

  if (v3)
  {
    id v4 = [RTIKeyedUnarchiver alloc];
    v5 = [(RTIInputSystemDataPayload *)self data];
    id v15 = (id)[(RTIKeyedUnarchiver *)v4 initForReadingFromData:v5 error:0];

    objc_msgSend(v15, "setRtiVersion:", -[RTIDataPayload version](self, "version"));
    objc_super v6 = [v15 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
    documentState = self->_documentState;
    self->_documentState = v6;

    v8 = [v15 decodeObjectOfClass:objc_opt_class() forKey:@"documentTraits"];
    documentTraits = self->_documentTraits;
    self->_documentTraits = v8;

    v10 = [v15 decodeObjectOfClass:objc_opt_class() forKey:@"textOperations"];
    textOperations = self->_textOperations;
    self->_textOperations = v10;

    BOOL v12 = [v15 decodeObjectOfClass:objc_opt_class() forKey:@"sessionUUID"];
    if (v12)
    {
      v13 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v12, "bytes"));
      sessionUUID = self->_sessionUUID;
      self->_sessionUUID = v13;
    }
  }
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (RTITextOperations)textOperations
{
  return self->_textOperations;
}

- (void)setTextOperations:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_textOperations, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end