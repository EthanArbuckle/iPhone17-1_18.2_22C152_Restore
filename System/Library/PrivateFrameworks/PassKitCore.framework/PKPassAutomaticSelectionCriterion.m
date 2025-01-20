@interface PKPassAutomaticSelectionCriterion
+ (BOOL)supportsSecureCoding;
+ (id)criterionForExpressMode:(id)a3;
+ (id)expressModeForCriterion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsExpress;
- (BOOL)supportsInSessionExpress;
- (NSData)mask;
- (NSSet)TCIs;
- (NSSet)associatedReaderIDs;
- (NSSet)primaryTCIs;
- (NSSet)readerIDs;
- (NSString)type;
- (PKPassAutomaticSelectionCriterion)initWithCoder:(id)a3;
- (PKPassAutomaticSelectionCriterion)initWithDictionary:(id)a3;
- (id)asDictionary;
- (id)description;
- (int64_t)technologyType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedReaderIDs:(id)a3;
- (void)setMask:(id)a3;
- (void)setPrimaryTCIs:(id)a3;
- (void)setReaderIDs:(id)a3;
- (void)setSupportsExpress:(BOOL)a3;
- (void)setSupportsInSessionExpress:(BOOL)a3;
- (void)setTCIs:(id)a3;
- (void)setTechnologyType:(int64_t)a3;
- (void)setType:(id)a3;
@end

@implementation PKPassAutomaticSelectionCriterion

- (PKPassAutomaticSelectionCriterion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 PKStringForKey:@"type"];
    uint64_t v7 = PKPassAutomaticSelectionTechnologyTypeFromType(v6);
    if (v6)
    {
      int64_t v8 = v7;
      v9 = [(PKPassAutomaticSelectionCriterion *)self init];
      if (!v9)
      {
LABEL_25:
        self = v9;

        v6 = self;
        goto LABEL_26;
      }
      uint64_t v10 = [(PKPassAutomaticSelectionCriterion *)v6 copy];
      type = v9->_type;
      v9->_type = (NSString *)v10;

      v9->_technologyType = v8;
      if (v8 == 5)
      {
        v22 = [v5 PKStringForKey:@"openLoopExpressMask"];
        uint64_t v23 = objc_msgSend(v22, "pk_decodeHexadecimal");
        mask = v9->_mask;
        v9->_mask = (NSData *)v23;

        v25 = [(NSData *)v9->_mask bytes];
        unint64_t v26 = [(NSData *)v9->_mask length];
        if (v26)
        {
          if (*v25)
          {
            BOOL v21 = 1;
          }
          else
          {
            uint64_t v31 = 1;
            while (v26 != v31)
            {
              if (v25[v31++])
              {
                unint64_t v33 = v31 - 1;
                goto LABEL_21;
              }
            }
            unint64_t v33 = v26;
LABEL_21:
            BOOL v21 = v33 < v26;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        if (v8 != 4)
        {
          BOOL v21 = 1;
          goto LABEL_23;
        }
        v12 = [v5 PKArrayContaining:objc_opt_class() forKey:@"primaryTCIs"];
        uint64_t v13 = __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(v12, 0);
        primaryTCIs = v9->_primaryTCIs;
        v9->_primaryTCIs = (NSSet *)v13;

        v15 = [v5 PKArrayContaining:objc_opt_class() forKey:@"tcis"];
        uint64_t v16 = __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(v15, v9->_primaryTCIs);
        TCIs = v9->_TCIs;
        v9->_TCIs = (NSSet *)v16;

        v18 = [v5 PKArrayContaining:objc_opt_class() forKey:@"readerIDs"];
        uint64_t v19 = __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(v18, 0);
        readerIDs = v9->_readerIDs;
        v9->_readerIDs = (NSSet *)v19;

        if ([(NSSet *)v9->_primaryTCIs count]) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = [(NSSet *)v9->_TCIs count] != 0;
        }
        v22 = [v5 PKArrayContaining:objc_opt_class() forKey:@"associatedReaderIDs"];
        v27 = (void *)MEMORY[0x1E4F1CAD0];
        v28 = objc_msgSend(v22, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_45_0);
        uint64_t v29 = [v27 setWithArray:v28];
        associatedReaderIDs = v9->_associatedReaderIDs;
        v9->_associatedReaderIDs = (NSSet *)v29;
      }
LABEL_23:
      v9->_supportsInSessionExpress = [v5 PKBoolForKey:@"supportsInSessionExpress"];
      v34 = [v5 objectForKeyedSubscript:@"supportsExpress"];
      v9->_supportsExpress = [v34 BOOLValue];

      if (!v21)
      {

        v9 = 0;
      }
      goto LABEL_25;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_26:

  return v6;
}

id __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "pk_decodeHexadecimal", (void)v14);
        if ([v11 length] && (!v4 || (objc_msgSend(v4, "containsObject:", v11) & 1) == 0)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    v12 = (void *)[v5 copy];
  }
  else {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  uint64_t v4 = [(NSSet *)self->_primaryTCIs hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSSet *)self->_TCIs hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSData *)self->_mask hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSSet *)self->_readerIDs hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSSet *)self->_associatedReaderIDs hash];
  uint64_t v9 = self->_supportsInSessionExpress - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  return self->_supportsExpress - v9 + 32 * v9 + 0xD2FD88B5F11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_associatedReaderIDs, 0);
  objc_storeStrong((id *)&self->_readerIDs, 0);
  objc_storeStrong((id *)&self->_TCIs, 0);
  objc_storeStrong((id *)&self->_primaryTCIs, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)expressModeForCriterion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 technologyType];
    switch(v5)
    {
      case 3:
        uint64_t v6 = (id *)&PKPaymentExpressModeTypeAGeneric;
        goto LABEL_7;
      case 2:
        uint64_t v8 = [v4 type];
        if ([v8 hasPrefix:@"ecp.1.access."])
        {
          id v7 = [v8 stringByReplacingCharactersInRange:0, objc_msgSend(@"ecp.1.access.", "length"), @"access.hid." withString];

          goto LABEL_12;
        }

        break;
      case 1:
        uint64_t v6 = (id *)&PKPaymentExpressModeSuica;
LABEL_7:
        id v7 = *v6;
        goto LABEL_12;
    }
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

- (int64_t)technologyType
{
  return self->_technologyType;
}

- (BOOL)supportsExpress
{
  return self->_supportsExpress;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  [v5 encodeObject:self->_primaryTCIs forKey:@"primaryTCIs"];
  [v5 encodeObject:self->_TCIs forKey:@"tcis"];
  [v5 encodeObject:self->_mask forKey:@"mask"];
  [v5 encodeBool:self->_supportsExpress forKey:@"supportsExpress"];
  [v5 encodeBool:self->_supportsInSessionExpress forKey:@"supportsInSessionExpress"];
  [v5 encodeObject:self->_readerIDs forKey:@"readerIDs"];
  [v5 encodeObject:self->_associatedReaderIDs forKey:@"associatedReaderIDs"];
}

- (PKPassAutomaticSelectionCriterion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassAutomaticSelectionCriterion *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    v5->_technologyType = PKPassAutomaticSelectionTechnologyTypeFromType(v5->_type);
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"primaryTCIs"];
    primaryTCIs = v5->_primaryTCIs;
    v5->_primaryTCIs = (NSSet *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    long long v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"tcis"];
    TCIs = v5->_TCIs;
    v5->_TCIs = (NSSet *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mask"];
    mask = v5->_mask;
    v5->_mask = (NSData *)v18;

    v5->_supportsExpress = [v4 decodeBoolForKey:@"supportsExpress"];
    v5->_supportsInSessionExpress = [v4 decodeBoolForKey:@"supportsInSessionExpress"];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"readerIDs"];
    readerIDs = v5->_readerIDs;
    v5->_readerIDs = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"associatedReaderIDs"];
    associatedReaderIDs = v5->_associatedReaderIDs;
    v5->_associatedReaderIDs = (NSSet *)v28;
  }
  return v5;
}

+ (id)criterionForExpressMode:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"supportsExpress"];
  if (([v3 isEqualToString:@"transit.felica.suica"] & 1) == 0)
  {
    if ([v3 hasPrefix:@"access.hid."])
    {
      id v5 = [v3 stringByReplacingCharactersInRange:0, objc_msgSend(@"access.hid.", "length"), @"ecp.1.access." withString];
      if (v5) {
        goto LABEL_10;
      }
    }
    else if ([v3 isEqualToString:@"type_a.generic"])
    {
      id v5 = @"generic.type_a";
      goto LABEL_10;
    }
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  id v5 = @"suica";
LABEL_10:
  [v4 setObject:v5 forKeyedSubscript:@"type"];
  uint64_t v6 = [[PKPassAutomaticSelectionCriterion alloc] initWithDictionary:v4];

LABEL_12:
LABEL_13:

  return v6;
}

PKASCAssociatedReaderID *__56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKASCAssociatedReaderID alloc] initWithDictionary:v2];

  return v3;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  type = self->_type;
  if (type) {
    [v3 setObject:type forKeyedSubscript:@"type"];
  }
  if ([(NSSet *)self->_primaryTCIs count])
  {
    uint64_t v6 = [(NSSet *)self->_primaryTCIs pk_setByApplyingBlock:&__block_literal_global_49];
    id v7 = [v6 allObjects];
    [v4 setObject:v7 forKeyedSubscript:@"primaryTCIs"];
  }
  if ([(NSSet *)self->_TCIs count])
  {
    uint64_t v8 = [(NSSet *)self->_TCIs pk_setByApplyingBlock:&__block_literal_global_51_0];
    uint64_t v9 = [v8 allObjects];
    [v4 setObject:v9 forKeyedSubscript:@"tcis"];
  }
  if ([(NSSet *)self->_readerIDs count])
  {
    uint64_t v10 = [(NSSet *)self->_readerIDs pk_setByApplyingBlock:&__block_literal_global_53_0];
    uint64_t v11 = [v10 allObjects];
    [v4 setObject:v11 forKeyedSubscript:@"readerIDs"];
  }
  if ([(NSSet *)self->_associatedReaderIDs count])
  {
    v12 = [(NSSet *)self->_associatedReaderIDs pk_setByApplyingBlock:&__block_literal_global_56_1];
    uint64_t v13 = [v12 allObjects];
    [v4 setObject:v13 forKeyedSubscript:@"associatedReaderIDs"];
  }
  mask = self->_mask;
  if (mask)
  {
    long long v15 = [(NSData *)mask hexEncoding];
    [v4 setObject:v15 forKeyedSubscript:@"openLoopExpressMask"];
  }
  uint64_t v16 = [NSNumber numberWithBool:self->_supportsInSessionExpress];
  [v4 setObject:v16 forKeyedSubscript:@"supportsInSessionExpress"];

  long long v17 = [NSNumber numberWithBool:self->_supportsExpress];
  [v4 setObject:v17 forKeyedSubscript:@"supportsExpress"];

  uint64_t v18 = (void *)[v4 copy];
  return v18;
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hexEncoding];
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hexEncoding];
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hexEncoding];
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 asDictionary];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassAutomaticSelectionCriterion *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    id v7 = v6;
    if (!v6) {
      goto LABEL_48;
    }
    type = v6->_type;
    uint64_t v9 = self->_type;
    if (type) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (type != v9) {
        goto LABEL_48;
      }
    }
    else if ((-[NSString isEqual:](type, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    primaryTCIs = v7->_primaryTCIs;
    uint64_t v13 = self->_primaryTCIs;
    if (primaryTCIs) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      if (primaryTCIs != v13) {
        goto LABEL_48;
      }
    }
    else if ((-[NSSet isEqual:](primaryTCIs, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    TCIs = v7->_TCIs;
    uint64_t v16 = self->_TCIs;
    if (TCIs) {
      BOOL v17 = v16 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      if (TCIs != v16) {
        goto LABEL_48;
      }
    }
    else if ((-[NSSet isEqual:](TCIs, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    mask = v7->_mask;
    uint64_t v19 = self->_mask;
    if (mask) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20)
    {
      if (mask != v19) {
        goto LABEL_48;
      }
    }
    else if ((-[NSData isEqual:](mask, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    if (v7->_supportsInSessionExpress == self->_supportsInSessionExpress
      && v7->_supportsExpress == self->_supportsExpress)
    {
      readerIDs = v7->_readerIDs;
      v22 = self->_readerIDs;
      if (readerIDs && v22)
      {
        if (-[NSSet isEqual:](readerIDs, "isEqual:"))
        {
LABEL_44:
          associatedReaderIDs = v7->_associatedReaderIDs;
          v24 = self->_associatedReaderIDs;
          if (associatedReaderIDs && v24) {
            char v11 = -[NSSet isEqual:](associatedReaderIDs, "isEqual:");
          }
          else {
            char v11 = associatedReaderIDs == v24;
          }
          goto LABEL_49;
        }
      }
      else if (readerIDs == v22)
      {
        goto LABEL_44;
      }
    }
LABEL_48:
    char v11 = 0;
LABEL_49:

    goto LABEL_50;
  }
  char v11 = 1;
LABEL_50:

  return v11;
}

- (id)description
{
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; Type %@; Supports Express %ld; ",
    objc_opt_class(),
    self,
    self->_type,
  id v3 = self->_supportsExpress);
  if ([(NSSet *)self->_primaryTCIs count]) {
    [v3 appendFormat:@"Primary TCIs %@; ", self->_primaryTCIs];
  }
  if ([(NSSet *)self->_TCIs count]) {
    [v3 appendFormat:@"TCIs %@; ", self->_TCIs];
  }
  if ([(NSData *)self->_mask length]) {
    [v3 appendFormat:@"Mask %@; ", self->_mask];
  }
  objc_msgSend(v3, "appendFormat:", @"Supports In Session Express %ld; ", self->_supportsInSessionExpress);
  if ([(NSSet *)self->_readerIDs count]) {
    [v3 appendFormat:@"ReaderIds %@; ", self->_readerIDs];
  }
  if ([(NSSet *)self->_associatedReaderIDs count]) {
    [v3 appendFormat:@"AssociatedReaderIDs %@; ", self->_associatedReaderIDs];
  }
  [v3 appendString:@" >"];
  return v3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void)setTechnologyType:(int64_t)a3
{
  self->_technologyType = a3;
}

- (void)setSupportsExpress:(BOOL)a3
{
  self->_supportsExpress = a3;
}

- (BOOL)supportsInSessionExpress
{
  return self->_supportsInSessionExpress;
}

- (void)setSupportsInSessionExpress:(BOOL)a3
{
  self->_supportsInSessionExpress = a3;
}

- (NSSet)primaryTCIs
{
  return self->_primaryTCIs;
}

- (void)setPrimaryTCIs:(id)a3
{
}

- (NSSet)TCIs
{
  return self->_TCIs;
}

- (void)setTCIs:(id)a3
{
}

- (NSSet)readerIDs
{
  return self->_readerIDs;
}

- (void)setReaderIDs:(id)a3
{
}

- (NSSet)associatedReaderIDs
{
  return self->_associatedReaderIDs;
}

- (void)setAssociatedReaderIDs:(id)a3
{
}

- (NSData)mask
{
  return self->_mask;
}

- (void)setMask:(id)a3
{
}

@end