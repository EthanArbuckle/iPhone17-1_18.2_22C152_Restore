@interface PGGraphPersonActivityMeaningNode
+ (MARelation)momentOfPersonActivity;
+ (id)filter;
+ (id)filterWithActivityLabels:(id)a3;
+ (id)filterWithPersonLocalIdentifiers:(id)a3 label:(id)a4;
+ (id)personOfPersonActivity;
- (BOOL)hasProperties:(id)a3;
- (NSString)featureIdentifier;
- (NSString)personLocalIdentifier;
- (PGGraphPersonActivityMeaningNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPersonActivityMeaningNode)initWithPersonLocalIdentifier:(id)a3 activity:(id)a4;
- (PGGraphPersonActivityMeaningNodeCollection)collection;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphPersonActivityMeaningNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

- (id)label
{
  return self->_label;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphPersonActivityMeaningNode *)self label];
  v7 = [(PGGraphPersonActivityMeaningNode *)self personLocalIdentifier];
  v8 = [v3 stringWithFormat:@"%@|%@|%@", v5, v6, v7];

  return (NSString *)v8;
}

- (unint64_t)featureType
{
  return 36;
}

- (PGGraphPersonActivityMeaningNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPersonActivityMeaningNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  personLocalIdentifier = self->_personLocalIdentifier;
  v5 = @"identifier";
  v6[0] = personLocalIdentifier;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && [v4 count]
    && ([v5 objectForKeyedSubscript:@"id"],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = [v6 stringValue];
    BOOL v9 = v8 != self->_personLocalIdentifier;

    char v10 = !v9;
  }
  else
  {
    char v10 = 1;
  }

  return v10 & 1;
}

- (unsigned)domain
{
  return 701;
}

- (PGGraphPersonActivityMeaningNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a3;
  v8 = [a5 objectForKeyedSubscript:@"identifier"];
  BOOL v9 = [(PGGraphPersonActivityMeaningNode *)self initWithPersonLocalIdentifier:v8 activity:v7];

  return v9;
}

- (PGGraphPersonActivityMeaningNode)initWithPersonLocalIdentifier:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPersonActivityMeaningNode;
  BOOL v9 = [(PGGraphNode *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

+ (id)filterWithActivityLabels:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithLabels:v4 domain:701 properties:MEMORY[0x1E4F1CC08]];

  return v6;
}

+ (id)filterWithPersonLocalIdentifiers:(id)a3 label:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F71F00];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  objc_super v12 = @"identifier";
  v13[0] = v7;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  char v10 = (void *)[v8 initWithLabel:v6 domain:701 properties:v9];
  return v10;
}

+ (id)personOfPersonActivity
{
  v2 = +[PGGraphPracticesActivityEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (MARelation)momentOfPersonActivity
{
  v2 = +[PGGraphPersonActivityMeaningEdge filter];
  v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:701];
  return v2;
}

@end