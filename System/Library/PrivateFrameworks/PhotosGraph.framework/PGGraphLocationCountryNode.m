@interface PGGraphLocationCountryNode
+ (MARelation)momentInCountry;
+ (id)addressOfCountry;
+ (id)filter;
+ (id)languageOfCountry;
- (Class)collectionClass;
- (NSString)displayName;
- (PGGraphLocationCountryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLocationCountryNodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
@end

@implementation PGGraphLocationCountryNode

- (unint64_t)featureType
{
  return 6;
}

- (NSString)displayName
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [(PGGraphNamedLocationNode *)self name];
  v5 = [v3 localizedStringForCountryCode:v4];
  v6 = v5;
  if (!v5) {
    v5 = v4;
  }
  v7 = v5;

  return v7;
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (PGGraphLocationCountryNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphLocationCountryNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"Country";
  return @"Country";
}

- (PGGraphLocationCountryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationCountryNode;
  return [(PGGraphNamedLocationNode *)&v6 initWithLabel:a3 domain:a4 properties:a5];
}

+ (id)languageOfCountry
{
  v2 = +[PGGraphLanguageEdge filter];
  v3 = [v2 outRelation];

  return v3;
}

+ (MARelation)momentInCountry
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 filter];
  v4 = [v3 relation];
  v5 = +[PGGraphLocationEdge filter];
  objc_super v6 = [v5 inRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  v8 = +[PGGraphMomentNode filter];
  v9 = [v8 relation];
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (id)addressOfCountry
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 filter];
  v4 = [v3 relation];
  v5 = +[PGGraphLocationEdge filter];
  objc_super v6 = [v5 inRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  v8 = +[PGGraphAddressNode filter];
  v9 = [v8 relation];
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v11 = [v2 chain:v10];

  return v11;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Country" domain:200];
  return v2;
}

@end