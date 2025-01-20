@interface PGGraphVisualLookupSceneNode
+ (id)filter;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isSensitive;
- (NSString)name;
- (PGGraphVisualLookupSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphVisualLookupSceneNode)initWithSceneIdentifier:(unint64_t)a3 name:(id)a4 sceneDomain:(unsigned __int8)a5 isSensitive:(BOOL)a6;
- (PGGraphVisualLookupSceneNodeCollection)collection;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)sceneIdentifier;
- (unsigned)domain;
- (unsigned)sceneDomain;
@end

@implementation PGGraphVisualLookupSceneNode

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (PGGraphVisualLookupSceneNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphVisualLookupSceneNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 602;
}

- (unsigned)sceneDomain
{
  return self->_sceneDomain;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (NSString)name
{
  return [(NSString *)self->_label lowercaseString];
}

- (id)description
{
  if (self->_isSensitive) {
    v2 = @"Sensitive";
  }
  else {
    v2 = @"NotSensitive";
  }
  return (id)[NSString stringWithFormat:@"PGGraphVisualLookupSceneNode (%@, %d, %@)", self->_label, self->_sceneDomain, v2];
}

- (id)propertyDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"sceneIdentifier";
  v3 = [NSNumber numberWithUnsignedLongLong:self->_sceneIdentifier];
  v9[0] = v3;
  v8[1] = @"isSensitive";
  v4 = [NSNumber numberWithBool:self->_isSensitive];
  v9[1] = v4;
  v8[2] = @"sceneDomain";
  v5 = [NSNumber numberWithUnsignedChar:self->_sceneDomain];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"sceneIdentifier"];
    v7 = v6;
    if (v6 && [v6 unsignedIntegerValue] != self->_sceneIdentifier) {
      goto LABEL_11;
    }

    v8 = [v5 objectForKeyedSubscript:@"isSensitive"];
    v7 = v8;
    if (v8)
    {
      if (self->_isSensitive != [v8 BOOLValue]) {
        goto LABEL_11;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"sceneDomain"];
    v7 = v9;
    if (v9 && [v9 unsignedIntegerValue] != self->_sceneDomain) {
LABEL_11:
    }
      BOOL v10 = 0;
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (PGGraphVisualLookupSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [v7 objectForKeyedSubscript:@"sceneIdentifier"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v7 objectForKeyedSubscript:@"sceneDomain"];
  unsigned __int8 v12 = [v11 unsignedIntegerValue];

  v13 = [v7 objectForKeyedSubscript:@"isSensitive"];

  uint64_t v14 = [v13 BOOLValue];
  v15 = [(PGGraphVisualLookupSceneNode *)self initWithSceneIdentifier:v10 name:v8 sceneDomain:v12 isSensitive:v14];

  return v15;
}

- (PGGraphVisualLookupSceneNode)initWithSceneIdentifier:(unint64_t)a3 name:(id)a4 sceneDomain:(unsigned __int8)a5 isSensitive:(BOOL)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphVisualLookupSceneNode;
  unsigned __int8 v12 = [(PGGraphNode *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_label, a4);
    v13->_sceneIdentifier = a3;
    v13->_sceneDomain = a5;
    v13->_isSensitive = a6;
  }

  return v13;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:602];
  return v2;
}

@end