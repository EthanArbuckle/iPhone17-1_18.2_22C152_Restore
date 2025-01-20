@interface ICCRWeakReference
- (ICCRDocument)document;
- (ICCRWeakReference)initWithContents:(id)a3;
- (ICCRWeakReference)initWithContents:(id)a3 document:(id)a4;
- (ICCRWeakReference)initWithICCRCoder:(id)a3;
- (ICCRWeakReference)initWithIdentifier:(id)a3 document:(id)a4;
- (NSString)description;
- (NSUUID)identifier;
- (id)contents;
- (id)deltaSince:(id)a3 in:(id)a4;
- (void)encodeWithICCRCoder:(id)a3;
- (void)setDocument:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation ICCRWeakReference

- (ICCRWeakReference)initWithContents:(id)a3
{
  return [(ICCRWeakReference *)self initWithContents:a3 document:0];
}

- (ICCRWeakReference)initWithContents:(id)a3 document:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICCRWeakReference;
    v8 = [(ICCRWeakReference *)&v13 init];
    if (v8)
    {
      uint64_t v9 = [v6 identity];
      identifier = v8->_identifier;
      v8->_identifier = (NSUUID *)v9;

      objc_storeWeak((id *)&v8->_document, v7);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ICCRWeakReference)initWithIdentifier:(id)a3 document:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCRWeakReference;
  uint64_t v9 = [(ICCRWeakReference *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_document, v8);
  }

  return v10;
}

- (ICCRWeakReference)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 11)
  {
    id v6 = [v4 document];
    objc_storeWeak((id *)&self->_document, v6);

    if (*(_DWORD *)(v5 + 48) == 11) {
      uint64_t v7 = *(void *)(v5 + 40);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [v4 decodeUUIDFromUUIDIndex:v7];
    uint64_t v9 = [v4 document];
    self = [(ICCRWeakReference *)self initWithIdentifier:v8 document:v9];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 currentDocumentObjectForEncoding];
  uint64_t v5 = [(ICCRWeakReference *)self identifier];
  uint64_t v6 = [v7 encodeUUIDIndexFromUUID:v5];
  if (*(_DWORD *)(v4 + 48) != 11)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v4 + 48) = 11;
  }
  *(void *)(v4 + 40) = v6;
}

- (id)contents
{
  v3 = [(ICCRWeakReference *)self document];
  uint64_t v4 = [v3 objects];
  uint64_t v5 = [(ICCRWeakReference *)self identifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ICCRWeakReference *)self identifier];
  id v7 = objc_msgSend(v6, "CR_shortDescription");
  id v8 = [v3 stringWithFormat:@"<%@ %p %@>", v5, self, v7];

  return (NSString *)v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (ICCRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (ICCRDocument *)WeakRetained;
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_document);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end