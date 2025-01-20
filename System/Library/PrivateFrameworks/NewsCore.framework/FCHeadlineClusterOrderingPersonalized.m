@interface FCHeadlineClusterOrderingPersonalized
- (id)orderTopicsWithClusteredHeadlines:(id)a3 additionalHeadlines:(id)a4 subscribedTagIDs:(id)a5 scoresByArticleID:(id)a6 personalizer:(id)a7 tagNameProvider:(id)a8 personalizationTreatment:(id)a9 translationProvider:(id)a10;
@end

@implementation FCHeadlineClusterOrderingPersonalized

- (id)orderTopicsWithClusteredHeadlines:(id)a3 additionalHeadlines:(id)a4 subscribedTagIDs:(id)a5 scoresByArticleID:(id)a6 personalizer:(id)a7 tagNameProvider:(id)a8 personalizationTreatment:(id)a9 translationProvider:(id)a10
{
  v11 = (void *)MEMORY[0x1E4F1CAA0];
  id v12 = a7;
  v13 = [a3 allKeys];
  v14 = [v12 rankTagIDsDescending:v13];

  if (v14) {
    v15 = v14;
  }
  else {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v16 = [v11 orderedSetWithArray:v15];

  return v16;
}

@end