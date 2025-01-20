@interface VIRegionOfInterestResultItem
- (BOOL)isEqual:(id)a3;
- (CSUSearchableKnowledgeObject)searchableKnowledgeObject;
- (NSString)caption;
- (NSString)domain;
- (VIObjectCategory)objectCategory;
- (VIObjectKnowledge)objectKnowledge;
- (VIOntologyNode)ontologyNode;
- (VIRegionOfInterestResultItem)initWithDomain:(id)a3 caption:(id)a4 thirdPartyObject:(id)a5 ontologyNode:(id)a6 objectKnowledge:(id)a7;
- (VIRegionOfInterestResultItem)initWithDomain:(id)a3 thirdPartyObject:(id)a4 ontologyNode:(id)a5 objectKnowledge:(id)a6;
- (VIThirdPartyObject)thirdPartyObject;
- (signed)csuSearchableKnowledgeObjectIdType;
- (unint64_t)hash;
@end

@implementation VIRegionOfInterestResultItem

- (VIRegionOfInterestResultItem)initWithDomain:(id)a3 thirdPartyObject:(id)a4 ontologyNode:(id)a5 objectKnowledge:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)VIRegionOfInterestResultItem;
  v15 = [(VIRegionOfInterestResultItem *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domain, a3);
    caption = v16->_caption;
    v16->_caption = (NSString *)&stru_1F3843BD8;

    uint64_t v18 = [v12 copy];
    thirdPartyObject = v16->_thirdPartyObject;
    v16->_thirdPartyObject = (VIThirdPartyObject *)v18;

    uint64_t v20 = [v13 copy];
    ontologyNode = v16->_ontologyNode;
    v16->_ontologyNode = (VIOntologyNode *)v20;

    uint64_t v22 = [v14 copy];
    objectKnowledge = v16->_objectKnowledge;
    v16->_objectKnowledge = (VIObjectKnowledge *)v22;
  }
  return v16;
}

- (VIRegionOfInterestResultItem)initWithDomain:(id)a3 caption:(id)a4 thirdPartyObject:(id)a5 ontologyNode:(id)a6 objectKnowledge:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)VIRegionOfInterestResultItem;
  uint64_t v18 = [(VIRegionOfInterestResultItem *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_domain, a3);
    objc_storeStrong((id *)&v19->_caption, a4);
    uint64_t v20 = [v15 copy];
    thirdPartyObject = v19->_thirdPartyObject;
    v19->_thirdPartyObject = (VIThirdPartyObject *)v20;

    uint64_t v22 = [v16 copy];
    ontologyNode = v19->_ontologyNode;
    v19->_ontologyNode = (VIOntologyNode *)v22;

    uint64_t v24 = [v17 copy];
    objectKnowledge = v19->_objectKnowledge;
    v19->_objectKnowledge = (VIObjectKnowledge *)v24;
  }
  return v19;
}

- (VIObjectCategory)objectCategory
{
  v3 = [VIObjectCategory alloc];
  uint64_t v4 = [(VIOntologyNode *)self->_ontologyNode knowledgeGraphID];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_1F3843BD8;
  }
  uint64_t v7 = [(VIOntologyNode *)self->_ontologyNode labelDebugDescription];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_1F3843BD8;
  }
  v10 = [(VIObjectCategory *)v3 initWithKnowledgeGraphID:v6 labelDebugDescription:v9];

  return v10;
}

- (signed)csuSearchableKnowledgeObjectIdType
{
  int v2 = [(VIObjectKnowledge *)self->_objectKnowledge csuIdType];
  if ((v2 - 1) >= 4) {
    return 0;
  }
  else {
    return v2;
  }
}

- (CSUSearchableKnowledgeObject)searchableKnowledgeObject
{
  id v3 = objc_alloc(MEMORY[0x1E4F5D0A0]);
  unint64_t v4 = [(VIObjectKnowledge *)self->_objectKnowledge csuQid];
  uint64_t v5 = [(VIRegionOfInterestResultItem *)self csuSearchableKnowledgeObjectIdType];
  v6 = [(VIObjectKnowledge *)self->_objectKnowledge csuLocalizedLabelDictionary];
  [(VIObjectKnowledge *)self->_objectKnowledge csuConfidence];
  double v8 = v7;
  BOOL v9 = [(VIObjectKnowledge *)self->_objectKnowledge csuSensitiveLocation];
  v10 = [(VIObjectKnowledge *)self->_objectKnowledge csuCategory];
  id v11 = [(VIObjectKnowledge *)self->_objectKnowledge csuVertical];
  id v12 = [(VIObjectKnowledge *)self->_objectKnowledge csuLocalizedSynonymsDictionary];
  [(VIObjectKnowledge *)self->_objectKnowledge csuLongitute];
  double v14 = v13;
  [(VIObjectKnowledge *)self->_objectKnowledge csuLatitute];
  double v16 = v15;
  LODWORD(v19) = [(VIObjectKnowledge *)self->_objectKnowledge csuVersion];
  id v17 = (void *)[v3 initWithQID:v4 idType:v5 localizedLabelDictionary:v6 confidence:v9 sensitiveLocation:v10 category:v11 vertical:v8 localizedSynonymsDictionary:v14 longitude:v16 latitude:v12 version:v19];

  return (CSUSearchableKnowledgeObject *)v17;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VIRegionOfInterestResultItem *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = v5;
    domain = self->_domain;
    double v8 = [(VIRegionOfInterestResultItem *)v6 domain];
    if (VIObjectIsEqual((unint64_t)domain, (uint64_t)v8))
    {
      thirdPartyObject = self->_thirdPartyObject;
      v10 = [(VIRegionOfInterestResultItem *)v6 thirdPartyObject];
      if (VIObjectIsEqual((unint64_t)thirdPartyObject, (uint64_t)v10))
      {
        ontologyNode = self->_ontologyNode;
        id v12 = [(VIRegionOfInterestResultItem *)v6 ontologyNode];
        if (VIObjectIsEqual((unint64_t)ontologyNode, (uint64_t)v12))
        {
          objectKnowledge = self->_objectKnowledge;
          double v14 = [(VIRegionOfInterestResultItem *)v6 objectKnowledge];
          char IsEqual = VIObjectIsEqual((unint64_t)objectKnowledge, (uint64_t)v14);
        }
        else
        {
          char IsEqual = 0;
        }
      }
      else
      {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  unint64_t v4 = [(VIThirdPartyObject *)self->_thirdPartyObject hash] ^ v3;
  unint64_t v5 = [(VIOntologyNode *)self->_ontologyNode hash];
  return v4 ^ v5 ^ [(VIObjectKnowledge *)self->_objectKnowledge hash];
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)caption
{
  return self->_caption;
}

- (VIOntologyNode)ontologyNode
{
  return self->_ontologyNode;
}

- (VIObjectKnowledge)objectKnowledge
{
  return self->_objectKnowledge;
}

- (VIThirdPartyObject)thirdPartyObject
{
  return self->_thirdPartyObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyObject, 0);
  objc_storeStrong((id *)&self->_objectKnowledge, 0);
  objc_storeStrong((id *)&self->_ontologyNode, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end