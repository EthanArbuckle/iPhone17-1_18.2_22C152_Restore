@interface PGGraphContactSuggestionEdge
+ (id)filter;
- (BOOL)contactFaceprintMatch;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isFilteredOut;
- (BOOL)isHighConfidence;
- (BOOL)personContactBiologicalSexMatch;
- (BOOL)personContactBiologicalSexMismatch;
- (NSString)messageGroupsDebug;
- (NSString)relationshipsDebug;
- (NSString)socialGroupsDebug;
- (PGGraphContactSuggestionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphContactSuggestionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)addressScore;
- (double)birthdayScore;
- (double)calendarScore;
- (double)confidence;
- (double)contactScore;
- (double)facetimeFaceprintConfidence;
- (double)mentionedAddressScore;
- (double)potentialBirthdayScore;
- (double)relationshipScore;
- (double)scoreAfterMessagePenalty;
- (double)sharedAssetScore;
- (double)sharedCMMScore;
- (double)socialGroupsConfidence;
- (id)_readableStringForContactSuggestionProperty:(id)a3;
- (id)_stringForBiologicalSexMatch:(unint64_t)a3;
- (id)edgeDescription;
- (id)initFromPersonNode:(id)a3 toContactNode:(id)a4 confidence:(double)a5 contactScore:(double)a6 numberOfMomentsAtHome:(unint64_t)a7 numberOfMomentsAtMentionedAddress:(unint64_t)a8 numberOfWeakBirthdayMomentsAroundBirthdayDate:(unint64_t)a9 numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:(unint64_t)a10 numberOfMomentsOverlappingWithCalendarEvents:(unint64_t)a11 numberOfAppearancesInSharedAssets:(unint64_t)a12 numberOfCMMMoments:(unint64_t)a13 facetimeFaceprintConfidence:(double)a14 contactFaceprintMatch:(BOOL)a15 relationshipsDebug:(id)a16 socialGroupsConfidence:(double)a17 socialGroupsDebug:(id)a18 messageGroupsDebug:(id)a19 birthdayScore:(double)a20 potentialBirthdayScore:(double)a21 addressScore:(double)a22 mentionedAddressScore:(double)a23 calendarScore:(double)a24 sharedAssetScore:(double)a25 sharedCMMScore:(double)a26 relationshipScore:(double)a27 scoreAfterMessagePenalty:(double)a28 sexMatch:(unint64_t)a29;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)numberOfAppearancesInSharedAssets;
- (unint64_t)numberOfCMMMoments;
- (unint64_t)numberOfMatchedMessageGroups;
- (unint64_t)numberOfMatchedRelationships;
- (unint64_t)numberOfMomentsAtHome;
- (unint64_t)numberOfMomentsAtMentionedAddress;
- (unint64_t)numberOfMomentsOverlappingWithCalendarEvents;
- (unint64_t)numberOfWeakBirthdayMomentsAroundBirthdayDate;
- (unint64_t)numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate;
- (unint64_t)sexMatch;
- (unsigned)domain;
@end

@implementation PGGraphContactSuggestionEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGroupsDebug, 0);
  objc_storeStrong((id *)&self->_socialGroupsDebug, 0);
  objc_storeStrong((id *)&self->_relationshipsDebug, 0);
}

- (unint64_t)sexMatch
{
  return self->_sexMatch;
}

- (double)scoreAfterMessagePenalty
{
  return self->_scoreAfterMessagePenalty;
}

- (double)relationshipScore
{
  return self->_relationshipScore;
}

- (double)sharedCMMScore
{
  return self->_sharedCMMScore;
}

- (double)sharedAssetScore
{
  return self->_sharedAssetScore;
}

- (double)calendarScore
{
  return self->_calendarScore;
}

- (double)mentionedAddressScore
{
  return self->_mentionedAddressScore;
}

- (double)addressScore
{
  return self->_addressScore;
}

- (double)potentialBirthdayScore
{
  return self->_potentialBirthdayScore;
}

- (double)birthdayScore
{
  return self->_birthdayScore;
}

- (NSString)messageGroupsDebug
{
  return self->_messageGroupsDebug;
}

- (NSString)socialGroupsDebug
{
  return self->_socialGroupsDebug;
}

- (double)socialGroupsConfidence
{
  return self->_socialGroupsConfidence;
}

- (NSString)relationshipsDebug
{
  return self->_relationshipsDebug;
}

- (BOOL)contactFaceprintMatch
{
  return self->_contactFaceprintMatch;
}

- (double)facetimeFaceprintConfidence
{
  return self->_facetimeFaceprintConfidence;
}

- (unint64_t)numberOfCMMMoments
{
  return self->_numberOfCMMMoments;
}

- (unint64_t)numberOfAppearancesInSharedAssets
{
  return self->_numberOfAppearancesInSharedAssets;
}

- (unint64_t)numberOfMomentsOverlappingWithCalendarEvents
{
  return self->_numberOfMomentsOverlappingWithCalendarEvents;
}

- (unint64_t)numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate
{
  return self->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate;
}

- (unint64_t)numberOfWeakBirthdayMomentsAroundBirthdayDate
{
  return self->_numberOfWeakBirthdayMomentsAroundBirthdayDate;
}

- (unint64_t)numberOfMomentsAtMentionedAddress
{
  return self->_numberOfMomentsAtMentionedAddress;
}

- (unint64_t)numberOfMomentsAtHome
{
  return self->_numberOfMomentsAtHome;
}

- (double)contactScore
{
  return self->_contactScore;
}

- (double)confidence
{
  return self->_confidence;
}

- (id)_readableStringForContactSuggestionProperty:(id)a3
{
  v11[23] = *MEMORY[0x1E4F143B8];
  v10[0] = @"gwnummmtshome";
  v10[1] = @"gwnummentndaddrs";
  v11[0] = @"SignalNumberOfMomentsAtHome";
  v11[1] = @"SignalNumberOfMomentsAtMentionedAddress";
  v10[2] = @"gwnumbdaymmt";
  v10[3] = @"gwnummmtsclndrevents";
  v11[2] = @"SignalNumberOfWeakBirthdayMomentsAroundBirthdayDate";
  v11[3] = @"SignalNumberOfMomentsOverlappingWithCalendarEvents";
  v10[4] = @"gwnumassts";
  v10[5] = @"gwnumcmm";
  v11[4] = @"SignalNumberOfAppearancesInSharedAssets";
  v11[5] = @"SignalNumberOfSharedCMMWithPeople";
  v10[6] = @"gwftfprntconf";
  v10[7] = @"gwfprntsmatch";
  v11[6] = @"SignalFacetimeFaceprintConfidence";
  v11[7] = @"SignalContactFaceprintMatch";
  v10[8] = @"gwsocialgrpsconf";
  v10[9] = @"gwsocialgrps";
  v11[8] = @"SignalSocialGroupsConfidence";
  v11[9] = @"DebugSocialGroups";
  v10[10] = @"gwmsggrps";
  v10[11] = @"gwreldebug";
  v11[10] = @"DebugMessageGroups";
  v11[11] = @"SignalRelationships";
  v10[12] = @"gwgenmatch";
  v10[13] = @"gwscore";
  v11[12] = @"SignalBiologicalSexMatch";
  v11[13] = @"TotalContactScore";
  v10[14] = @"bdayscore";
  v10[15] = @"pbdayscore";
  v11[14] = @"SignalBirthdayScore";
  v11[15] = @"SignalPotentialBirthdayScore";
  v10[16] = @"addscore";
  v10[17] = @"maddscore";
  v11[16] = @"SignalAddressScore";
  v11[17] = @"SignalMentionedAddressScore";
  v10[18] = @"calscore";
  v10[19] = @"asstscore";
  v11[18] = @"SignalCalendarScore";
  v11[19] = @"SignalSharedAssetScore";
  v10[20] = @"cmmscore";
  v10[21] = @"relscore";
  v11[20] = @"SignalSharedCMMScore";
  v11[21] = @"SignalRelationshipScore";
  v10[22] = @"scoremfp";
  v11[22] = @"TotalScoreAfterMessageFrequencyPenalty";
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v11 forKeys:v10 count:23];
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = v6;

  return v8;
}

- (BOOL)personContactBiologicalSexMismatch
{
  return self->_sexMatch == 2;
}

- (BOOL)personContactBiologicalSexMatch
{
  return self->_sexMatch == 1;
}

- (unint64_t)numberOfMatchedMessageGroups
{
  unint64_t result = [(NSString *)self->_messageGroupsDebug length];
  if (result)
  {
    id v4 = [(NSString *)self->_messageGroupsDebug componentsSeparatedByString:@" / "];
    unint64_t v5 = [v4 count];

    return v5;
  }
  return result;
}

- (unint64_t)numberOfMatchedRelationships
{
  unint64_t result = [(NSString *)self->_relationshipsDebug length];
  if (result)
  {
    id v4 = [(NSString *)self->_relationshipsDebug componentsSeparatedByString:@" , "];
    unint64_t v5 = [v4 count];

    return v5;
  }
  return result;
}

- (BOOL)isHighConfidence
{
  [(PGGraphContactSuggestionEdge *)self confidence];
  return v2 == 1.0;
}

- (BOOL)isFilteredOut
{
  [(PGGraphContactSuggestionEdge *)self confidence];
  return v2 == 0.0;
}

- (id)_stringForBiologicalSexMatch:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E68E95E0[a3];
  }
}

- (unsigned)domain
{
  return 303;
}

- (id)label
{
  double v2 = @"PEOPLE_CONTACT_SUGGESTION";
  return @"PEOPLE_CONTACT_SUGGESTION";
}

- (id)edgeDescription
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphContactSuggestionEdge *)self propertyDictionary];
  v22 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = [(PGGraphContactSuggestionEdge *)self _readableStringForContactSuggestionProperty:v9];
        v11 = NSString;
        v12 = [v4 objectForKeyedSubscript:v9];
        v13 = [v11 stringWithFormat:@"%@", v12];

        if ([v9 isEqualToString:@"gwgenmatch"])
        {
          uint64_t v14 = -[PGGraphContactSuggestionEdge _stringForBiologicalSexMatch:](self, "_stringForBiologicalSexMatch:", [v13 integerValue]);

          v13 = (void *)v14;
        }
        v15 = [NSString stringWithFormat:@"%@: %@", v10, v13];
        [v22 addObject:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v16 = [v22 sortedArrayUsingSelector:sel_compare_];
  v17 = NSString;
  v23.receiver = self;
  v23.super_class = (Class)PGGraphContactSuggestionEdge;
  v18 = [(PGGraphOptimizedEdge *)&v23 edgeDescription];
  v19 = [v16 componentsJoinedByString:@", "];
  v20 = [v17 stringWithFormat:@"%@ (%@)", v18, v19];

  return v20;
}

- (id)propertyDictionary
{
  v34[25] = *MEMORY[0x1E4F143B8];
  v33[0] = @"confidence";
  v32 = [NSNumber numberWithDouble:self->_confidence];
  v34[0] = v32;
  v33[1] = @"gwscore";
  v31 = [NSNumber numberWithDouble:self->_contactScore];
  v34[1] = v31;
  v33[2] = @"gwnummmtshome";
  v30 = [NSNumber numberWithUnsignedInteger:self->_numberOfMomentsAtHome];
  v34[2] = v30;
  v33[3] = @"gwnummentndaddrs";
  uint64_t v29 = [NSNumber numberWithUnsignedInteger:self->_numberOfMomentsAtMentionedAddress];
  v34[3] = v29;
  v33[4] = @"gwnumbdaymmt";
  v28 = [NSNumber numberWithUnsignedInteger:self->_numberOfWeakBirthdayMomentsAroundBirthdayDate];
  v34[4] = v28;
  v33[5] = @"gwnummbdaymmt";
  long long v27 = [NSNumber numberWithUnsignedInteger:self->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate];
  v34[5] = v27;
  v33[6] = @"gwnummmtsclndrevents";
  long long v26 = [NSNumber numberWithUnsignedInteger:self->_numberOfMomentsOverlappingWithCalendarEvents];
  v34[6] = v26;
  v33[7] = @"gwnumassts";
  long long v25 = [NSNumber numberWithUnsignedInteger:self->_numberOfAppearancesInSharedAssets];
  v34[7] = v25;
  v33[8] = @"gwnumcmm";
  long long v24 = [NSNumber numberWithUnsignedInteger:self->_numberOfCMMMoments];
  v34[8] = v24;
  v33[9] = @"gwftfprntconf";
  objc_super v23 = [NSNumber numberWithDouble:self->_facetimeFaceprintConfidence];
  v34[9] = v23;
  v33[10] = @"gwfprntsmatch";
  uint64_t v3 = [NSNumber numberWithBool:self->_contactFaceprintMatch];
  v22 = (void *)v3;
  relationshipsDebug = self->_relationshipsDebug;
  if (!relationshipsDebug) {
    relationshipsDebug = (NSString *)&stru_1F283BC78;
  }
  v34[10] = v3;
  v34[11] = relationshipsDebug;
  v33[11] = @"gwreldebug";
  v33[12] = @"gwsocialgrpsconf";
  uint64_t v5 = [NSNumber numberWithDouble:self->_socialGroupsConfidence];
  v21 = (void *)v5;
  socialGroupsDebug = self->_socialGroupsDebug;
  if (!socialGroupsDebug) {
    socialGroupsDebug = (NSString *)&stru_1F283BC78;
  }
  v34[12] = v5;
  v34[13] = socialGroupsDebug;
  messageGroupsDebug = self->_messageGroupsDebug;
  v33[13] = @"gwsocialgrps";
  v33[14] = @"gwmsggrps";
  if (messageGroupsDebug) {
    id v8 = (__CFString *)messageGroupsDebug;
  }
  else {
    id v8 = &stru_1F283BC78;
  }
  v34[14] = v8;
  v33[15] = @"gwgenmatch";
  v20 = [NSNumber numberWithUnsignedInteger:self->_sexMatch];
  v34[15] = v20;
  v33[16] = @"bdayscore";
  v9 = [NSNumber numberWithDouble:self->_birthdayScore];
  v34[16] = v9;
  v33[17] = @"pbdayscore";
  v10 = [NSNumber numberWithDouble:self->_potentialBirthdayScore];
  v34[17] = v10;
  v33[18] = @"addscore";
  v11 = [NSNumber numberWithDouble:self->_addressScore];
  v34[18] = v11;
  v33[19] = @"maddscore";
  v12 = [NSNumber numberWithDouble:self->_mentionedAddressScore];
  v34[19] = v12;
  v33[20] = @"calscore";
  v13 = [NSNumber numberWithDouble:self->_calendarScore];
  v34[20] = v13;
  v33[21] = @"asstscore";
  uint64_t v14 = [NSNumber numberWithDouble:self->_sharedAssetScore];
  v34[21] = v14;
  v33[22] = @"cmmscore";
  v15 = [NSNumber numberWithDouble:self->_sharedCMMScore];
  v34[22] = v15;
  v33[23] = @"relscore";
  v16 = [NSNumber numberWithDouble:self->_relationshipScore];
  v34[23] = v16;
  v33[24] = @"scoremfp";
  v17 = [NSNumber numberWithDouble:self->_scoreAfterMessagePenalty];
  v34[24] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:25];

  return v18;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"confidence"];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_confidence) {
        goto LABEL_53;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"gwscore"];
    uint64_t v7 = v9;
    if (v9)
    {
      [v9 doubleValue];
      if (v10 != self->_contactScore) {
        goto LABEL_53;
      }
    }

    v11 = [v5 objectForKeyedSubscript:@"gwnummmtshome"];
    uint64_t v7 = v11;
    if (v11)
    {
      if ([v11 unsignedIntegerValue] != self->_numberOfMomentsAtHome) {
        goto LABEL_53;
      }
    }

    v12 = [v5 objectForKeyedSubscript:@"gwnummentndaddrs"];
    uint64_t v7 = v12;
    if (v12)
    {
      if ([v12 unsignedIntegerValue] != self->_numberOfMomentsAtMentionedAddress) {
        goto LABEL_53;
      }
    }

    v13 = [v5 objectForKeyedSubscript:@"gwnumbdaymmt"];
    uint64_t v7 = v13;
    if (v13)
    {
      if ([v13 unsignedIntegerValue] != self->_numberOfWeakBirthdayMomentsAroundBirthdayDate) {
        goto LABEL_53;
      }
    }

    uint64_t v14 = [v5 objectForKeyedSubscript:@"gwnummbdaymmt"];
    uint64_t v7 = v14;
    if (v14)
    {
      if ([v14 unsignedIntegerValue] != self->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate) {
        goto LABEL_53;
      }
    }

    v15 = [v5 objectForKeyedSubscript:@"gwnummmtsclndrevents"];
    uint64_t v7 = v15;
    if (v15)
    {
      if ([v15 unsignedIntegerValue] != self->_numberOfMomentsOverlappingWithCalendarEvents) {
        goto LABEL_53;
      }
    }

    v16 = [v5 objectForKeyedSubscript:@"gwnumassts"];
    uint64_t v7 = v16;
    if (v16)
    {
      if ([v16 unsignedIntegerValue] != self->_numberOfAppearancesInSharedAssets) {
        goto LABEL_53;
      }
    }

    v17 = [v5 objectForKeyedSubscript:@"gwnumcmm"];
    uint64_t v7 = v17;
    if (v17)
    {
      if ([v17 unsignedIntegerValue] != self->_numberOfCMMMoments) {
        goto LABEL_53;
      }
    }

    v18 = [v5 objectForKeyedSubscript:@"gwftfprntconf"];
    uint64_t v7 = v18;
    if (v18)
    {
      [v18 doubleValue];
      if (v19 != self->_facetimeFaceprintConfidence) {
        goto LABEL_53;
      }
    }

    v20 = [v5 objectForKeyedSubscript:@"gwfprntsmatch"];
    uint64_t v7 = v20;
    if (v20)
    {
      if (self->_contactFaceprintMatch != [v20 BOOLValue]) {
        goto LABEL_53;
      }
    }

    v21 = [v5 objectForKeyedSubscript:@"gwreldebug"];
    uint64_t v7 = v21;
    if (v21)
    {
      if (![v21 isEqual:self->_relationshipsDebug]) {
        goto LABEL_53;
      }
    }

    v22 = [v5 objectForKeyedSubscript:@"gwsocialgrpsconf"];
    uint64_t v7 = v22;
    if (v22)
    {
      [v22 doubleValue];
      if (v23 != self->_socialGroupsConfidence) {
        goto LABEL_53;
      }
    }

    long long v24 = [v5 objectForKeyedSubscript:@"gwsocialgrps"];
    uint64_t v7 = v24;
    if (v24)
    {
      if (![v24 isEqual:self->_socialGroupsDebug]) {
        goto LABEL_53;
      }
    }

    long long v25 = [v5 objectForKeyedSubscript:@"gwmsggrps"];
    uint64_t v7 = v25;
    if (v25)
    {
      if (![v25 isEqual:self->_messageGroupsDebug]) {
        goto LABEL_53;
      }
    }

    long long v26 = [v5 objectForKeyedSubscript:@"gwgenmatch"];
    uint64_t v7 = v26;
    if (v26)
    {
      if ([v26 unsignedIntegerValue] != self->_sexMatch) {
        goto LABEL_53;
      }
    }

    long long v27 = [v5 objectForKeyedSubscript:@"bdayscore"];
    uint64_t v7 = v27;
    if (v27)
    {
      [v27 doubleValue];
      if (v28 != self->_birthdayScore) {
        goto LABEL_53;
      }
    }

    uint64_t v29 = [v5 objectForKeyedSubscript:@"pbdayscore"];
    uint64_t v7 = v29;
    if (v29)
    {
      [v29 doubleValue];
      if (v30 != self->_potentialBirthdayScore) {
        goto LABEL_53;
      }
    }

    v31 = [v5 objectForKeyedSubscript:@"addscore"];
    uint64_t v7 = v31;
    if (v31)
    {
      [v31 doubleValue];
      if (v32 != self->_addressScore) {
        goto LABEL_53;
      }
    }

    v33 = [v5 objectForKeyedSubscript:@"maddscore"];
    uint64_t v7 = v33;
    if (v33)
    {
      [v33 doubleValue];
      if (v34 != self->_mentionedAddressScore) {
        goto LABEL_53;
      }
    }

    v35 = [v5 objectForKeyedSubscript:@"calscore"];
    uint64_t v7 = v35;
    if (v35)
    {
      [v35 doubleValue];
      if (v36 != self->_calendarScore) {
        goto LABEL_53;
      }
    }

    v37 = [v5 objectForKeyedSubscript:@"asstscore"];
    uint64_t v7 = v37;
    if (v37)
    {
      [v37 doubleValue];
      if (v38 != self->_sharedAssetScore) {
        goto LABEL_53;
      }
    }

    v39 = [v5 objectForKeyedSubscript:@"cmmscore"];
    uint64_t v7 = v39;
    if (v39)
    {
      [v39 doubleValue];
      if (v40 != self->_sharedCMMScore) {
        goto LABEL_53;
      }
    }

    v41 = [v5 objectForKeyedSubscript:@"relscore"];
    uint64_t v7 = v41;
    if (v41)
    {
      [v41 doubleValue];
      if (v42 != self->_relationshipScore) {
        goto LABEL_53;
      }
    }

    v43 = [v5 objectForKeyedSubscript:@"scoremfp"];
    uint64_t v7 = v43;
    if (!v43 || ([v43 doubleValue], v44 == self->_scoreAfterMessagePenalty)) {
      BOOL v45 = 1;
    }
    else {
LABEL_53:
    }
      BOOL v45 = 0;
  }
  else
  {
    BOOL v45 = 1;
  }

  return v45;
}

- (PGGraphContactSuggestionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"confidence"];

  if (!v18)
  {
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"confidence"];

    id v17 = v19;
  }
  v22 = [(PGGraphContactSuggestionEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphContactSuggestionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v9 = a7;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 objectForKeyedSubscript:@"confidence"];
  [v12 doubleValue];
  double v74 = v13;

  id v14 = [v9 objectForKeyedSubscript:@"gwscore"];
  [v14 doubleValue];
  double v73 = v15;

  id v16 = [v9 objectForKeyedSubscript:@"gwnummmtshome"];
  uint64_t v72 = [v16 unsignedIntegerValue];

  id v17 = [v9 objectForKeyedSubscript:@"gwnummentndaddrs"];
  uint64_t v71 = [v17 unsignedIntegerValue];

  v18 = [v9 objectForKeyedSubscript:@"gwnumbdaymmt"];
  uint64_t v70 = [v18 unsignedIntegerValue];

  double v19 = [v9 objectForKeyedSubscript:@"gwnummbdaymmt"];
  uint64_t v69 = [v19 unsignedIntegerValue];

  double v20 = [v9 objectForKeyedSubscript:@"gwnummmtsclndrevents"];
  uint64_t v68 = [v20 unsignedIntegerValue];

  v21 = [v9 objectForKeyedSubscript:@"gwnumassts"];
  uint64_t v22 = [v21 unsignedIntegerValue];

  double v23 = [v9 objectForKeyedSubscript:@"gwnumcmm"];
  uint64_t v24 = [v23 unsignedIntegerValue];

  long long v25 = [v9 objectForKeyedSubscript:@"gwftfprntconf"];
  [v25 doubleValue];
  double v67 = v26;

  long long v27 = [v9 objectForKeyedSubscript:@"gwfprntsmatch"];
  char v28 = [v27 BOOLValue];

  uint64_t v29 = [v9 objectForKeyedSubscript:@"gwreldebug"];
  double v30 = [v9 objectForKeyedSubscript:@"gwsocialgrpsconf"];
  [v30 doubleValue];
  double v66 = v31;

  double v32 = [v9 objectForKeyedSubscript:@"gwsocialgrps"];
  v33 = [v9 objectForKeyedSubscript:@"gwmsggrps"];
  double v34 = [v9 objectForKeyedSubscript:@"bdayscore"];
  [v34 doubleValue];
  double v65 = v35;

  double v36 = [v9 objectForKeyedSubscript:@"pbdayscore"];
  [v36 doubleValue];
  double v38 = v37;

  v39 = [v9 objectForKeyedSubscript:@"addscore"];
  [v39 doubleValue];
  double v41 = v40;

  double v42 = [v9 objectForKeyedSubscript:@"maddscore"];
  [v42 doubleValue];
  double v44 = v43;

  BOOL v45 = [v9 objectForKeyedSubscript:@"calscore"];
  [v45 doubleValue];
  uint64_t v47 = v46;

  v48 = [v9 objectForKeyedSubscript:@"asstscore"];
  [v48 doubleValue];
  uint64_t v50 = v49;

  v51 = [v9 objectForKeyedSubscript:@"cmmscore"];
  [v51 doubleValue];
  uint64_t v53 = v52;

  v54 = [v9 objectForKeyedSubscript:@"relscore"];
  [v54 doubleValue];
  uint64_t v56 = v55;

  v57 = [v9 objectForKeyedSubscript:@"scoremfp"];
  [v57 doubleValue];
  uint64_t v59 = v58;

  v60 = [v9 objectForKeyedSubscript:@"gwgenmatch"];

  uint64_t v61 = [v60 unsignedIntegerValue];
  LOBYTE(v64) = v28;
  v62 = -[PGGraphContactSuggestionEdge initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:](self, "initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:", v11, v10, v72, v71, v70, v69, v74, v73, v67, v66, v65, v38,
          v41,
          v44,
          v68,
          v22,
          v24,
          v64,
          v29,
          v32,
          v33,
          v47,
          v50,
          v53,
          v56,
          v59,
          v61);

  return v62;
}

- (id)initFromPersonNode:(id)a3 toContactNode:(id)a4 confidence:(double)a5 contactScore:(double)a6 numberOfMomentsAtHome:(unint64_t)a7 numberOfMomentsAtMentionedAddress:(unint64_t)a8 numberOfWeakBirthdayMomentsAroundBirthdayDate:(unint64_t)a9 numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:(unint64_t)a10 numberOfMomentsOverlappingWithCalendarEvents:(unint64_t)a11 numberOfAppearancesInSharedAssets:(unint64_t)a12 numberOfCMMMoments:(unint64_t)a13 facetimeFaceprintConfidence:(double)a14 contactFaceprintMatch:(BOOL)a15 relationshipsDebug:(id)a16 socialGroupsConfidence:(double)a17 socialGroupsDebug:(id)a18 messageGroupsDebug:(id)a19 birthdayScore:(double)a20 potentialBirthdayScore:(double)a21 addressScore:(double)a22 mentionedAddressScore:(double)a23 calendarScore:(double)a24 sharedAssetScore:(double)a25 sharedCMMScore:(double)a26 relationshipScore:(double)a27 scoreAfterMessagePenalty:(double)a28 sexMatch:(unint64_t)a29
{
  id v49 = a16;
  id v48 = a18;
  id v47 = a19;
  v50.receiver = self;
  v50.super_class = (Class)PGGraphContactSuggestionEdge;
  double v44 = [(PGGraphEdge *)&v50 initWithSourceNode:a3 targetNode:a4];
  BOOL v45 = v44;
  if (v44)
  {
    v44->_confidence = a5;
    v44->_contactScore = a6;
    v44->_numberOfMomentsAtHome = a7;
    v44->_numberOfMomentsAtMentionedAddress = a8;
    v44->_numberOfWeakBirthdayMomentsAroundBirthdayDate = a9;
    v44->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate = a10;
    v44->_numberOfMomentsOverlappingWithCalendarEvents = a11;
    v44->_numberOfAppearancesInSharedAssets = a12;
    v44->_contactFaceprintMatch = a15;
    v44->_numberOfCMMMoments = a13;
    v44->_facetimeFaceprintConfidence = a14;
    objc_storeStrong((id *)&v44->_relationshipsDebug, a16);
    v45->_socialGroupsConfidence = a17;
    objc_storeStrong((id *)&v45->_socialGroupsDebug, a18);
    objc_storeStrong((id *)&v45->_messageGroupsDebug, a19);
    v45->_birthdayScore = a20;
    v45->_potentialBirthdayScore = a21;
    v45->_addressScore = a22;
    v45->_mentionedAddressScore = a23;
    v45->_calendarScore = a24;
    v45->_sharedAssetScore = a25;
    v45->_sharedCMMScore = a26;
    v45->_relationshipScore = a27;
    v45->_scoreAfterMessagePenalty = a28;
    v45->_sexMatch = a29;
  }

  return v45;
}

+ (id)filter
{
  double v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PEOPLE_CONTACT_SUGGESTION" domain:303];
  return v2;
}

@end