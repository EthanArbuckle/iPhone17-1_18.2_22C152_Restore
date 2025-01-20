@interface PREResponseItem
+ (BOOL)supportsSecureCoding;
+ (id)responseItemArrayFromResponseKitArray:(id)a3 forLocale:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponseItem:(id)a3;
- (NSNumber)categoryId;
- (NSNumber)isCustomResponse;
- (NSNumber)isRobotResponse;
- (NSNumber)modelId;
- (NSNumber)replySubgroupId;
- (NSNumber)replyTextId;
- (NSNumber)responseClassId;
- (NSString)language;
- (NSString)replyText;
- (PREResponseItem)initWithCategoryId:(id)a3 modelId:(id)a4 responseClassId:(id)a5 replySubgroupId:(id)a6 replyTextId:(id)a7 replyText:(id)a8 language:(id)a9 isCustomResponse:(id)a10 isRobotResponse:(id)a11;
- (PREResponseItem)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PREResponseItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isRobotResponse, 0);
  objc_storeStrong((id *)&self->_isCustomResponse, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_replyText, 0);
  objc_storeStrong((id *)&self->_replyTextId, 0);
  objc_storeStrong((id *)&self->_replySubgroupId, 0);
  objc_storeStrong((id *)&self->_responseClassId, 0);
  objc_storeStrong((id *)&self->_modelId, 0);

  objc_storeStrong((id *)&self->_categoryId, 0);
}

- (NSNumber)isRobotResponse
{
  return self->_isRobotResponse;
}

- (NSNumber)isCustomResponse
{
  return self->_isCustomResponse;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)replyText
{
  return self->_replyText;
}

- (NSNumber)replyTextId
{
  return self->_replyTextId;
}

- (NSNumber)replySubgroupId
{
  return self->_replySubgroupId;
}

- (NSNumber)responseClassId
{
  return self->_responseClassId;
}

- (NSNumber)modelId
{
  return self->_modelId;
}

- (NSNumber)categoryId
{
  return self->_categoryId;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"categoryId: %@, modelId: %@, responseClassId: %@, replySubgroupId: %@, replyTextId: %@, replyText: %@, language: %@, isCustomResponse: %@, isRobotResponse %@", self->_categoryId, self->_modelId, self->_responseClassId, self->_replySubgroupId, self->_replyTextId, self->_replyText, self->_language, self->_isCustomResponse, self->_isRobotResponse];

  return v2;
}

- (BOOL)isEqualToResponseItem:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_32;
  }
  categoryId = self->_categoryId;
  v7 = (NSNumber *)v4[1];
  if (categoryId == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = categoryId;
    char v10 = [(NSNumber *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_32;
    }
  }
  modelId = self->_modelId;
  v12 = (NSNumber *)v5[2];
  if (modelId == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = modelId;
    char v15 = [(NSNumber *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_32;
    }
  }
  responseClassId = self->_responseClassId;
  v17 = (NSNumber *)v5[3];
  if (responseClassId == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = responseClassId;
    char v20 = [(NSNumber *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_32;
    }
  }
  replySubgroupId = self->_replySubgroupId;
  v22 = (NSNumber *)v5[4];
  if (replySubgroupId == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = replySubgroupId;
    char v25 = [(NSNumber *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_32;
    }
  }
  replyTextId = self->_replyTextId;
  v27 = (NSNumber *)v5[5];
  if (replyTextId == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = replyTextId;
    char v30 = [(NSNumber *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_32;
    }
  }
  replyText = self->_replyText;
  v32 = (NSString *)v5[6];
  if (replyText == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = replyText;
    char v35 = [(NSString *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_32;
    }
  }
  language = self->_language;
  v37 = (NSString *)v5[7];
  if (language == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = language;
    char v40 = [(NSString *)v39 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_32;
    }
  }
  isCustomResponse = self->_isCustomResponse;
  v42 = (NSNumber *)v5[8];
  if (isCustomResponse == v42)
  {
  }
  else
  {
    v43 = v42;
    v44 = isCustomResponse;
    char v45 = [(NSNumber *)v44 isEqual:v43];

    if ((v45 & 1) == 0)
    {
LABEL_32:
      char v46 = 0;
      goto LABEL_33;
    }
  }
  v48 = self->_isRobotResponse;
  v49 = v48;
  if (v48 == v5[9]) {
    char v46 = 1;
  }
  else {
    char v46 = -[NSNumber isEqual:](v48, "isEqual:");
  }

LABEL_33:
  return v46;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREResponseItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PREResponseItem *)self isEqualToResponseItem:v5];

  return v6;
}

- (PREResponseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PREResponseItem;
  v5 = [(PREResponseItem *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryId"];
    categoryId = v5->_categoryId;
    v5->_categoryId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelId"];
    modelId = v5->_modelId;
    v5->_modelId = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseClassId"];
    responseClassId = v5->_responseClassId;
    v5->_responseClassId = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replySubgroupId"];
    replySubgroupId = v5->_replySubgroupId;
    v5->_replySubgroupId = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replyTextId"];
    replyTextId = v5->_replyTextId;
    v5->_replyTextId = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replyText"];
    if (!v16)
    {
      v24 = 0;
      goto LABEL_6;
    }
    replyText = v5->_replyText;
    v5->_replyText = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCustomResponse"];
    isCustomResponse = v5->_isCustomResponse;
    v5->_isCustomResponse = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRobotResponse"];
    isRobotResponse = v5->_isRobotResponse;
    v5->_isRobotResponse = (NSNumber *)v22;
  }
  v24 = v5;
LABEL_6:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  categoryId = self->_categoryId;
  id v5 = a3;
  [v5 encodeObject:categoryId forKey:@"categoryId"];
  [v5 encodeObject:self->_modelId forKey:@"modelId"];
  [v5 encodeObject:self->_responseClassId forKey:@"responseClassId"];
  [v5 encodeObject:self->_replySubgroupId forKey:@"replySubgroupId"];
  [v5 encodeObject:self->_replyTextId forKey:@"replyTextId"];
  [v5 encodeObject:self->_replyText forKey:@"replyText"];
  [v5 encodeObject:self->_language forKey:@"language"];
  [v5 encodeObject:self->_isCustomResponse forKey:@"isCustomResponse"];
  [v5 encodeObject:self->_isRobotResponse forKey:@"isRobotResponse"];
}

- (PREResponseItem)initWithCategoryId:(id)a3 modelId:(id)a4 responseClassId:(id)a5 replySubgroupId:(id)a6 replyTextId:(id)a7 replyText:(id)a8 language:(id)a9 isCustomResponse:(id)a10 isRobotResponse:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)PREResponseItem;
  v19 = [(PREResponseItem *)&v30 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_categoryId, a3);
    objc_storeStrong((id *)&v20->_modelId, a4);
    objc_storeStrong((id *)&v20->_responseClassId, a5);
    objc_storeStrong((id *)&v20->_replySubgroupId, a6);
    objc_storeStrong((id *)&v20->_replyTextId, a7);
    objc_storeStrong((id *)&v20->_replyText, a8);
    objc_storeStrong((id *)&v20->_language, a9);
    objc_storeStrong((id *)&v20->_isCustomResponse, a10);
    objc_storeStrong((id *)&v20->_isRobotResponse, a11);
  }

  return v20;
}

+ (id)responseItemArrayFromResponseKitArray:(id)a3 forLocale:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v6];
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    uint64_t v13 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        char v15 = [[PREResponseItem alloc] initWithCategoryId:0 modelId:0 responseClassId:0 replySubgroupId:0 replyTextId:0 replyText:*(void *)(*((void *)&v17 + 1) + 8 * i) language:v7 isCustomResponse:v13 isRobotResponse:v13];
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end