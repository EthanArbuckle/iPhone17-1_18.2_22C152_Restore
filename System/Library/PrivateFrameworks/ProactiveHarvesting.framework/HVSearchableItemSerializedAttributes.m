@interface HVSearchableItemSerializedAttributes
+ (id)serializedAttributesWithAttributeSetData:(id)a3 attributeSetCoder:(id)a4 htmlContentData:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSerializedAttributes:(id)a3;
- (CSCoder)attributeSetCoder;
- (HVSearchableItemSerializedAttributes)initWithAttributeSetData:(id)a3 attributeSetCoder:(id)a4 htmlContentData:(id)a5;
- (NSData)attributeSetData;
- (NSData)htmlContentData;
- (unint64_t)hash;
@end

@implementation HVSearchableItemSerializedAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_attributeSetCoder, 0);

  objc_storeStrong((id *)&self->_attributeSetData, 0);
}

- (NSData)htmlContentData
{
  return self->_htmlContentData;
}

- (CSCoder)attributeSetCoder
{
  return self->_attributeSetCoder;
}

- (NSData)attributeSetData
{
  return self->_attributeSetData;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_attributeSetData hash];
  uint64_t v4 = [(CSCoder *)self->_attributeSetCoder hash] - v3 + 32 * v3;
  return [(NSData *)self->_htmlContentData hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HVSearchableItemSerializedAttributes *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(HVSearchableItemSerializedAttributes *)self isEqualToSerializedAttributes:v5];

  return v6;
}

- (BOOL)isEqualToSerializedAttributes:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_attributeSetData != 0;
  v7 = [v4 attributeSetData];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  attributeSetData = self->_attributeSetData;
  if (attributeSetData)
  {
    v10 = [v5 attributeSetData];
    int v11 = [(NSData *)attributeSetData isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_attributeSetCoder != 0;
  v13 = [v5 attributeSetCoder];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  attributeSetCoder = self->_attributeSetCoder;
  if (attributeSetCoder)
  {
    v16 = [v5 attributeSetCoder];
    int v17 = [(CSCoder *)attributeSetCoder isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_htmlContentData != 0;
  v19 = [v5 htmlContentData];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    htmlContentData = self->_htmlContentData;
    if (htmlContentData)
    {
      v22 = [v5 htmlContentData];
      char v23 = [(NSData *)htmlContentData isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (HVSearchableItemSerializedAttributes)initWithAttributeSetData:(id)a3 attributeSetCoder:(id)a4 htmlContentData:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HVSearchableItemSerializedAttributes.m", 12, @"Invalid parameter not satisfying: %@", @"attributeSetData" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  int v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HVSearchableItemSerializedAttributes.m", 13, @"Invalid parameter not satisfying: %@", @"attributeSetCoder" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HVSearchableItemSerializedAttributes;
  v13 = [(HVSearchableItemSerializedAttributes *)&v18 init];
  int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_attributeSetData, a3);
    objc_storeStrong((id *)&v14->_attributeSetCoder, a4);
    objc_storeStrong((id *)&v14->_htmlContentData, a5);
  }

  return v14;
}

+ (id)serializedAttributesWithAttributeSetData:(id)a3 attributeSetCoder:(id)a4 htmlContentData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithAttributeSetData:v10 attributeSetCoder:v9 htmlContentData:v8];

  return v11;
}

@end