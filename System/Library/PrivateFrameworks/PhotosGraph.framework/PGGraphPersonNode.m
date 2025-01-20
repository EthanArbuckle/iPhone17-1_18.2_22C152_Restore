@interface PGGraphPersonNode
+ (MANodeFilter)filterExcludingMe;
+ (MANodeFilter)filterIncludingMe;
+ (MANodeFilter)filterNameEmpty;
+ (MANodeFilter)filterNameNotEmpty;
+ (MANodeFilter)filterShareParticipantIdentifierNotEmpty;
+ (MARelation)acquaintanceOfPerson;
+ (MARelation)anniversaryMomentOfPerson;
+ (MARelation)birthdayMomentOfPerson;
+ (MARelation)brotherOfPerson;
+ (MARelation)childOfPerson;
+ (MARelation)coworkerOfPerson;
+ (MARelation)coworkerSocialGroupOfPerson;
+ (MARelation)daughterOfPerson;
+ (MARelation)familyOfPerson;
+ (MARelation)familySocialGroupOfPerson;
+ (MARelation)fatherOfPerson;
+ (MARelation)friendOfPerson;
+ (MARelation)homeOfPerson;
+ (MARelation)homeOrWorkOfPerson;
+ (MARelation)inferredAcquaintanceOfPerson;
+ (MARelation)inferredBrotherOfPerson;
+ (MARelation)inferredChildOfPerson;
+ (MARelation)inferredCoworkerOfPerson;
+ (MARelation)inferredCoworkerSocialGroupOfPerson;
+ (MARelation)inferredDaughterOfPerson;
+ (MARelation)inferredFamilyOfPerson;
+ (MARelation)inferredFamilySocialGroupOfPerson;
+ (MARelation)inferredFatherOfPerson;
+ (MARelation)inferredFriendOfPerson;
+ (MARelation)inferredMotherOfPerson;
+ (MARelation)inferredParentOfPerson;
+ (MARelation)inferredPartnerOfPerson;
+ (MARelation)inferredSisterOfPerson;
+ (MARelation)inferredSonOfPerson;
+ (MARelation)inferredVipOfPerson;
+ (MARelation)momentAuthoredByPerson;
+ (MARelation)momentOfPerson;
+ (MARelation)momentWithPhysicallyPresentPerson;
+ (MARelation)motherOfPerson;
+ (MARelation)parentOfPerson;
+ (MARelation)partnerOfPerson;
+ (MARelation)personActivityMeaningOfPerson;
+ (MARelation)relationshipTagOfPerson;
+ (MARelation)sisterOfPerson;
+ (MARelation)socialGroupOfPerson;
+ (MARelation)sonOfPerson;
+ (MARelation)vipOfPerson;
+ (MARelation)workOfPerson;
+ (NSArray)personScoreSortDescriptors;
+ (NSArray)personSortDescriptors;
+ (double)_specialDateTimeIntervalForDate:(id)a3;
+ (id)_specialDateComponentsForDate:(id)a3;
+ (id)_specialDateForDateComponents:(id)a3;
+ (id)changedPropertyNamesForContactsChange;
+ (id)filter;
+ (id)filterForAgeCategories:(id)a3 includingMe:(BOOL)a4;
+ (id)filterForBiologicalSex:(unint64_t)a3;
+ (id)filterWithShareParticipantIdentifiers:(id)a3;
+ (id)propertiesWithAgeCategory:(unint64_t)a3;
+ (id)propertiesWithBiologicalSex:(unint64_t)a3;
+ (id)propertiesWithPerson:(id)a3;
+ (id)relationshipTagOfPersonWithConfidence:(double)a3;
+ (unint64_t)type;
+ (void)setAnniversaryDateComponents:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setBirthdayDateComponents:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setName:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)_contactSuggestionEdge:(id)a3 fitsQuery:(unint64_t)a4;
- (BOOL)_hasRelationshipLabel:(id)a3 withStatus:(unint64_t)a4;
- (BOOL)belongsToAnySocialGroup;
- (BOOL)belongsToBestSocialGroups;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isIdentifiedByProperties:(id)a3;
- (BOOL)isInferredChild;
- (BOOL)isInferredMemberOfMyFamily;
- (BOOL)isMeNode;
- (BOOL)isMemberOfMyFamily;
- (BOOL)isMyAcquaintance;
- (BOOL)isMyBrother;
- (BOOL)isMyChild;
- (BOOL)isMyCoworker;
- (BOOL)isMyDaughter;
- (BOOL)isMyFather;
- (BOOL)isMyFriend;
- (BOOL)isMyInferredAcquaintance;
- (BOOL)isMyInferredBrother;
- (BOOL)isMyInferredChild;
- (BOOL)isMyInferredCoworker;
- (BOOL)isMyInferredDaughter;
- (BOOL)isMyInferredFather;
- (BOOL)isMyInferredFriend;
- (BOOL)isMyInferredMother;
- (BOOL)isMyInferredParent;
- (BOOL)isMyInferredPartner;
- (BOOL)isMyInferredSibling;
- (BOOL)isMyInferredSister;
- (BOOL)isMyInferredSon;
- (BOOL)isMyMother;
- (BOOL)isMyParent;
- (BOOL)isMyPartner;
- (BOOL)isMySibling;
- (BOOL)isMySister;
- (BOOL)isMySon;
- (BOOL)isTaggedWithRelationship:(unint64_t)a3 withConfidence:(double)a4;
- (BOOL)isUserCreated;
- (BOOL)isVerified;
- (NSDate)anniversaryDate;
- (NSDate)birthdayDate;
- (NSDate)potentialBirthdayDate;
- (NSDateComponents)anniversaryDateComponents;
- (NSDateComponents)birthdayDateComponents;
- (NSDateComponents)potentialBirthdayDateComponents;
- (NSString)contactIdentifier;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localIdentifier;
- (NSString)name;
- (NSString)shareParticipantLocalIdentifier;
- (NSString)suggestedContactIdentifier;
- (PGGraphPersonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPersonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (PGGraphPersonNode)initWithPerson:(id)a3;
- (PGGraphPersonNodeCollection)collection;
- (double)personScore;
- (id)_contactSuggestionEdgesSortedByConfidence;
- (id)associatedNodesForRemoval;
- (id)changingPropertiesWithProperties:(id)a3;
- (id)entityFilter;
- (id)label;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)stringDescription;
- (int64_t)compareToPerson:(id)a3;
- (int64_t)memberType;
- (unint64_t)ageCategory;
- (unint64_t)featureType;
- (unint64_t)numberOfMomentNodes;
- (unint64_t)sex;
- (unsigned)domain;
- (void)enumerateBirthdayMomentNodesUsingBlock:(id)a3;
- (void)enumerateContactSuggestionsSortedByConfidenceMatchingQuery:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateHomeOrWorkAddressNodesUsingBlock:(id)a3;
- (void)enumerateHomeOrWorkNodesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
- (void)setLocalProperties:(id)a3;
@end

@implementation PGGraphPersonNode

- (BOOL)isInferredChild
{
  return [(PGGraphPersonNode *)self ageCategory] - 1 < 2;
}

- (BOOL)isVerified
{
  return 1;
}

- (NSString)suggestedContactIdentifier
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7138;
  v9 = __Block_byref_object_dispose__7139;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PGGraphPersonNode_PGPersonResult__suggestedContactIdentifier__block_invoke;
  v4[3] = &unk_1E68E57F0;
  v4[4] = &v5;
  [(PGGraphPersonNode *)self enumerateContactSuggestionsSortedByConfidenceMatchingQuery:1 usingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __63__PGGraphPersonNode_PGPersonResult__suggestedContactIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = [a2 contactIdentifier];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *a5 = 1;
}

- (int64_t)compareToPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() type];
  if (v5 == [(id)objc_opt_class() type])
  {
    id v6 = v4;
    uint64_t v7 = [(PGGraphPersonNode *)self contactIdentifier];
    uint64_t v8 = [v7 length];

    v9 = [v6 contactIdentifier];
    uint64_t v10 = [v9 length];

    if (!v8 || v10)
    {
      if (v8 || !v10) {
        int64_t v11 = (*((uint64_t (**)(uint64_t, void *, void *))PGManagerPersonNodeComparisonBlock + 2))((uint64_t)PGManagerPersonNodeComparisonBlock, self, v6);
      }
      else {
        int64_t v11 = 1;
      }
    }
    else
    {
      int64_t v11 = -1;
    }
  }
  else
  {
    int64_t v11 = -1;
  }

  return v11;
}

+ (unint64_t)type
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipantLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_anniversaryDate, 0);
  objc_storeStrong((id *)&self->_potentialBirthdayDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)shareParticipantLocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isUserCreated
{
  return self->_isUserCreated;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (unint64_t)ageCategory
{
  return self->_ageCategory;
}

- (unint64_t)sex
{
  return self->_sex;
}

- (NSDate)anniversaryDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)potentialBirthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)birthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(PGGraphPersonNode *)self localIdentifier];
  if ([v6 length]) {
    [(PGGraphPersonNode *)self localIdentifier];
  }
  else {
  uint64_t v7 = [(PGGraphPersonNode *)self contactIdentifier];
  }
  uint64_t v8 = [v3 stringWithFormat:@"%@|%@", v5, v7];

  return (NSString *)v8;
}

- (unint64_t)featureType
{
  return 3;
}

- (PGGraphPersonNodeCollection)collection
{
  id v2 = [(MANodeCollection *)[PGGraphPersonNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphPersonNode *)self collection];
  uint64_t v5 = [v4 socialGroupNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PGGraphPersonNode_associatedNodesForRemoval__block_invoke;
  v8[3] = &unk_1E68E6128;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateNodesUsingBlock:v8];

  return v6;
}

void __46__PGGraphPersonNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"BELONGSTO" domain:302] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSDateComponents)anniversaryDateComponents
{
  if (self->_anniversaryDate)
  {
    id v2 = +[PGGraphPersonNode _specialDateComponentsForDate:](PGGraphPersonNode, "_specialDateComponentsForDate:");
  }
  else
  {
    id v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (NSDateComponents)potentialBirthdayDateComponents
{
  if (self->_potentialBirthdayDate)
  {
    id v2 = +[PGGraphPersonNode _specialDateComponentsForDate:](PGGraphPersonNode, "_specialDateComponentsForDate:");
  }
  else
  {
    id v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (NSDateComponents)birthdayDateComponents
{
  if (self->_birthdayDate)
  {
    id v2 = +[PGGraphPersonNode _specialDateComponentsForDate:](PGGraphPersonNode, "_specialDateComponentsForDate:");
  }
  else
  {
    id v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (id)changingPropertiesWithProperties:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGGraphPersonNode *)self propertyDictionary];
  char v6 = [v5 isEqualToDictionary:v4];

  if (v6)
  {
    id v7 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_63;
  }
  uint64_t v8 = (void *)[v4 mutableCopy];
  id v9 = [v4 objectForKeyedSubscript:@"id"];
  if (v9)
  {
    if ([(NSString *)self->_localIdentifier length]
      && [v9 length]
      && ![(NSString *)self->_localIdentifier isEqualToString:v9])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v9;
        __int16 v45 = 2112;
        v46 = self;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Trying to merge local identifier %@ into person node %@", buf, 0x16u);
      }
      id v7 = (id)MEMORY[0x1E4F1CC08];
      goto LABEL_62;
    }
    if (-[NSString length](self->_localIdentifier, "length") || ![v9 length]) {
      [v8 removeObjectForKey:@"id"];
    }
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"cnid"];
  if (v10)
  {
    if ([(NSString *)self->_contactIdentifier length]
      && [v10 length]
      && ![(NSString *)self->_contactIdentifier isEqualToString:v10]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v10;
      __int16 v45 = 2112;
      v46 = self;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Trying to merge ContactIdentifier %@ into person node %@", buf, 0x16u);
    }
    if (-[NSString length](self->_contactIdentifier, "length") || ![v10 length]) {
      [v8 removeObjectForKey:@"cnid"];
    }
  }
  int64_t v11 = [v4 objectForKeyedSubscript:@"shareparticipant"];
  v12 = v11;
  if (v11)
  {
    if ([v11 length]
      && [(NSString *)self->_shareParticipantLocalIdentifier length]
      && ![(NSString *)self->_shareParticipantLocalIdentifier isEqualToString:v12]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      shareParticipantLocalIdentifier = self->_shareParticipantLocalIdentifier;
      *(_DWORD *)buf = 138412802;
      v44 = v12;
      __int16 v45 = 2112;
      v46 = self;
      __int16 v47 = 2112;
      v48 = shareParticipantLocalIdentifier;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Trying to merge ShareParticipantIdentifier %@ into person node %@ with share participant identifier %@", buf, 0x20u);
    }
    if (-[NSString length](self->_shareParticipantLocalIdentifier, "length") || ![v12 length]) {
      [v8 removeObjectForKey:@"shareparticipant"];
    }
  }
  v41 = v12;
  v40 = [v4 objectForKeyedSubscript:@"name"];
  unint64_t v13 = [v40 length];
  if (v13 <= [(NSString *)self->_name length]) {
    [v8 removeObjectForKey:@"name"];
  }
  v14 = [v4 objectForKeyedSubscript:@"sex"];
  uint64_t v15 = [v14 unsignedIntegerValue];

  if (self->_sex || !v15) {
    [v8 removeObjectForKey:@"sex"];
  }
  v16 = [v4 objectForKeyedSubscript:@"agecategory"];
  uint64_t v17 = [v16 unsignedIntegerValue];

  if (self->_ageCategory || !v17) {
    [v8 removeObjectForKey:@"agecategory"];
  }
  if (self->_isFavorite
    || ([v4 objectForKeyedSubscript:@"fav"],
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 BOOLValue],
        v18,
        (v19 & 1) == 0))
  {
    [v8 removeObjectForKey:@"fav"];
  }
  if (self->_isUserCreated
    || ([v4 objectForKeyedSubscript:@"usercreated"],
        v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [v20 BOOLValue],
        v20,
        (v21 & 1) == 0))
  {
    [v8 removeObjectForKey:@"usercreated"];
  }
  v22 = [v4 objectForKeyedSubscript:@"bday"];
  v23 = v22;
  v42 = v10;
  if (v22)
  {
    v24 = (void *)MEMORY[0x1E4F1C9C8];
    [v22 doubleValue];
    v25 = objc_msgSend(v24, "dateWithTimeIntervalSince1970:");
    birthdayDate = self->_birthdayDate;
    if (birthdayDate && v25 && [(NSDate *)birthdayDate isEqualToDate:v25])
    {
      v27 = v9;
      [v8 removeObjectForKey:@"bday"];
    }
    else
    {
      v27 = v9;
    }
  }
  else
  {
    v27 = v9;
    v25 = 0;
  }
  v28 = [v4 objectForKeyedSubscript:@"pbday"];
  v29 = v28;
  if (v28)
  {
    v30 = (void *)MEMORY[0x1E4F1C9C8];
    [v28 doubleValue];
    v31 = objc_msgSend(v30, "dateWithTimeIntervalSince1970:");
    potentialBirthdayDate = self->_potentialBirthdayDate;
    if (potentialBirthdayDate && v31 && [(NSDate *)potentialBirthdayDate isEqualToDate:v31]) {
      [v8 removeObjectForKey:@"pbday"];
    }
  }
  else
  {
    v31 = 0;
  }
  v33 = [v4 objectForKeyedSubscript:@"anniv"];
  v34 = v33;
  if (v33)
  {
    v35 = (void *)MEMORY[0x1E4F1C9C8];
    [v33 doubleValue];
    v36 = objc_msgSend(v35, "dateWithTimeIntervalSince1970:");
    anniversaryDate = self->_anniversaryDate;
    if (anniversaryDate && v36 && [(NSDate *)anniversaryDate isEqualToDate:v36]) {
      [v8 removeObjectForKey:@"anniv"];
    }
  }
  else
  {
    v36 = 0;
  }
  id v7 = v8;

  id v9 = v27;
LABEL_62:

LABEL_63:
  return v7;
}

- (BOOL)isIdentifiedByProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"id"];
  if ([v5 length] && -[NSString length](self->_localIdentifier, "length"))
  {
    char v6 = [v5 isEqualToString:self->_localIdentifier];
  }
  else
  {
    id v7 = [v4 objectForKeyedSubscript:@"cnid"];
    if ([v7 length] && -[NSString length](self->_contactIdentifier, "length")) {
      char v6 = [v7 isEqualToString:self->_contactIdentifier];
    }
    else {
      char v6 = 0;
    }
  }
  return v6;
}

- (id)stringDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGGraphPersonNode *)self name];
  if (![(__CFString *)v3 length])
  {
    uint64_t v5 = [(PGGraphPersonNode *)self localIdentifier];

    if (![(__CFString *)v5 length])
    {
      uint64_t v6 = [(PGGraphPersonNode *)self contactIdentifier];

      uint64_t v5 = (__CFString *)v6;
    }
    if ([(__CFString *)v5 length])
    {
      if ((unint64_t)[(__CFString *)v5 length] < 9)
      {
        id v3 = v5;
      }
      else
      {
        id v3 = [(__CFString *)v5 substringToIndex:8];
      }
    }
    else
    {

      id v7 = +[PGLogging sharedLogging];
      uint64_t v8 = [v7 loggingConnection];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        uint64_t v10 = self;
        _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "No identifiers for personNode %@", (uint8_t *)&v9, 0xCu);
      }

      id v3 = @"unknown";
    }
  }
  return v3;
}

- (id)_contactSuggestionEdgesSortedByConfidence
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PGGraphPersonNode__contactSuggestionEdgesSortedByConfidence__block_invoke;
  v9[3] = &unk_1E68E6100;
  id v10 = v3;
  id v4 = v3;
  [(MANode *)self enumerateEdgesWithLabel:@"PEOPLE_CONTACT_SUGGESTION" domain:303 usingBlock:v9];
  uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v11[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  return v7;
}

uint64_t __62__PGGraphPersonNode__contactSuggestionEdgesSortedByConfidence__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)_contactSuggestionEdge:(id)a3 fitsQuery:(unint64_t)a4
{
  unsigned int v4 = a4;
  [a3 confidence];
  if ((v4 & 1) != 0 && v5 == 1.0 || (v4 & 2) != 0 && (v5 > 0.0 ? (BOOL v6 = v5 < 1.0) : (BOOL v6 = 0), v6)) {
    LOBYTE(v7) = 1;
  }
  else {
    return (v5 == 0.0) & (v4 >> 2);
  }
  return v7;
}

- (void)enumerateContactSuggestionsSortedByConfidenceMatchingQuery:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(PGGraphPersonNode *)self _contactSuggestionEdgesSortedByConfidence];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PGGraphPersonNode_enumerateContactSuggestionsSortedByConfidenceMatchingQuery_usingBlock___block_invoke;
  v9[3] = &unk_1E68E60D8;
  id v10 = v6;
  unint64_t v11 = a3;
  void v9[4] = self;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __91__PGGraphPersonNode_enumerateContactSuggestionsSortedByConfidenceMatchingQuery_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_contactSuggestionEdge:fitsQuery:"))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v9 targetNode];
    (*(void (**)(uint64_t, void *, id, uint64_t, uint64_t))(v7 + 16))(v7, v8, v9, a3, a4);
  }
}

- (BOOL)isTaggedWithRelationship:(unint64_t)a3 withConfidence:(double)a4
{
  double v5 = +[PGGraphPersonNode relationshipTagOfPersonWithConfidence:](PGGraphPersonNode, "relationshipTagOfPersonWithConfidence:", a3, a4);
  id v6 = [(PGGraphPersonNode *)self collection];
  uint64_t v7 = +[MANodeCollection nodesRelatedToNodes:v6 withRelation:v5];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (BOOL)isMyInferredAcquaintance
{
  if ([(PGGraphPersonNode *)self isInferredMemberOfMyFamily]
    || [(PGGraphPersonNode *)self isMyInferredPartner]
    || [(PGGraphPersonNode *)self isMyInferredChild]
    || [(PGGraphPersonNode *)self isMyInferredCoworker])
  {
    return 0;
  }
  else
  {
    return ![(PGGraphPersonNode *)self isMyInferredFriend];
  }
}

- (BOOL)isMyInferredFriend
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"FRIEND" withStatus:1];
}

- (BOOL)isMyInferredCoworker
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"COWORKER" withStatus:1];
}

- (BOOL)isMyInferredSibling
{
  if ([(PGGraphPersonNode *)self isMyInferredSister]) {
    return 1;
  }
  return [(PGGraphPersonNode *)self isMyInferredBrother];
}

- (BOOL)isMyInferredDaughter
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"DAUGHTER" withStatus:1];
}

- (BOOL)isMyInferredSon
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"SON" withStatus:1];
}

- (BOOL)isMyInferredBrother
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"BROTHER" withStatus:1];
}

- (BOOL)isMyInferredSister
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"SISTER" withStatus:1];
}

- (BOOL)isMyInferredFather
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"FATHER" withStatus:1];
}

- (BOOL)isMyInferredMother
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"MOTHER" withStatus:1];
}

- (BOOL)isMyInferredParent
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"PARENT" withStatus:1];
}

- (BOOL)isMyInferredChild
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"CHILD" withStatus:1];
}

- (BOOL)isMyInferredPartner
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"PARTNER" withStatus:1];
}

- (BOOL)isInferredMemberOfMyFamily
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"FAMILY" withStatus:1];
}

- (BOOL)isMyAcquaintance
{
  if ([(PGGraphPersonNode *)self isMemberOfMyFamily]
    || [(PGGraphPersonNode *)self isMyPartner]
    || [(PGGraphPersonNode *)self isMyChild]
    || [(PGGraphPersonNode *)self isMyCoworker])
  {
    return 0;
  }
  else
  {
    return ![(PGGraphPersonNode *)self isMyFriend];
  }
}

- (BOOL)isMyFriend
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"FRIEND" withStatus:0];
}

- (BOOL)isMyCoworker
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"COWORKER" withStatus:0];
}

- (BOOL)isMySibling
{
  if ([(PGGraphPersonNode *)self isMySister]) {
    return 1;
  }
  return [(PGGraphPersonNode *)self isMyBrother];
}

- (BOOL)isMyBrother
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"BROTHER" withStatus:0];
}

- (BOOL)isMySister
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"SISTER" withStatus:0];
}

- (BOOL)isMyFather
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"FATHER" withStatus:0];
}

- (BOOL)isMyMother
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"MOTHER" withStatus:0];
}

- (BOOL)isMyParent
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"PARENT" withStatus:0];
}

- (BOOL)isMyDaughter
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"DAUGHTER" withStatus:0];
}

- (BOOL)isMySon
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"SON" withStatus:0];
}

- (BOOL)isMyChild
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"CHILD" withStatus:0];
}

- (BOOL)isMyPartner
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"PARTNER" withStatus:0];
}

- (BOOL)isMemberOfMyFamily
{
  return [(PGGraphPersonNode *)self _hasRelationshipLabel:@"FAMILY" withStatus:0];
}

- (BOOL)_hasRelationshipLabel:(id)a3 withStatus:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MANode *)self edgesForLabel:a3 domain:300];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "status", (void)v12) == a4)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)enumerateBirthdayMomentNodesUsingBlock:(id)a3
{
}

- (void)enumerateHomeOrWorkNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphPersonNode_enumerateHomeOrWorkNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E6088;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = v9;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"IS_OWNED_BY" domain:202 usingBlock:v6];

  _Block_object_dispose(v9, 8);
}

uint64_t __56__PGGraphPersonNode_enumerateHomeOrWorkNodesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)enumerateHomeOrWorkAddressNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E6088;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = v9;
  [(PGGraphPersonNode *)self enumerateHomeOrWorkNodesUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E60B0;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = a3;
  id v7 = v5;
  [v7 enumerateNeighborNodesThroughEdgesWithLabel:@"IS_HOME_WORK" domain:202 usingBlock:v8];
}

uint64_t __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a3 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
  return result;
}

- (void)enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E6088;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = v9;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"IS_OWNED_BY" domain:202 usingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E6060;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = a3;
  id v7 = v5;
  [v7 enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"IS_HOME_WORK" domain:202 usingBlock:v8];
}

uint64_t __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
  return result;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
}

- (unint64_t)numberOfMomentNodes
{
  return [(MANode *)self countOfEdgesWithLabel:@"PRESENT" domain:300];
}

- (BOOL)belongsToBestSocialGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(MANode *)self hasEdgeWithLabel:@"BELONGSTO" domain:302]) {
    return 0;
  }
  id v3 = [(MANode *)self graph];
  id v4 = [v3 bestSocialGroupNodes];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[MANode hasEdgeTowardNode:](self, "hasEdgeTowardNode:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)belongsToAnySocialGroup
{
  return [(MANode *)self hasEdgeWithLabel:@"BELONGSTO" domain:302];
}

- (double)personScore
{
  id v3 = [(PGGraphPersonNode *)self name];
  uint64_t v4 = [v3 length];

  unsigned int v5 = [(PGGraphPersonNode *)self belongsToAnySocialGroup];
  double v6 = (double)[(PGGraphPersonNode *)self isFavorite];
  unsigned int v7 = [(PGGraphPersonNode *)self isUserCreated];
  double v8 = 0.0;
  if (v4) {
    double v8 = 1.0;
  }
  return (v6 + (double)v7 + v8 + (double)v5) * 0.25;
}

- (BOOL)isMeNode
{
  id v2 = [(PGGraphPersonNode *)self label];
  char v3 = [v2 isEqualToString:@"Me"];

  return v3;
}

- (unsigned)domain
{
  return 300;
}

- (id)label
{
  id v2 = @"People";
  return @"People";
}

- (NSString)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphPersonNode;
  uint64_t v4 = [(PGGraphOptimizedNode *)&v11 description];
  name = self->_name;
  if ([(NSString *)name length]) {
    double v6 = @", ";
  }
  else {
    double v6 = &stru_1F283BC78;
  }
  localIdentifier = self->_localIdentifier;
  if ([(NSString *)self->_contactIdentifier length]) {
    double v8 = @", ";
  }
  else {
    double v8 = &stru_1F283BC78;
  }
  id v9 = [v3 stringWithFormat:@"%@ (%@%@%@%@%@)", v4, name, v6, localIdentifier, v8, self->_contactIdentifier];

  return (NSString *)v9;
}

- (id)propertyForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    uint64_t v5 = 40;
LABEL_7:
    id v6 = *(id *)((char *)&self->super.super.super.super.isa + v5);
LABEL_8:
    unsigned int v7 = v6;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"id"])
  {
    uint64_t v5 = 48;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"cnid"])
  {
    uint64_t v5 = 56;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"sex"])
  {
    id v9 = NSNumber;
    uint64_t v10 = 88;
LABEL_16:
    id v6 = [v9 numberWithUnsignedInteger:*(Class *)((char *)&self->super.super.super.super.isa + v10)];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"agecategory"])
  {
    id v9 = NSNumber;
    uint64_t v10 = 96;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"fav"])
  {
    objc_super v11 = NSNumber;
    uint64_t v12 = 32;
LABEL_21:
    id v6 = [v11 numberWithBool:*((unsigned __int8 *)&self->super.super.super.super.isa + v12)];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"usercreated"])
  {
    objc_super v11 = NSNumber;
    uint64_t v12 = 33;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"shareparticipant"])
  {
    uint64_t v5 = 104;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"bday"])
  {
    long long v13 = NSNumber;
    uint64_t v14 = 64;
LABEL_30:
    [*(id *)((char *)&self->super.super.super.super.isa + v14) timeIntervalSince1970];
    objc_msgSend(v13, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"pbday"])
  {
    long long v13 = NSNumber;
    uint64_t v14 = 72;
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"anniv"])
  {
    long long v13 = NSNumber;
    uint64_t v14 = 80;
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    long long v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    int v17 = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on %@.", (uint8_t *)&v17, 0x16u);
  }
  unsigned int v7 = 0;
LABEL_9:

  return v7;
}

- (id)propertyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_localIdentifier forKeyedSubscript:@"id"];
  [v3 setObject:self->_contactIdentifier forKeyedSubscript:@"cnid"];
  id v4 = [NSNumber numberWithBool:self->_isFavorite];
  [v3 setObject:v4 forKeyedSubscript:@"fav"];

  uint64_t v5 = [NSNumber numberWithBool:self->_isUserCreated];
  [v3 setObject:v5 forKeyedSubscript:@"usercreated"];

  [v3 setObject:self->_shareParticipantLocalIdentifier forKeyedSubscript:@"shareparticipant"];
  if (self->_sex)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v6 forKeyedSubscript:@"sex"];
  }
  if (self->_ageCategory)
  {
    unsigned int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v7 forKeyedSubscript:@"agecategory"];
  }
  birthdayDate = self->_birthdayDate;
  if (birthdayDate)
  {
    id v9 = NSNumber;
    [(NSDate *)birthdayDate timeIntervalSince1970];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"bday"];
  }
  potentialBirthdayDate = self->_potentialBirthdayDate;
  if (potentialBirthdayDate)
  {
    uint64_t v12 = NSNumber;
    [(NSDate *)potentialBirthdayDate timeIntervalSince1970];
    long long v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"pbday"];
  }
  anniversaryDate = self->_anniversaryDate;
  if (anniversaryDate)
  {
    long long v15 = NSNumber;
    [(NSDate *)anniversaryDate timeIntervalSince1970];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    [v3 setObject:v16 forKeyedSubscript:@"anniv"];
  }
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 objectForKeyedSubscript:@"name"];
    unsigned int v7 = v6;
    if (v6 && ![v6 isEqual:self->_name]) {
      goto LABEL_25;
    }

    double v8 = [v5 objectForKeyedSubscript:@"id"];
    unsigned int v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_localIdentifier]) {
        goto LABEL_25;
      }
    }

    id v9 = [v5 objectForKeyedSubscript:@"cnid"];
    unsigned int v7 = v9;
    if (v9)
    {
      if (![v9 isEqual:self->_contactIdentifier]) {
        goto LABEL_25;
      }
    }

    uint64_t v10 = [v5 objectForKeyedSubscript:@"sex"];
    unsigned int v7 = v10;
    if (v10)
    {
      if ([v10 unsignedIntegerValue] != self->_sex) {
        goto LABEL_25;
      }
    }

    objc_super v11 = [v5 objectForKeyedSubscript:@"agecategory"];
    unsigned int v7 = v11;
    if (v11)
    {
      if ([v11 unsignedIntegerValue] != self->_ageCategory) {
        goto LABEL_25;
      }
    }

    uint64_t v12 = [v5 objectForKeyedSubscript:@"fav"];
    unsigned int v7 = v12;
    if (v12)
    {
      if (self->_isFavorite != [v12 BOOLValue]) {
        goto LABEL_25;
      }
    }

    long long v13 = [v5 objectForKeyedSubscript:@"usercreated"];
    unsigned int v7 = v13;
    if (v13)
    {
      if (self->_isUserCreated != [v13 BOOLValue]) {
        goto LABEL_25;
      }
    }

    uint64_t v14 = [v5 objectForKeyedSubscript:@"shareparticipant"];
    unsigned int v7 = v14;
    if (v14)
    {
      if (![v14 isEqual:self->_shareParticipantLocalIdentifier]) {
        goto LABEL_25;
      }
    }

    long long v15 = [v5 objectForKeyedSubscript:@"bday"];
    unsigned int v7 = v15;
    if (v15)
    {
      [v15 doubleValue];
      double v17 = v16;
      [(NSDate *)self->_birthdayDate timeIntervalSince1970];
      if (v17 != v18) {
        goto LABEL_25;
      }
    }

    __int16 v19 = [v5 objectForKeyedSubscript:@"pbday"];
    unsigned int v7 = v19;
    if (v19)
    {
      [v19 doubleValue];
      double v21 = v20;
      [(NSDate *)self->_potentialBirthdayDate timeIntervalSince1970];
      if (v21 != v22) {
        goto LABEL_25;
      }
    }

    v23 = [v5 objectForKeyedSubscript:@"anniv"];
    unsigned int v7 = v23;
    if (!v23
      || ([v23 doubleValue],
          double v25 = v24,
          [(NSDate *)self->_anniversaryDate timeIntervalSince1970],
          v25 == v26))
    {
      BOOL v27 = 1;
    }
    else
    {
LABEL_25:
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (void)setLocalProperties:(id)a3
{
  id v28 = a3;
  id v4 = [v28 objectForKeyedSubscript:@"name"];
  name = self->_name;
  self->_name = v4;

  id v6 = [v28 objectForKeyedSubscript:@"id"];
  localIdentifier = self->_localIdentifier;
  self->_localIdentifier = v6;

  double v8 = [v28 objectForKeyedSubscript:@"cnid"];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v8;

  uint64_t v10 = [v28 objectForKeyedSubscript:@"sex"];
  self->_sex = [v10 unsignedIntegerValue];

  objc_super v11 = [v28 objectForKeyedSubscript:@"agecategory"];
  self->_ageCategory = [v11 unsignedIntegerValue];

  uint64_t v12 = [v28 objectForKeyedSubscript:@"fav"];
  self->_isFavorite = [v12 BOOLValue];

  long long v13 = [v28 objectForKeyedSubscript:@"usercreated"];
  self->_isUserCreated = [v13 BOOLValue];

  uint64_t v14 = [v28 objectForKeyedSubscript:@"shareparticipant"];
  shareParticipantLocalIdentifier = self->_shareParticipantLocalIdentifier;
  self->_shareParticipantLocalIdentifier = v14;

  double v16 = [v28 objectForKeyedSubscript:@"bday"];
  double v17 = v16;
  if (v16)
  {
    double v18 = (void *)MEMORY[0x1E4F1C9C8];
    [v16 doubleValue];
    __int16 v19 = objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    __int16 v19 = 0;
  }
  objc_storeStrong((id *)&self->_birthdayDate, v19);
  if (v17) {

  }
  double v20 = [v28 objectForKeyedSubscript:@"pbday"];
  double v21 = v20;
  if (v20)
  {
    double v22 = (void *)MEMORY[0x1E4F1C9C8];
    [v20 doubleValue];
    v23 = objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v23 = 0;
  }
  objc_storeStrong((id *)&self->_potentialBirthdayDate, v23);
  if (v21) {

  }
  double v24 = [v28 objectForKeyedSubscript:@"anniv"];
  double v25 = v24;
  if (v24)
  {
    double v26 = (void *)MEMORY[0x1E4F1C9C8];
    [v24 doubleValue];
    BOOL v27 = objc_msgSend(v26, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    BOOL v27 = 0;
  }
  objc_storeStrong((id *)&self->_anniversaryDate, v27);
  if (v25) {
}
  }

- (id)entityFilter
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_localIdentifier length])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
    id v4 = [(PGGraphPersonNode *)self label];
    localIdentifier = self->_localIdentifier;
    __int16 v19 = @"id";
    v20[0] = localIdentifier;
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    unsigned int v7 = (NSString **)v20;
    double v8 = &v19;
  }
  else
  {
    NSUInteger v9 = [(NSString *)self->_contactIdentifier length];
    id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
    id v4 = [(PGGraphPersonNode *)self label];
    if (v9)
    {
      contactIdentifier = self->_contactIdentifier;
      double v17 = @"cnid";
      double v18 = contactIdentifier;
      id v6 = (void *)MEMORY[0x1E4F1C9E8];
      unsigned int v7 = &v18;
      double v8 = &v17;
    }
    else
    {
      name = self->_name;
      long long v15 = @"name";
      double v16 = name;
      id v6 = (void *)MEMORY[0x1E4F1C9E8];
      unsigned int v7 = &v16;
      double v8 = &v15;
    }
  }
  uint64_t v12 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:1];
  long long v13 = (void *)[v3 initWithLabel:v4 domain:300 properties:v12];

  return v13;
}

- (int64_t)memberType
{
  return 0;
}

- (PGGraphPersonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a3;
  id v10 = a6;
  objc_super v11 = [v10 objectForKeyedSubscript:@"gender"];

  if (v11)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
    long long v13 = [v10 objectForKeyedSubscript:@"gender"];
    [v12 setObject:v13 forKeyedSubscript:@"sex"];

    [v12 setObject:0 forKeyedSubscript:@"gender"];
    id v10 = v12;
  }
  uint64_t v14 = [(PGGraphPersonNode *)self initWithLabel:v9 domain:v7 properties:v10];

  return v14;
}

- (PGGraphPersonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(PGGraphNode *)self init];
  double v8 = v7;
  if (v7) {
    [(PGGraphPersonNode *)v7 setLocalProperties:v6];
  }

  return v8;
}

- (PGGraphPersonNode)initWithPerson:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphPersonNode;
  uint64_t v5 = [(PGGraphNode *)&v8 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() propertiesWithPerson:v4];
    [(PGGraphPersonNode *)v5 setLocalProperties:v6];
  }
  return v5;
}

+ (id)filterForBiologicalSex:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  id v9 = @"sex";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterForAgeCategories:(id)a3 includingMe:(BOOL)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4) {
    +[PGGraphPersonNode filterIncludingMe];
  }
  else {
  id v6 = +[PGGraphPersonNode filterExcludingMe];
  }
  id v10 = @"agecategory";
  v11[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  objc_super v8 = [v6 filterBySettingProperties:v7];

  return v8;
}

+ (id)relationshipTagOfPersonWithConfidence:(double)a3
{
  id v3 = +[PGGraphRelationshipTagEdge filterWithConfidence:a3];
  id v4 = [v3 outRelation];

  return v4;
}

+ (MARelation)relationshipTagOfPerson
{
  id v2 = +[PGGraphRelationshipTagEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)personActivityMeaningOfPerson
{
  id v2 = +[PGGraphPracticesActivityEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)workOfPerson
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 homeOrWorkOfPerson];
  v9[0] = v3;
  id v4 = +[PGGraphHomeWorkNode workFilter];
  id v5 = [v4 relation];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v2 chain:v6];

  return (MARelation *)v7;
}

+ (MARelation)homeOfPerson
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 homeOrWorkOfPerson];
  v9[0] = v3;
  id v4 = +[PGGraphHomeWorkNode homeFilter];
  id v5 = [v4 relation];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v2 chain:v6];

  return (MARelation *)v7;
}

+ (MARelation)homeOrWorkOfPerson
{
  id v2 = +[PGGraphIsOwnedByEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)socialGroupOfPerson
{
  id v2 = +[PGGraphBelongsToEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)anniversaryMomentOfPerson
{
  id v2 = +[PGGraphAnniversaryEventEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)birthdayMomentOfPerson
{
  id v2 = +[PGGraphBirthdayEventEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)momentWithPhysicallyPresentPerson
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphPersonProximityEdge filter];
  id v4 = [v3 outRelation];
  v14[0] = v4;
  id v5 = +[PGGraphPeoplePersonIsAroundEdge filter];
  id v6 = [v5 outRelation];
  v14[1] = v6;
  uint64_t v7 = +[PGGraphPersonPresentEdge filter];
  objc_super v8 = [v7 outRelation];
  v14[2] = v8;
  id v9 = +[PGGraphAuthorEdge filter];
  id v10 = [v9 outRelation];
  v14[3] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  uint64_t v12 = [v2 union:v11];

  return (MARelation *)v12;
}

+ (MARelation)momentAuthoredByPerson
{
  id v2 = +[PGGraphAuthorEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)momentOfPerson
{
  id v2 = +[PGGraphPersonPresentEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredVipOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredVipFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)vipOfPerson
{
  id v2 = +[PGGraphRelationshipEdge vipFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredAcquaintanceOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredAcquaintanceFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)acquaintanceOfPerson
{
  id v2 = +[PGGraphRelationshipEdge acquaintanceFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredCoworkerSocialGroupOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredCoworkerSocialGroupFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)coworkerSocialGroupOfPerson
{
  id v2 = +[PGGraphRelationshipEdge coworkerSocialGroupFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredCoworkerOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredCoworkerFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)coworkerOfPerson
{
  id v2 = +[PGGraphRelationshipEdge coworkerFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredFriendOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredFriendFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)friendOfPerson
{
  id v2 = +[PGGraphRelationshipEdge friendFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredChildOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredChildFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)childOfPerson
{
  id v2 = +[PGGraphRelationshipEdge childFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredFamilySocialGroupOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredFamilySocialGroupFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)familySocialGroupOfPerson
{
  id v2 = +[PGGraphRelationshipEdge familySocialGroupFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredFamilyOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredFamilyFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)familyOfPerson
{
  id v2 = +[PGGraphRelationshipEdge familyFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredParentOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredParentFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)parentOfPerson
{
  id v2 = +[PGGraphRelationshipEdge parentFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredSonOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredSonFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)sonOfPerson
{
  id v2 = +[PGGraphRelationshipEdge sonFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredDaughterOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredDaughterFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)daughterOfPerson
{
  id v2 = +[PGGraphRelationshipEdge daughterFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredSisterOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredSisterFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)sisterOfPerson
{
  id v2 = +[PGGraphRelationshipEdge sisterFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredBrotherOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredBrotherFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)brotherOfPerson
{
  id v2 = +[PGGraphRelationshipEdge brotherFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredMotherOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredMotherFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)motherOfPerson
{
  id v2 = +[PGGraphRelationshipEdge motherFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredFatherOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredFatherFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)fatherOfPerson
{
  id v2 = +[PGGraphRelationshipEdge fatherFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)inferredPartnerOfPerson
{
  id v2 = +[PGGraphRelationshipEdge inferredPartnerFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (MARelation)partnerOfPerson
{
  id v2 = +[PGGraphRelationshipEdge partnerFilter];
  id v3 = [v2 anyDirectionRelation];

  return (MARelation *)v3;
}

+ (id)_specialDateComponentsForDate:(id)a3
{
  if (a3)
  {
    id v3 = [MEMORY[0x1E4F76C68] components:28 fromDate:a3];
    if ([v3 year] == 1) {
      [v3 setYear:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (id)_specialDateForDateComponents:(id)a3
{
  return (id)[MEMORY[0x1E4F76C68] dateFromComponents:a3 inTimeZone:0];
}

+ (double)_specialDateTimeIntervalForDate:(id)a3
{
  id v3 = [a1 _specialDateComponentsForDate:a3];
  id v4 = +[PGGraphPersonNode _specialDateForDateComponents:v3];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  return v6;
}

+ (void)setAnniversaryDateComponents:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  id v9 = +[PGGraphPersonNode _specialDateForDateComponents:a3];
  +[PGGraphPersonNode _specialDateTimeIntervalForDate:v9];
  objc_super v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v7 persistModelProperty:v8 forKey:@"anniv" forNodeWithIdentifier:a4];
}

+ (void)setBirthdayDateComponents:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  id v9 = +[PGGraphPersonNode _specialDateForDateComponents:a3];
  +[PGGraphPersonNode _specialDateTimeIntervalForDate:v9];
  objc_super v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v7 persistModelProperty:v8 forKey:@"bday" forNodeWithIdentifier:a4];
}

+ (void)setName:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  if (a3) {
    [a5 persistModelProperty:a3 forKey:@"name" forNodeWithIdentifier:a4];
  }
  else {
    [a5 removeModelPropertyForKey:@"name" forNodeWithIdentifier:a4];
  }
}

+ (id)propertiesWithAgeCategory:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v6 = @"agecategory";
  id v3 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)propertiesWithBiologicalSex:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v6 = @"sex";
  id v3 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)propertiesWithPerson:(id)a3
{
  v43[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 fullName];
  double v5 = (void *)v4;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  else {
    double v6 = &stru_1F283BC78;
  }
  id v7 = v6;

  uint64_t v8 = [v3 localIdentifier];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1F283BC78;
  }
  objc_super v11 = v10;

  uint64_t v12 = [v3 contactID];
  long long v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_1F283BC78;
  }
  long long v15 = v14;

  uint64_t v16 = [v3 shareParticipantLocalIdentifier];
  double v17 = (void *)v16;
  if (v16) {
    double v18 = (__CFString *)v16;
  }
  else {
    double v18 = &stru_1F283BC78;
  }
  __int16 v19 = v18;

  uint64_t v20 = [v3 isFavorite];
  uint64_t v21 = [v3 isUserCreated];
  uint64_t v22 = [v3 sex];
  uint64_t v23 = [v3 ageCategory];
  v41 = v7;
  v42[0] = @"name";
  v43[0] = v7;
  v42[1] = @"fav";
  double v24 = [NSNumber numberWithBool:v20];
  v43[1] = v24;
  v43[2] = v11;
  v40 = v11;
  double v25 = v19;
  v42[2] = @"id";
  v42[3] = @"usercreated";
  double v26 = [NSNumber numberWithBool:v21];
  v43[3] = v26;
  v43[4] = v15;
  v42[4] = @"cnid";
  v42[5] = @"shareparticipant";
  v43[5] = v19;
  v42[6] = @"sex";
  BOOL v27 = [NSNumber numberWithUnsignedInteger:v22];
  v43[6] = v27;
  v42[7] = @"agecategory";
  id v28 = [NSNumber numberWithUnsignedInteger:v23];
  v43[7] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:8];
  v30 = (void *)[v29 mutableCopy];

  v31 = [v3 birthdayDate];
  if (v31)
  {
    v32 = NSNumber;
    +[PGGraphPersonNode _specialDateTimeIntervalForDate:v31];
    v33 = objc_msgSend(v32, "numberWithDouble:");
    [v30 setObject:v33 forKeyedSubscript:@"bday"];
  }
  else
  {
    v33 = [v3 potentialBirthdayDate];
    if (v33)
    {
      v34 = NSNumber;
      +[PGGraphPersonNode _specialDateTimeIntervalForDate:v33];
      v35 = objc_msgSend(v34, "numberWithDouble:");
      [v30 setObject:v35 forKeyedSubscript:@"pbday"];
    }
  }

  v36 = [v3 anniversaryDate];
  if (v36)
  {
    v37 = NSNumber;
    +[PGGraphPersonNode _specialDateTimeIntervalForDate:v36];
    v38 = objc_msgSend(v37, "numberWithDouble:");
    [v30 setObject:v38 forKeyedSubscript:@"anniv"];
  }
  return v30;
}

+ (NSArray)personSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"contactIdentifier" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localIdentifier" ascending:0];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

+ (NSArray)personScoreSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personScore" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localIdentifier" ascending:0];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

+ (id)changedPropertyNamesForContactsChange
{
  v6[7] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"cnid";
  v6[1] = @"bday";
  v6[2] = @"pbday";
  void v6[3] = @"anniv";
  void v6[4] = @"sex";
  v6[5] = @"agecategory";
  v6[6] = @"name";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

+ (MANodeFilter)filterShareParticipantIdentifierNotEmpty
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphPersonNode filterIncludingMe];
  id v7 = @"shareparticipant";
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&stru_1F283BC78];
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v5 = [v2 filterBySettingProperties:v4];

  return (MANodeFilter *)v5;
}

+ (id)filterWithShareParticipantIdentifiers:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[PGGraphPersonNode filterIncludingMe];
  uint64_t v8 = @"shareparticipant";
  v9[0] = v3;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  double v6 = [v4 filterBySettingProperties:v5];

  return v6;
}

+ (MANodeFilter)filterNameEmpty
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphPersonNode filterIncludingMe];
  double v6 = @"name";
  v7[0] = &stru_1F283BC78;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [v2 filterBySettingProperties:v3];

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)filterNameNotEmpty
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphPersonNode filterIncludingMe];
  id v7 = @"name";
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&stru_1F283BC78];
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v5 = [v2 filterBySettingProperties:v4];

  return (MANodeFilter *)v5;
}

+ (MANodeFilter)filterIncludingMe
{
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"People", @"Me", 0);
  uint64_t v4 = (void *)[v2 initWithLabels:v3 domain:300 properties:MEMORY[0x1E4F1CC08]];

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)filterExcludingMe
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"People" domain:300];
  return (MANodeFilter *)v2;
}

+ (id)filter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:300];
  return v2;
}

@end