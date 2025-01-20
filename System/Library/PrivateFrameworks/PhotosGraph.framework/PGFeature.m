@interface PGFeature
+ (PGFeature)featureWithMeaningfulEvent:(id)a3;
+ (PGFeature)featureWithNode:(id)a3;
+ (PGFeature)featureWithType:(unint64_t)a3 name:(id)a4;
+ (PGFeature)featureWithType:(unint64_t)a3 node:(id)a4;
+ (id)featuresForEncodedFeatures:(id)a3;
+ (id)nameForNode:(id)a3;
+ (id)noneFeatureWithType:(unint64_t)a3;
+ (id)stringForFeatureType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoneFeature;
- (NSString)name;
- (PGFeature)initWithEncodedFeature:(id)a3;
- (id)description;
- (id)encodedFeature;
- (id)nodeInGraph:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation PGFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_typeSpecificIdentifier, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  if (self->_typeSpecificIdentifier)
  {
    v3 = @": %@ -> %@ (node)";
  }
  else if (self->_name)
  {
    v3 = @": %@ -> %@ (name)";
  }
  else
  {
    v3 = @": %@ -> %@";
  }
  v10.receiver = self;
  v10.super_class = (Class)PGFeature;
  v4 = v3;
  v5 = [(PGFeature *)&v10 description];
  v6 = +[PGFeature stringForFeatureType:self->_type];
  v7 = [(PGFeature *)self name];
  v8 = objc_msgSend(v5, "stringByAppendingFormat:", v4, v6, v7, v10.receiver, v10.super_class);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    v8 = v7;
    if (*((void *)v7 + 2) == self->_type)
    {
      if (self->_typeSpecificIdentifier && (v9 = (void *)*((void *)v7 + 1)) != 0)
      {
        char v6 = objc_msgSend(v9, "isEqual:");
      }
      else
      {
        objc_super v10 = [(PGFeature *)self name];
        v11 = [v8 name];
        char v6 = [v11 isEqualToString:v10];
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)nodeInGraph:(id)a3
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  id v6 = 0;
  switch(self->_type)
  {
    case 1uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
      }
      uint64_t v9 = objc_msgSend(v5, "yearNodeForYear:", objc_msgSend(self->_typeSpecificIdentifier, "integerValue"));
      goto LABEL_36;
    case 2uLL:
      goto LABEL_22;
    case 3uLL:
      v21 = [v4 meNode];
      v22 = [v21 localIdentifier];
      int v23 = [v22 isEqualToString:self->_typeSpecificIdentifier];

      if (v23)
      {
        id v24 = v21;
      }
      else
      {
        id v24 = [v5 personNodeForPersonLocalIdentifier:self->_typeSpecificIdentifier];
      }
      id v6 = v24;

      goto LABEL_49;
    case 4uLL:
      id typeSpecificIdentifier = self->_typeSpecificIdentifier;
      v66 = @"id";
      id v67 = typeSpecificIdentifier;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      id v6 = [v5 anyNodeForLabel:@"City" domain:200 properties:v26];

      goto LABEL_49;
    case 5uLL:
      id v27 = self->_typeSpecificIdentifier;
      v64 = @"id";
      id v65 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      id v6 = [v5 anyNodeForLabel:@"State" domain:200 properties:v28];

      goto LABEL_49;
    case 6uLL:
      id v29 = self->_typeSpecificIdentifier;
      v62 = @"name";
      id v63 = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      id v6 = [v5 anyNodeForLabel:@"Country" domain:200 properties:v30];

      goto LABEL_49;
    case 7uLL:
      objc_super v10 = +[PGGraphAddressNodeCollection addressNodeAsCollectionForUUID:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 8uLL:
    case 0x14uLL:
      id v7 = self->_typeSpecificIdentifier;
      v60 = @"name";
      id v61 = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v6 = [v5 anyNodeForLabel:@"Area" domain:201 properties:v8];

      goto LABEL_49;
    case 9uLL:
      uint64_t v9 = [v4 anyNodeForLabel:self->_typeSpecificIdentifier domain:502 properties:0];
      goto LABEL_36;
    case 0xAuLL:
      uint64_t v9 = [v4 anyNodeForLabel:self->_typeSpecificIdentifier domain:501 properties:0];
      goto LABEL_36;
    case 0xBuLL:
      objc_super v10 = +[PGGraphMomentNodeCollection momentNodeForUUID:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 0xCuLL:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PGFeature - Collection nodes are no longer supported", buf, 2u);
      }
      goto LABEL_58;
    case 0xDuLL:
      uint64_t v9 = [v4 anyNodeForLabel:self->_typeSpecificIdentifier domain:700 properties:0];
      goto LABEL_36;
    case 0xEuLL:
      id v31 = self->_typeSpecificIdentifier;
      v58 = @"name";
      id v59 = v31;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id v6 = [v5 anyNodeForLabel:@"Season" domain:400 properties:v32];

      goto LABEL_49;
    case 0xFuLL:
      id v33 = self->_typeSpecificIdentifier;
      v56 = @"name";
      id v57 = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v6 = [v5 anyNodeForLabel:@"Holiday" domain:401 properties:v34];

      goto LABEL_49;
    case 0x10uLL:
      objc_super v10 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 0x11uLL:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v10 = +[PGGraphBusinessNodeCollection businessNodeForBusinessMuid:inGraph:](PGGraphBusinessNodeCollection, "businessNodeForBusinessMuid:inGraph:", [self->_typeSpecificIdentifier unsignedIntegerValue], v5);
        uint64_t v11 = [v10 anyNode];
        goto LABEL_47;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PGFeature - legacy Business feature, ignoring", buf, 2u);
      }
      goto LABEL_58;
    case 0x12uLL:
      uint64_t v9 = [v4 sceneNodeForSceneName:self->_typeSpecificIdentifier];
      goto LABEL_36;
    case 0x13uLL:
      id v35 = self->_typeSpecificIdentifier;
      v68 = @"id";
      id v69 = v35;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      id v6 = [v5 anyNodeForLabel:@"District" domain:200 properties:v36];

      goto LABEL_49;
    case 0x15uLL:
      id v12 = self->_typeSpecificIdentifier;
      v54 = @"id";
      id v55 = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v6 = [v5 anyNodeForLabel:@"PublicEvent" domain:900 properties:v13];

      goto LABEL_49;
    case 0x17uLL:
      uint64_t v9 = [v4 meaningfulEventNodeForUUID:self->_typeSpecificIdentifier];
      goto LABEL_36;
    case 0x18uLL:
      uint64_t v9 = [v4 anyNodeForLabel:self->_typeSpecificIdentifier domain:504 properties:0];
      goto LABEL_36;
    case 0x19uLL:
      uint64_t v9 = [v4 anyNodeForLabel:self->_typeSpecificIdentifier domain:901 properties:0];
LABEL_36:
      id v6 = (id)v9;
      goto LABEL_49;
    case 0x1AuLL:
      id v14 = self->_typeSpecificIdentifier;
      v52 = @"name";
      id v53 = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      id v6 = [v5 anyNodeForLabel:@"Performer" domain:900 properties:v15];

      goto LABEL_49;
    case 0x1BuLL:
      objc_super v10 = [(PGFeature *)self name];
      v37 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:v10 inGraph:v5];
      uint64_t v38 = [v37 anyNode];
      goto LABEL_45;
    case 0x1CuLL:
      objc_super v10 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 0x1DuLL:
LABEL_19:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:
          id v19 = self->_typeSpecificIdentifier;
          v70 = @"id";
          v71[0] = v19;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
          id v6 = [v5 anyNodeForLabel:@"SocialGroup" domain:302 properties:v20];

          goto LABEL_49;
        }
      }
      uint64_t v17 = +[PGGraphCalendarUnitNode monthDayValueForMonthDayNodeCalendarUnitValue:](PGGraphCalendarUnitNode, "monthDayValueForMonthDayNodeCalendarUnitValue:", [self->_typeSpecificIdentifier integerValue]);
      objc_super v10 = +[PGGraphMonthDayNodeCollection monthDayNodesForMonth:v17 day:v18 inGraph:v5];
      uint64_t v11 = [v10 anyNode];
LABEL_47:
      id v6 = (id)v11;
      goto LABEL_48;
    case 0x1EuLL:
      *(void *)buf = 0;
      v47 = buf;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__56849;
      v50 = __Block_byref_object_dispose__56850;
      id v51 = 0;
      v16 = +[PGGraphHomeWorkNodeCollection homeNodesInGraph:v4];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __25__PGFeature_nodeInGraph___block_invoke;
      v45[3] = &unk_1E68EC8E0;
      v45[4] = self;
      v45[5] = buf;
      [v16 enumerateNodesUsingBlock:v45];

      id v6 = *((id *)v47 + 5);
      _Block_object_dispose(buf, 8);

      goto LABEL_49;
    case 0x1FuLL:
      *(void *)buf = 0;
      v47 = buf;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__56849;
      v50 = __Block_byref_object_dispose__56850;
      id v51 = 0;
      v39 = +[PGGraphHomeWorkNodeCollection workNodesInGraph:v4];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __25__PGFeature_nodeInGraph___block_invoke_2;
      v44[3] = &unk_1E68EC8E0;
      v44[4] = self;
      v44[5] = buf;
      [v39 enumerateNodesUsingBlock:v44];

      id v6 = *((id *)v47 + 5);
      _Block_object_dispose(buf, 8);

      goto LABEL_49;
    case 0x20uLL:
      objc_super v10 = +[PGGraphHighlightTypeNodeCollection typeNodesWithLabel:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 0x21uLL:
      *(void *)buf = 0;
      v47 = buf;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__56849;
      v50 = __Block_byref_object_dispose__56850;
      id v51 = 0;
      v40 = +[PGGraphNodeCollection nodesInGraph:v4];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __25__PGFeature_nodeInGraph___block_invoke_3;
      v43[3] = &unk_1E68EC908;
      v43[4] = self;
      v43[5] = buf;
      [v40 enumerateNodesUsingBlock:v43];

      id v6 = *((id *)v47 + 5);
      _Block_object_dispose(buf, 8);

      goto LABEL_49;
    case 0x22uLL:
      objc_super v10 = +[PGGraphNodeCollection nodesInGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 0x23uLL:
      objc_super v10 = +[PGGraphPetNodeCollection petNodesForLocalIdentifier:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    case 0x24uLL:
      if (self->_name)
      {
        id v41 = self->_typeSpecificIdentifier;
        objc_super v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
        v37 = +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabel:v41 personLocalIdentifiers:v10 inGraph:v5];
        uint64_t v38 = [v37 anyNode];
LABEL_45:
        id v6 = (id)v38;

LABEL_48:
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PGFeature - PersonActivityMeaning has nil personLocalIdentifier", buf, 2u);
        }
LABEL_58:
        id v6 = 0;
      }
LABEL_49:

      return v6;
    case 0x25uLL:
      objc_super v10 = +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabel:self->_typeSpecificIdentifier inGraph:v4];
      uint64_t v11 = [v10 anyNode];
      goto LABEL_47;
    default:
      goto LABEL_49;
  }
}

void __25__PGFeature_nodeInGraph___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 featureIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __25__PGFeature_nodeInGraph___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 featureIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __25__PGFeature_nodeInGraph___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 featureIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)isNoneFeature
{
  return !self->_typeSpecificIdentifier && self->_name == 0;
}

- (NSString)name
{
  v3 = self->_name;
  if (!v3)
  {
    id v4 = NSString;
    if (self->_typeSpecificIdentifier)
    {
      v3 = [NSString stringWithFormat:@"%@", self->_typeSpecificIdentifier];
    }
    else
    {
      uint64_t v5 = +[PGFeature stringForFeatureType:self->_type];
      v3 = [v4 stringWithFormat:@"No %@", v5];
    }
  }
  return v3;
}

- (id)encodedFeature
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  uint64_t v5 = [v3 dictionaryWithObject:v4 forKey:@"type"];

  id typeSpecificIdentifier = self->_typeSpecificIdentifier;
  if (typeSpecificIdentifier) {
    [v5 setObject:typeSpecificIdentifier forKeyedSubscript:@"spec"];
  }
  name = self->_name;
  if (name) {
    [v5 setObject:name forKeyedSubscript:@"name"];
  }
  return v5;
}

- (PGFeature)initWithEncodedFeature:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGFeature;
  uint64_t v5 = [(PGFeature *)&v12 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"type"];
    v5->_type = [v6 integerValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"spec"];
    id typeSpecificIdentifier = v5->_typeSpecificIdentifier;
    v5->_id typeSpecificIdentifier = (id)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v9;
  }
  return v5;
}

+ (id)featuresForEncodedFeatures:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [PGFeature alloc];
        objc_super v12 = -[PGFeature initWithEncodedFeature:](v11, "initWithEncodedFeature:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)stringForFeatureType:(unint64_t)a3
{
  if (a3 > 0x25) {
    return @"Unknown";
  }
  else {
    return off_1E68EC928[a3];
  }
}

+ (id)nameForNode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 label];
  int v5 = [v3 domain];
  if ([v4 isEqualToString:@"SocialGroup"])
  {
    id v6 = v3;
    id v7 = [v6 socialGroupNameWithServiceManager:0];
LABEL_3:
    uint64_t v8 = v7;

    goto LABEL_15;
  }
  if (v5 > 699)
  {
    if (v5 == 701)
    {
      id v9 = [v3 personLocalIdentifier];
      goto LABEL_14;
    }
    if (v5 != 700)
    {
LABEL_11:
      id v6 = [v3 name];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v6 stringValue];
      }
      else
      {
        id v7 = v6;
      }
      goto LABEL_3;
    }
LABEL_10:
    id v9 = v4;
    goto LABEL_14;
  }
  if (v5 == 502) {
    goto LABEL_10;
  }
  if (v5 != 600) {
    goto LABEL_11;
  }
  id v9 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
LABEL_14:
  uint64_t v8 = v9;
LABEL_15:

  return v8;
}

+ (id)noneFeatureWithType:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;
  return v4;
}

+ (PGFeature)featureWithType:(unint64_t)a3 name:(id)a4
{
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  *((void *)v8 + 2) = a3;
  objc_storeStrong((id *)v8 + 3, a4);
  id v9 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v7;

  return (PGFeature *)v8;
}

+ (PGFeature)featureWithMeaningfulEvent:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init((Class)a1);
  v5[2] = 23;
  uint64_t v6 = [v4 UUID];

  id v7 = (void *)v5[1];
  v5[1] = v6;

  return (PGFeature *)v5;
}

+ (PGFeature)featureWithType:(unint64_t)a3 node:(id)a4
{
  id v6 = a4;
  if (a3 == 23)
  {
    id v7 = [a1 featureWithMeaningfulEvent:v6];
  }
  else
  {
    id v8 = [a1 featureWithNode:v6];
    id v7 = v8;
    if (a3 == 20 && [v8 type] == 8) {
      v7[2] = 20;
    }
  }

  return (PGFeature *)v7;
}

+ (PGFeature)featureWithNode:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init((Class)a1);
  int v6 = [v4 domain];
  id v7 = [v4 label];
  id v8 = v7;
  if (v6 <= 401)
  {
    if (v6 <= 299)
    {
      if (v6 > 199)
      {
        switch(v6)
        {
          case 200:
            if ([v7 isEqualToString:@"Address"])
            {
              uint64_t v9 = 7;
              goto LABEL_78;
            }
            if ([v8 isEqualToString:@"District"])
            {
              uint64_t v20 = 19;
              goto LABEL_87;
            }
            if ([v8 isEqualToString:@"City"])
            {
              uint64_t v20 = 4;
              goto LABEL_87;
            }
            if ([v8 isEqualToString:@"State"])
            {
              uint64_t v20 = 5;
              goto LABEL_87;
            }
            if (![v8 isEqualToString:@"Country"]) {
              goto LABEL_61;
            }
            uint64_t v11 = 6;
            break;
          case 201:
            uint64_t v11 = 8;
            goto LABEL_39;
          case 202:
            int v14 = [v7 isEqualToString:@"Home"];
            uint64_t v15 = 30;
            if (!v14) {
              uint64_t v15 = 31;
            }
            goto LABEL_41;
          case 204:
            uint64_t v15 = 33;
LABEL_41:
            v5[2] = v15;
            id v16 = [v4 featureIdentifier];
            goto LABEL_59;
          default:
            goto LABEL_61;
        }
        goto LABEL_39;
      }
      if (v6 == 100)
      {
        uint64_t v20 = 11;
LABEL_87:
        v5[2] = v20;
        id v16 = [v4 UUID];
        goto LABEL_59;
      }
      if (v6 == 102)
      {
        if ([v7 isEqualToString:@"Highlight"]) {
          uint64_t v9 = 28;
        }
        else {
          uint64_t v9 = 16;
        }
LABEL_78:
        v5[2] = v9;
        id v16 = [v4 uuid];
        goto LABEL_59;
      }
      if (v6 != 103) {
        goto LABEL_61;
      }
      uint64_t v10 = 32;
LABEL_58:
      v5[2] = v10;
      id v16 = v7;
      goto LABEL_59;
    }
    if (v6 <= 303)
    {
      if (v6 != 300)
      {
        if (v6 != 302) {
          goto LABEL_61;
        }
        v5[2] = 2;
        objc_super v12 = NSNumber;
        uint64_t v13 = [v4 socialGroupID];
        goto LABEL_76;
      }
      uint64_t v18 = 3;
    }
    else
    {
      if (v6 != 304)
      {
        if (v6 != 400)
        {
          if (v6 != 401 || ![v7 isEqualToString:@"Holiday"]) {
            goto LABEL_61;
          }
          uint64_t v11 = 15;
          goto LABEL_39;
        }
        if ([v7 isEqualToString:@"Year"])
        {
          uint64_t v19 = 1;
LABEL_75:
          v5[2] = v19;
          objc_super v12 = NSNumber;
          uint64_t v13 = [v4 calendarUnitValue];
LABEL_76:
          id v16 = [v12 numberWithInteger:v13];
          goto LABEL_59;
        }
        if ([v8 isEqualToString:@"MonthDay"])
        {
          uint64_t v19 = 29;
          goto LABEL_75;
        }
        if ([v8 isEqualToString:@"Season"])
        {
          uint64_t v11 = 14;
          goto LABEL_39;
        }
        goto LABEL_61;
      }
      if (![v7 isEqualToString:@"Pet"]) {
        goto LABEL_61;
      }
      uint64_t v18 = 35;
    }
    v5[2] = v18;
    id v16 = [v4 localIdentifier];
    goto LABEL_59;
  }
  if (v6 <= 600)
  {
    switch(v6)
    {
      case 501:
        uint64_t v10 = 10;
        goto LABEL_58;
      case 502:
        uint64_t v10 = 9;
        goto LABEL_58;
      case 503:
        uint64_t v17 = 17;
        goto LABEL_56;
      case 504:
        uint64_t v10 = 24;
        goto LABEL_58;
      default:
        if (v6 != 402)
        {
          if (v6 != 600) {
            goto LABEL_61;
          }
          uint64_t v10 = 18;
          goto LABEL_58;
        }
        if (![v7 isEqualToString:@"OverTheYears"]) {
          goto LABEL_61;
        }
        v5[2] = 34;
        v25 = @"OverTheYears";
        v21 = (void *)v5[1];
        v5[1] = @"OverTheYears";
        break;
    }
    goto LABEL_60;
  }
  if (v6 <= 899)
  {
    switch(v6)
    {
      case 601:
        uint64_t v10 = 27;
        break;
      case 700:
        uint64_t v10 = 13;
        break;
      case 701:
        uint64_t v10 = 36;
        break;
      default:
        goto LABEL_61;
    }
    goto LABEL_58;
  }
  if (v6 != 900)
  {
    if (v6 == 901)
    {
      uint64_t v10 = 25;
    }
    else
    {
      if (v6 != 1201) {
        goto LABEL_61;
      }
      uint64_t v10 = 37;
    }
    goto LABEL_58;
  }
  if ([v7 isEqualToString:@"PublicEvent"])
  {
    uint64_t v17 = 21;
LABEL_56:
    v5[2] = v17;
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if ([v8 isEqualToString:@"Performer"])
  {
    uint64_t v11 = 26;
LABEL_39:
    v5[2] = v11;
    id v16 = [v4 name];
LABEL_59:
    v21 = (void *)v5[1];
    v5[1] = v16;
LABEL_60:
  }
LABEL_61:
  if (v5[2])
  {
    uint64_t v22 = [a1 nameForNode:v4];
    int v23 = (void *)v5[3];
    v5[3] = v22;
  }
  else
  {
    int v23 = v5;
    int v5 = 0;
  }

  return (PGFeature *)v5;
}

@end