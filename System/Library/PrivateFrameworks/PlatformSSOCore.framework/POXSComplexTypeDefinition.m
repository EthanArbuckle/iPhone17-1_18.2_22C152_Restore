@interface POXSComplexTypeDefinition
+ (id)_descriptionForValue:(id)a3 prefix:(id)a4;
+ (id)descriptionForValue:(id)a3;
- (BOOL)flattenMultiValueElementWithName:(id)a3;
- (NSArray)attributes;
- (NSArray)elements;
- (NSArray)namespaces;
- (NSString)contentPropertyName;
- (POXSComplexTypeDefinition)init;
- (id)_attributeForName:(id)a3 ofAttributeWithName:(id)a4;
- (id)_attributeForName:(id)a3 ofElementWithName:(id)a4;
- (id)_attributeForName:(id)a3 ofNodeWithName:(id)a4 attributes:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)isSpecifiedKeyForAttributeName:(id)a3;
- (id)isSpecifiedKeyForElementName:(id)a3;
- (id)namespaceForAttributeName:(id)a3;
- (id)propertyForName:(id)a3;
- (unint64_t)maxCountForElementName:(id)a3;
- (unint64_t)minCountForElementName:(id)a3;
- (void)_setAttribute:(id)a3 forName:(id)a4 ofAttributeWithName:(id)a5;
- (void)_setAttribute:(id)a3 forName:(id)a4 ofElementWithName:(id)a5;
- (void)_setAttribute:(id)a3 forName:(id)a4 ofNodeWithName:(id)a5 attributes:(id)a6;
- (void)addAttributeWithName:(id)a3 type:(Class)a4;
- (void)addAttributeWithName:(id)a3 type:(Class)a4 isSpecifiedKey:(id)a5;
- (void)addAttributeWithName:(id)a3 type:(Class)a4 namespaceURI:(id)a5;
- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5;
- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 isSpecifiedKey:(id)a6;
- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 maxOccurs:(unint64_t)a6 minOccurs:(unint64_t)a7;
- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 maxOccurs:(unint64_t)a6 minOccurs:(unint64_t)a7 flattenMultiValue:(BOOL)a8;
- (void)addNamespaceWithURI:(id)a3;
- (void)addUnboundedElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5;
- (void)setContentPropertyName:(id)a3 type:(Class)a4;
- (void)setIsSpecifiedKey:(id)a3 onElementWithName:(id)a4;
- (void)setProperty:(id)a3 forName:(id)a4;
@end

@implementation POXSComplexTypeDefinition

- (POXSComplexTypeDefinition)init
{
  v16.receiver = self;
  v16.super_class = (Class)POXSComplexTypeDefinition;
  v2 = [(POXSDefinition *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    elements = v2->_elements;
    v2->_elements = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    namespaces = v2->_namespaces;
    v2->_namespaces = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    properties = v2->_properties;
    v2->_properties = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    elementAttributes = v2->_elementAttributes;
    v2->_elementAttributes = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    attributeAttributes = v2->_attributeAttributes;
    v2->_attributeAttributes = (NSMutableDictionary *)v13;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)POXSComplexTypeDefinition;
  uint64_t v5 = -[POXSDefinition copyWithZone:](&v21, sel_copyWithZone_);
  uint64_t v6 = [(NSMutableArray *)self->_attributes mutableCopyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSMutableArray *)self->_elements mutableCopyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSMutableArray *)self->_namespaces mutableCopyWithZone:a3];
  uint64_t v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSMutableDictionary *)self->_properties mutableCopyWithZone:a3];
  uint64_t v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSMutableDictionary *)self->_elementAttributes mutableCopyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  uint64_t v16 = [(NSMutableDictionary *)self->_attributeAttributes mutableCopyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_contentPropertyName copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (id)propertyForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:a3];
}

- (NSArray)attributes
{
  v2 = (void *)[(NSMutableArray *)self->_attributes copy];
  return (NSArray *)v2;
}

- (NSArray)elements
{
  v2 = (void *)[(NSMutableArray *)self->_elements copy];
  return (NSArray *)v2;
}

- (NSArray)namespaces
{
  v2 = (void *)[(NSMutableArray *)self->_namespaces copy];
  return (NSArray *)v2;
}

- (void)addAttributeWithName:(id)a3 type:(Class)a4
{
}

- (void)addAttributeWithName:(id)a3 type:(Class)a4 isSpecifiedKey:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  [(NSMutableArray *)self->_attributes addObject:v9];
  [(POXSDefinition *)self setType:a4 forName:v9];
  if (v8) {
    [(POXSComplexTypeDefinition *)self _setAttribute:v8 forName:@"isSpecifiedKey" ofAttributeWithName:v9];
  }
}

- (void)addAttributeWithName:(id)a3 type:(Class)a4 namespaceURI:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  [(NSMutableArray *)self->_attributes addObject:v9];
  [(POXSDefinition *)self setType:a4 forName:v9];
  if (v8) {
    [(POXSComplexTypeDefinition *)self _setAttribute:v8 forName:@"namespace" ofAttributeWithName:v9];
  }
}

- (id)isSpecifiedKeyForAttributeName:(id)a3
{
  return [(POXSComplexTypeDefinition *)self _attributeForName:@"isSpecifiedKey" ofAttributeWithName:a3];
}

- (id)isSpecifiedKeyForElementName:(id)a3
{
  return [(POXSComplexTypeDefinition *)self _attributeForName:@"isSpecifiedKey" ofElementWithName:a3];
}

- (id)namespaceForAttributeName:(id)a3
{
  return [(POXSComplexTypeDefinition *)self _attributeForName:@"namespace" ofAttributeWithName:a3];
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5
{
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 isSpecifiedKey:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  [(POXSComplexTypeDefinition *)self addElementWithName:v11 namespaceURI:a4 type:a5 maxOccurs:1 minOccurs:1];
  [(POXSComplexTypeDefinition *)self setIsSpecifiedKey:v10 onElementWithName:v11];
}

- (void)addUnboundedElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5
{
}

- (void)setProperty:(id)a3 forName:(id)a4
{
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 maxOccurs:(unint64_t)a6 minOccurs:(unint64_t)a7
{
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 maxOccurs:(unint64_t)a6 minOccurs:(unint64_t)a7 flattenMultiValue:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = [[POXSElement alloc] initWithElementName:v14 namespaceURI:v15 type:a5];
  [(NSMutableArray *)self->_elements addObject:v16];
  [(POXSComplexTypeDefinition *)self setProperty:v14 forName:v14];
  [(POXSDefinition *)self setType:a5 forName:v14];
  if ([(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
  {
    unint64_t v28 = a7;
    v29 = v16;
    id v30 = v15;
    BOOL v31 = v8;
    +[POXSDefinitions definitionForType:a5];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v27 = long long v35 = 0u;
    v17 = [v27 elements];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v23 = [v22 elementName];
          [(POXSComplexTypeDefinition *)self setProperty:v14 forName:v23];

          v24 = [v22 elementName];
          [(POXSDefinition *)self setType:a5 forName:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    BOOL v8 = v31;
    uint64_t v16 = v29;
    id v15 = v30;
    a7 = v28;
  }
  if (a6 != 1)
  {
    v25 = [NSNumber numberWithUnsignedInteger:a6];
    [(POXSComplexTypeDefinition *)self _setAttribute:v25 forName:@"maxCount" ofElementWithName:v14];
  }
  if (a7 != 1)
  {
    v26 = [NSNumber numberWithUnsignedInteger:a6];
    [(POXSComplexTypeDefinition *)self _setAttribute:v26 forName:@"minCount" ofElementWithName:v14];
  }
  if (v8) {
    [(POXSComplexTypeDefinition *)self _setAttribute:MEMORY[0x263EFFA88] forName:@"flattenMultiValue" ofElementWithName:v14];
  }
}

- (void)setContentPropertyName:(id)a3 type:(Class)a4
{
  uint64_t v7 = (NSString *)a3;
  if (self->_contentPropertyName != v7) {
    objc_storeStrong((id *)&self->_contentPropertyName, a3);
  }
  [(POXSDefinition *)self setType:a4 forName:v7];
}

- (void)setIsSpecifiedKey:(id)a3 onElementWithName:(id)a4
{
  if (a3) {
    [(POXSComplexTypeDefinition *)self _setAttribute:a3 forName:@"isSpecifiedKey" ofElementWithName:a4];
  }
}

- (void)addNamespaceWithURI:(id)a3
{
}

- (unint64_t)maxCountForElementName:(id)a3
{
  uint64_t v3 = [(POXSComplexTypeDefinition *)self _attributeForName:@"maxCount" ofElementWithName:a3];
  v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 1;
  }

  return v5;
}

- (unint64_t)minCountForElementName:(id)a3
{
  uint64_t v3 = [(POXSComplexTypeDefinition *)self _attributeForName:@"minCount" ofElementWithName:a3];
  v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 1;
  }

  return v5;
}

- (BOOL)flattenMultiValueElementWithName:(id)a3
{
  uint64_t v3 = [(POXSComplexTypeDefinition *)self _attributeForName:@"flattenMultiValue" ofElementWithName:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_setAttribute:(id)a3 forName:(id)a4 ofNodeWithName:(id)a5 attributes:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    [v11 setObject:v12 forKeyedSubscript:v10];
  }
  [v12 setObject:v13 forKeyedSubscript:v9];
}

- (id)_attributeForName:(id)a3 ofNodeWithName:(id)a4 attributes:(id)a5
{
  id v7 = a3;
  BOOL v8 = [a5 objectForKeyedSubscript:a4];
  id v9 = [v8 objectForKeyedSubscript:v7];

  return v9;
}

- (void)_setAttribute:(id)a3 forName:(id)a4 ofElementWithName:(id)a5
{
}

- (id)_attributeForName:(id)a3 ofElementWithName:(id)a4
{
  return [(POXSComplexTypeDefinition *)self _attributeForName:a3 ofNodeWithName:a4 attributes:self->_elementAttributes];
}

- (void)_setAttribute:(id)a3 forName:(id)a4 ofAttributeWithName:(id)a5
{
}

- (id)_attributeForName:(id)a3 ofAttributeWithName:(id)a4
{
  return [(POXSComplexTypeDefinition *)self _attributeForName:a3 ofNodeWithName:a4 attributes:self->_attributeAttributes];
}

+ (id)descriptionForValue:(id)a3
{
  return (id)[a1 _descriptionForValue:a3 prefix:&stru_2707C1488];
}

+ (id)_descriptionForValue:(id)a3 prefix:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F089D8] string];
  [v7 appendFormat:@"<%@> {\n", objc_opt_class()];
  BOOL v8 = +[POXSDefinitions definitionForType:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v45 = v8;
    id v9 = [v8 attributes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v69 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          id v15 = [v5 valueForKey:v14];
          [v7 appendFormat:@"%@    %@: %@;\n", v6, v14, v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v11);
    }

    BOOL v8 = v45;
    uint64_t v16 = [v45 elements];
    if ([v5 conformsToProtocol:&unk_2707E84D0])
    {
      int v47 = [v5 elementsNeedRedaction];
      v46 = [v5 allowedElementKeys];
    }
    else
    {
      v46 = 0;
      int v47 = 0;
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
    uint64_t v18 = &off_265463000;
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v53 = 0;
      uint64_t v20 = 0;
      uint64_t v49 = *(void *)v65;
      v57 = v7;
      v58 = v6;
      do
      {
        uint64_t v21 = 0;
        uint64_t v54 = v20;
        uint64_t v44 = v20 + v19;
        uint64_t v48 = v19;
        do
        {
          if (*(void *)v65 != v49) {
            objc_enumerationMutation(obj);
          }
          v55 = [*(id *)(*((void *)&v64 + 1) + 8 * v21) elementName];
          v56 = objc_msgSend(v5, "valueForKey:");
          if (v56)
          {
            uint64_t v51 = v21;
            v52 = [v18[164] definitionForType:objc_opt_class()];
            if (v47)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (([v46 containsObject:v55] & 1) == 0)
                {
                  [v7 appendFormat:@"%@    %@ = <>;\n", v6, v55, v43];
                  goto LABEL_42;
                }
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [v6 stringByAppendingString:@"    "];
              v23 = [a1 _descriptionForValue:v56 prefix:v22];
              [v7 appendFormat:@"%@    %@ = %@\n", v6, v55, v23];

              ++v53;
              goto LABEL_42;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v56;
              [v7 appendFormat:@"%@    %@ = [\n", v6, v55];
              long long v62 = 0u;
              long long v63 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              id v25 = v24;
              uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v72 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = 0;
                uint64_t v29 = *(void *)v61;
                while (2)
                {
                  for (uint64_t j = 0; j != v27; ++j)
                  {
                    if (*(void *)v61 != v29) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                    long long v32 = [v58 stringByAppendingString:@"        "];
                    long long v33 = [a1 _descriptionForValue:v31 prefix:v32];
                    [v57 appendFormat:@"%@        [%lu] = %@\n", v58, v28 + j, v33];

                    if (v28 + j == 4)
                    {
                      uint64_t v34 = [v25 count];
                      if (v34 != 5)
                      {
                        [v57 appendFormat:@"%@        -- %lu remaining entries in array --\n", v58, v34 - 5];
                        goto LABEL_41;
                      }
                    }
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v60 objects:v72 count:16];
                  v28 += j;
                  if (v27) {
                    continue;
                  }
                  break;
                }
              }
LABEL_41:
              long long v35 = v25;

              id v7 = v57;
              id v6 = v58;
              [v57 appendFormat:@"%@    ]\n", v58];

              BOOL v8 = v45;
              uint64_t v18 = &off_265463000;
LABEL_42:
              uint64_t v19 = v48;
              uint64_t v21 = v51;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v38 = v56;
                  v39 = [v38 calendar];
                  v40 = [v39 dateFromComponents:v38];

                  [v7 appendFormat:@"%@    %@ = %@;\n", v6, v55, v40];
                }
                else
                {
                  [v7 appendFormat:@"%@    %@ = %@;\n", v6, v55, v56];
                }
                goto LABEL_42;
              }
              uint64_t v19 = v48;
              if ([v56 integerValue]) {
                [v7 appendFormat:@"%@    %@ = %@;\n", v6, v55, v56];
              }
            }
          }
          uint64_t v36 = v54 + 1;
          if (v53 == 5)
          {
            uint64_t v37 = [obj count];
            uint64_t v36 = v54 + 1;
            if (v37 != v54 + 1)
            {
              [v7 appendFormat:@"%@    -- %lu remaining elements --\n", v6, v37 - (v54 + 1)];

              goto LABEL_54;
            }
          }
          uint64_t v54 = v36;

          ++v21;
        }
        while (v21 != v19);
        uint64_t v41 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
        uint64_t v19 = v41;
        uint64_t v20 = v44;
      }
      while (v41);
    }
LABEL_54:
  }
  [v7 appendFormat:@"%@}\n", v6];

  return v7;
}

- (NSString)contentPropertyName
{
  return self->_contentPropertyName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPropertyName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_attributeAttributes, 0);
  objc_storeStrong((id *)&self->_elementAttributes, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end