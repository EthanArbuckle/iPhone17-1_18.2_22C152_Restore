@interface PGGraphPersonRelationshipTagNode
+ (MARelation)personWithTag;
+ (id)filter;
+ (id)filterWithTag:(unint64_t)a3;
+ (id)labelForRelationshipTag:(unint64_t)a3;
+ (id)personWithTagWithConfidence:(double)a3;
+ (id)supportedTagsAsStrings;
+ (unint64_t)relationshipTagFromString:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSArray)localizedSynonyms;
- (NSString)label;
- (NSString)localizedName;
- (PGGraphPersonRelationshipTagNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPersonRelationshipTagNode)initWithPersonRelationshipTag:(unint64_t)a3;
- (PGGraphPersonRelationshipTagNodeCollection)collection;
- (id)_localizationKeyForRelationshipTagLabel:(id)a3;
- (unint64_t)tag;
- (unsigned)domain;
@end

@implementation PGGraphPersonRelationshipTagNode

- (void).cxx_destruct
{
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)localizedSynonyms
{
  v3 = [(PGGraphPersonRelationshipTagNode *)self label];
  v4 = [(PGGraphPersonRelationshipTagNode *)self _localizationKeyForRelationshipTagLabel:v3];

  v5 = +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:v4];

  return (NSArray *)v5;
}

- (id)_localizationKeyForRelationshipTagLabel:(id)a3
{
  uint64_t v3 = _localizationKeyForRelationshipTagLabel__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_localizationKeyForRelationshipTagLabel__onceToken, &__block_literal_global_35086);
  }
  v5 = [(id)_localizationKeyForRelationshipTagLabel__searchKeyByLabel objectForKeyedSubscript:v4];

  return v5;
}

void __76__PGGraphPersonRelationshipTagNode__localizationKeyForRelationshipTagLabel___block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Mother";
  v2[1] = @"Father";
  v3[0] = @"PGPersonMotherSearchableText";
  v3[1] = @"PGPersonFatherSearchableText";
  v2[2] = @"Parent";
  v2[3] = @"Child";
  v3[2] = @"PGPersonParentSearchableText";
  v3[3] = @"PGPersonChildSearchableText";
  v2[4] = @"Son";
  v2[5] = @"Daughter";
  v3[4] = @"PGPersonSonSearchableText";
  v3[5] = @"PGPersonDaughterSearchableText";
  v2[6] = @"Brother";
  v2[7] = @"Sister";
  v3[6] = @"PGPersonBrotherSearchableText";
  v3[7] = @"PGPersonSisterSearchableText";
  v2[8] = @"Sibling";
  v2[9] = @"Family";
  v3[8] = @"PGPersonSiblingSearchableText";
  v3[9] = @"PGPersonFamilySearchableText";
  v2[10] = @"Partner";
  v2[11] = @"Friend";
  v3[10] = @"PGPersonPartnerSearchableText";
  v3[11] = @"PGPersonFriendSearchableText";
  v2[12] = @"Coworker";
  v2[13] = @"Alumni";
  v3[12] = @"PGPersonCoworkerSearchableText";
  v3[13] = @"PGPersonAlumniSearchableText";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:14];
  v1 = (void *)_localizationKeyForRelationshipTagLabel__searchKeyByLabel;
  _localizationKeyForRelationshipTagLabel__searchKeyByLabel = v0;
}

- (NSString)localizedName
{
  uint64_t v3 = [(PGGraphPersonRelationshipTagNode *)self label];
  id v4 = [(PGGraphPersonRelationshipTagNode *)self _localizationKeyForRelationshipTagLabel:v3];

  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:v4 table:@"Localizable"];

  return (NSString *)v6;
}

- (PGGraphPersonRelationshipTagNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPersonRelationshipTagNodeCollection alloc] initWithNode:self];
  return v2;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
  id v4 = [(PGGraphPersonRelationshipTagNode *)self label];
  v5 = (void *)[v3 initWithLabel:v4 domain:305];

  return (MANodeFilter *)v5;
}

- (unsigned)domain
{
  return 305;
}

- (unint64_t)tag
{
  id v3 = objc_opt_class();
  id v4 = [(PGGraphPersonRelationshipTagNode *)self label];
  unint64_t v5 = [v3 relationshipTagFromString:v4];

  return v5;
}

- (PGGraphPersonRelationshipTagNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() relationshipTagFromString:v6];

  return [(PGGraphPersonRelationshipTagNode *)self initWithPersonRelationshipTag:v7];
}

- (PGGraphPersonRelationshipTagNode)initWithPersonRelationshipTag:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PGGraphPersonRelationshipTagNode;
  id v4 = [(PGGraphNode *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() labelForRelationshipTag:a3];
    label = v4->_label;
    v4->_label = (NSString *)v5;
  }
  return v4;
}

+ (id)personWithTagWithConfidence:(double)a3
{
  id v3 = +[PGGraphRelationshipTagEdge filterWithConfidence:a3];
  id v4 = [v3 inRelation];

  return v4;
}

+ (MARelation)personWithTag
{
  v2 = +[PGGraphRelationshipTagEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (id)filterWithTag:(unint64_t)a3
{
  id v3 = [a1 labelForRelationshipTag:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:v3 domain:305];

  return v4;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:305];
  return v2;
}

+ (id)labelForRelationshipTag:(unint64_t)a3
{
  if (a3 > 0xE) {
    return @"Mother";
  }
  else {
    return off_1E68E9498[a3];
  }
}

+ (unint64_t)relationshipTagFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Mother"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Father"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Parent"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Child"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Son"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"Daughter"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"Brother"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"Sister"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"Sibling"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"Family"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"Partner"])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"Friend"])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"Coworker"])
  {
    unint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"Alumni"])
  {
    unint64_t v4 = 14;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)supportedTagsAsStrings
{
  v6[14] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"Mother";
  v6[1] = @"Father";
  v6[2] = @"Parent";
  v6[3] = @"Child";
  v6[4] = @"Son";
  v6[5] = @"Daughter";
  v6[6] = @"Brother";
  v6[7] = @"Sister";
  v6[8] = @"Sibling";
  v6[9] = @"Family";
  v6[10] = @"Partner";
  v6[11] = @"Friend";
  v6[12] = @"Coworker";
  v6[13] = @"Alumni";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:14];
  unint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

@end