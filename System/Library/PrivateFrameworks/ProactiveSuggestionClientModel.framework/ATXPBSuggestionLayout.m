@interface ATXPBSuggestionLayout
+ (uint64_t)oneByOneSuggestionsType;
- (BOOL)confidenceWarrantsSnappingOrNPlusOne;
- (BOOL)hasUuidOfHighestConfidenceSuggestion;
- (BOOL)hasUuidString;
- (BOOL)hasWidgetUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowConfidenceStackRotationForStaleStack;
- (BOOL)isNPlusOne;
- (BOOL)isValidForSuggestionsWidget;
- (BOOL)readFrom:(id)a3;
- (__CFString)layoutTypeAsString:(__CFString *)a1;
- (double)layoutScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fourByEightSuggestionsAtIndex:(id *)a1;
- (id)fourByFourSuggestionsAtIndex:(id *)a1;
- (id)oneByFourSuggestionsAtIndex:(id *)a1;
- (id)oneByOneSuggestionsAtIndex:(id *)a1;
- (id)oneByTwoSuggestionsAtIndex:(id *)a1;
- (id)twoByFourSuggestionsAtIndex:(id *)a1;
- (id)twoByTwoSuggestionsAtIndex:(id *)a1;
- (uint64_t)StringAsLayoutType:(uint64_t)a1;
- (uint64_t)addFourByEightSuggestions:(uint64_t)a1;
- (uint64_t)addFourByFourSuggestions:(uint64_t)a1;
- (uint64_t)addOneByFourSuggestions:(uint64_t)a1;
- (uint64_t)addOneByOneSuggestions:(uint64_t)a1;
- (uint64_t)addOneByTwoSuggestions:(uint64_t)a1;
- (uint64_t)addTwoByFourSuggestions:(uint64_t)a1;
- (uint64_t)addTwoByTwoSuggestions:(uint64_t)a1;
- (uint64_t)clearFourByEightSuggestions;
- (uint64_t)clearFourByFourSuggestions;
- (uint64_t)clearOneByFourSuggestions;
- (uint64_t)clearOneByOneSuggestions;
- (uint64_t)clearOneByTwoSuggestions;
- (uint64_t)clearTwoByFourSuggestions;
- (uint64_t)clearTwoByTwoSuggestions;
- (uint64_t)fourByEightSuggestions;
- (uint64_t)fourByEightSuggestionsCount;
- (uint64_t)fourByFourSuggestions;
- (uint64_t)fourByFourSuggestionsCount;
- (uint64_t)hasConfidenceWarrantsSnappingOrNPlusOne;
- (uint64_t)hasIsLowConfidenceStackRotationForStaleStack;
- (uint64_t)hasIsNPlusOne;
- (uint64_t)hasIsValidForSuggestionsWidget;
- (uint64_t)hasLayoutScore;
- (uint64_t)hasLayoutType;
- (uint64_t)hasNumWidgetsInStack;
- (uint64_t)layoutType;
- (uint64_t)numWidgetsInStack;
- (uint64_t)oneByFourSuggestions;
- (uint64_t)oneByFourSuggestionsCount;
- (uint64_t)oneByOneSuggestions;
- (uint64_t)oneByOneSuggestionsCount;
- (uint64_t)oneByTwoSuggestions;
- (uint64_t)oneByTwoSuggestionsCount;
- (uint64_t)setConfidenceWarrantsSnappingOrNPlusOne:(uint64_t)result;
- (uint64_t)setHasConfidenceWarrantsSnappingOrNPlusOne:(uint64_t)result;
- (uint64_t)setHasIsLowConfidenceStackRotationForStaleStack:(uint64_t)result;
- (uint64_t)setHasIsNPlusOne:(uint64_t)result;
- (uint64_t)setHasIsValidForSuggestionsWidget:(uint64_t)result;
- (uint64_t)setHasLayoutScore:(uint64_t)result;
- (uint64_t)setHasLayoutType:(uint64_t)result;
- (uint64_t)setHasNumWidgetsInStack:(uint64_t)result;
- (uint64_t)setIsLowConfidenceStackRotationForStaleStack:(uint64_t)result;
- (uint64_t)setIsNPlusOne:(uint64_t)result;
- (uint64_t)setIsValidForSuggestionsWidget:(uint64_t)result;
- (uint64_t)setLayoutScore:(uint64_t)result;
- (uint64_t)setLayoutType:(uint64_t)result;
- (uint64_t)setNumWidgetsInStack:(uint64_t)result;
- (uint64_t)twoByFourSuggestions;
- (uint64_t)twoByFourSuggestionsCount;
- (uint64_t)twoByTwoSuggestions;
- (uint64_t)twoByTwoSuggestionsCount;
- (uint64_t)uuidOfHighestConfidenceSuggestion;
- (uint64_t)uuidString;
- (uint64_t)widgetUniqueId;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setFourByEightSuggestions:(uint64_t)a1;
- (void)setFourByFourSuggestions:(uint64_t)a1;
- (void)setOneByFourSuggestions:(uint64_t)a1;
- (void)setOneByOneSuggestions:(uint64_t)a1;
- (void)setOneByTwoSuggestions:(uint64_t)a1;
- (void)setTwoByFourSuggestions:(uint64_t)a1;
- (void)setTwoByTwoSuggestions:(uint64_t)a1;
- (void)setUuidOfHighestConfidenceSuggestion:(uint64_t)a1;
- (void)setUuidString:(uint64_t)a1;
- (void)setWidgetUniqueId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSuggestionLayout

- (uint64_t)addOneByOneSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 56);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;

      v5 = *(void **)(a1 + 56);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSuggestionLayoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)widgetUniqueId
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)uuidString
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (uint64_t)twoByTwoSuggestions
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)twoByFourSuggestions
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)oneByTwoSuggestions
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)oneByOneSuggestions
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)oneByFourSuggestions
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)numWidgetsInStack
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)layoutType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 116) & 4) != 0) {
      return *(unsigned int *)(result + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (double)layoutScore
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (BOOL)isValidForSuggestionsWidget
{
  if (result) {
    return *(unsigned char *)(result + 115) != 0;
  }
  return result;
}

- (BOOL)isNPlusOne
{
  if (result) {
    return *(unsigned char *)(result + 114) != 0;
  }
  return result;
}

- (BOOL)isLowConfidenceStackRotationForStaleStack
{
  if (result) {
    return *(unsigned char *)(result + 113) != 0;
  }
  return result;
}

- (BOOL)hasUuidOfHighestConfidenceSuggestion
{
  if (result) {
    return *(void *)(result + 88) != 0;
  }
  return result;
}

- (uint64_t)fourByFourSuggestions
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)fourByEightSuggestions
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)confidenceWarrantsSnappingOrNPlusOne
{
  if (result) {
    return *(unsigned char *)(result + 112) != 0;
  }
  return result;
}

- (uint64_t)uuidOfHighestConfidenceSuggestion
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_uuidOfHighestConfidenceSuggestion, 0);
  objc_storeStrong((id *)&self->_twoByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_twoByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByOneSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_fourByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_fourByEightSuggestions, 0);
}

- (uint64_t)setLayoutType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 4u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasLayoutType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasLayoutType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 116) >> 2) & 1;
  }
  return result;
}

- (__CFString)layoutTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5F00F38[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsLayoutType:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Eight1x1"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Two1x2AndFour1x1"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"One2x2AndFour1x1"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"One2x4"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Two1x2"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"One2x2"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"Two2x2"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"Four1x2"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"N1x4"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"Two1x4"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"One4x4"])
    {
      uint64_t v6 = 10;
    }
    else if ([v5 isEqualToString:@"Four1x4"])
    {
      uint64_t v6 = 11;
    }
    else if ([v5 isEqualToString:@"N2x2AndN1x1"])
    {
      uint64_t v6 = 12;
    }
    else if ([v5 isEqualToString:@"N2x4AndN1x1"])
    {
      uint64_t v6 = 13;
    }
    else if ([v5 isEqualToString:@"N2x4AndN2x2AndN1x1"])
    {
      uint64_t v6 = 14;
    }
    else if ([v5 isEqualToString:@"N1x1"])
    {
      uint64_t v6 = 15;
    }
    else if ([v5 isEqualToString:@"One4x8"])
    {
      uint64_t v6 = 16;
    }
    else if ([v5 isEqualToString:@"SuggestionList"])
    {
      uint64_t v6 = 17;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)setLayoutScore:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasLayoutScore:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasLayoutScore
{
  if (result) {
    return *(unsigned char *)(result + 116) & 1;
  }
  return result;
}

- (BOOL)hasUuidString
{
  if (result) {
    return *(void *)(result + 96) != 0;
  }
  return result;
}

- (uint64_t)clearOneByOneSuggestions
{
  if (result) {
    return [*(id *)(result + 56) removeAllObjects];
  }
  return result;
}

- (uint64_t)oneByOneSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 56) count];
  }
  return result;
}

- (id)oneByOneSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[7] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)oneByOneSuggestionsType
{
  self;
  return objc_opt_class();
}

- (uint64_t)clearOneByTwoSuggestions
{
  if (result) {
    return [*(id *)(result + 64) removeAllObjects];
  }
  return result;
}

- (uint64_t)addOneByTwoSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 64);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v6;

      id v5 = *(void **)(a1 + 64);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)oneByTwoSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 64) count];
  }
  return result;
}

- (id)oneByTwoSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[8] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearTwoByTwoSuggestions
{
  if (result) {
    return [*(id *)(result + 80) removeAllObjects];
  }
  return result;
}

- (uint64_t)addTwoByTwoSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 80);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v6;

      id v5 = *(void **)(a1 + 80);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)twoByTwoSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 80) count];
  }
  return result;
}

- (id)twoByTwoSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[10] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearOneByFourSuggestions
{
  if (result) {
    return [*(id *)(result + 48) removeAllObjects];
  }
  return result;
}

- (uint64_t)addOneByFourSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 48);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v6;

      id v5 = *(void **)(a1 + 48);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)oneByFourSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 48) count];
  }
  return result;
}

- (id)oneByFourSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[6] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearTwoByFourSuggestions
{
  if (result) {
    return [*(id *)(result + 72) removeAllObjects];
  }
  return result;
}

- (uint64_t)addTwoByFourSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 72);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v6;

      id v5 = *(void **)(a1 + 72);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)twoByFourSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 72) count];
  }
  return result;
}

- (id)twoByFourSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[9] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)setIsValidForSuggestionsWidget:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 0x40u;
    *(unsigned char *)(result + 115) = a2;
  }
  return result;
}

- (uint64_t)setHasIsValidForSuggestionsWidget:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 64;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xBF | v2;
  }
  return result;
}

- (uint64_t)hasIsValidForSuggestionsWidget
{
  if (result) {
    return (*(unsigned __int8 *)(result + 116) >> 6) & 1;
  }
  return result;
}

- (uint64_t)setConfidenceWarrantsSnappingOrNPlusOne:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 8u;
    *(unsigned char *)(result + 112) = a2;
  }
  return result;
}

- (uint64_t)setHasConfidenceWarrantsSnappingOrNPlusOne:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasConfidenceWarrantsSnappingOrNPlusOne
{
  if (result) {
    return (*(unsigned __int8 *)(result + 116) >> 3) & 1;
  }
  return result;
}

- (uint64_t)setIsNPlusOne:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 0x20u;
    *(unsigned char *)(result + 114) = a2;
  }
  return result;
}

- (uint64_t)setHasIsNPlusOne:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 32;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xDF | v2;
  }
  return result;
}

- (uint64_t)hasIsNPlusOne
{
  if (result) {
    return (*(unsigned __int8 *)(result + 116) >> 5) & 1;
  }
  return result;
}

- (BOOL)hasWidgetUniqueId
{
  if (result) {
    return *(void *)(result + 104) != 0;
  }
  return result;
}

- (uint64_t)setIsLowConfidenceStackRotationForStaleStack:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 0x10u;
    *(unsigned char *)(result + 113) = a2;
  }
  return result;
}

- (uint64_t)setHasIsLowConfidenceStackRotationForStaleStack:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasIsLowConfidenceStackRotationForStaleStack
{
  if (result) {
    return (*(unsigned __int8 *)(result + 116) >> 4) & 1;
  }
  return result;
}

- (uint64_t)setNumWidgetsInStack:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 116) |= 2u;
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasNumWidgetsInStack:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 116) = *(unsigned char *)(result + 116) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasNumWidgetsInStack
{
  if (result) {
    return (*(unsigned __int8 *)(result + 116) >> 1) & 1;
  }
  return result;
}

- (uint64_t)clearFourByFourSuggestions
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addFourByFourSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      id v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)fourByFourSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)fourByFourSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearFourByEightSuggestions
{
  if (result) {
    return [*(id *)(result + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)addFourByEightSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      id v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)fourByEightSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 24) count];
  }
  return result;
}

- (id)fourByEightSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSuggestionLayout;
  id v4 = [(ATXPBSuggestionLayout *)&v8 description];
  id v5 = [(ATXPBSuggestionLayout *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t layoutType = self->_layoutType;
    if (layoutType >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_layoutType);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E5F00F38[layoutType];
    }
    [v3 setObject:v6 forKey:@"layoutType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_layoutScore];
    [v3 setObject:v7 forKey:@"layoutScore"];
  }
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  if ([(NSMutableArray *)self->_oneByOneSuggestions count])
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_oneByOneSuggestions, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v10 = self->_oneByOneSuggestions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v92 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v91 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"oneByOneSuggestions"];
  }
  if ([(NSMutableArray *)self->_oneByTwoSuggestions count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_oneByTwoSuggestions, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v17 = self->_oneByTwoSuggestions;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v88 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v87 + 1) + 8 * j) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"oneByTwoSuggestions"];
  }
  if ([(NSMutableArray *)self->_twoByTwoSuggestions count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_twoByTwoSuggestions, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v24 = self->_twoByTwoSuggestions;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v83 objects:v99 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v84 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v83 + 1) + 8 * k) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v83 objects:v99 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKey:@"twoByTwoSuggestions"];
  }
  if ([(NSMutableArray *)self->_oneByFourSuggestions count])
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_oneByFourSuggestions, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v31 = self->_oneByFourSuggestions;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v79 objects:v98 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v80 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v79 + 1) + 8 * m) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v79 objects:v98 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKey:@"oneByFourSuggestions"];
  }
  if ([(NSMutableArray *)self->_twoByFourSuggestions count])
  {
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_twoByFourSuggestions, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v38 = self->_twoByFourSuggestions;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v75 objects:v97 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v76;
      do
      {
        for (uint64_t n = 0; n != v40; ++n)
        {
          if (*(void *)v76 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v75 + 1) + 8 * n) dictionaryRepresentation];
          [v37 addObject:v43];
        }
        uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v75 objects:v97 count:16];
      }
      while (v40);
    }

    [v3 setObject:v37 forKey:@"twoByFourSuggestions"];
  }
  char v44 = (char)self->_has;
  if ((v44 & 0x40) != 0)
  {
    v65 = [NSNumber numberWithBool:self->_isValidForSuggestionsWidget];
    [v3 setObject:v65 forKey:@"isValidForSuggestionsWidget"];

    char v44 = (char)self->_has;
    if ((v44 & 8) == 0)
    {
LABEL_57:
      if ((v44 & 0x20) == 0) {
        goto LABEL_59;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_57;
  }
  v66 = [NSNumber numberWithBool:self->_confidenceWarrantsSnappingOrNPlusOne];
  [v3 setObject:v66 forKey:@"confidenceWarrantsSnappingOrNPlusOne"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_58:
    v45 = [NSNumber numberWithBool:self->_isNPlusOne];
    [v3 setObject:v45 forKey:@"isNPlusOne"];
  }
LABEL_59:
  widgetUniqueId = self->_widgetUniqueId;
  if (widgetUniqueId) {
    [v3 setObject:widgetUniqueId forKey:@"widgetUniqueId"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v47 = [NSNumber numberWithBool:self->_isLowConfidenceStackRotationForStaleStack];
    [v3 setObject:v47 forKey:@"isLowConfidenceStackRotationForStaleStack"];
  }
  uuidOfHighestConfidenceSuggestiouint64_t n = self->_uuidOfHighestConfidenceSuggestion;
  if (uuidOfHighestConfidenceSuggestion) {
    [v3 setObject:uuidOfHighestConfidenceSuggestion forKey:@"uuidOfHighestConfidenceSuggestion"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v49 = [NSNumber numberWithUnsignedLongLong:self->_numWidgetsInStack];
    [v3 setObject:v49 forKey:@"numWidgetsInStack"];
  }
  if ([(NSMutableArray *)self->_fourByFourSuggestions count])
  {
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fourByFourSuggestions, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v51 = self->_fourByFourSuggestions;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v71 objects:v96 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v72;
      do
      {
        for (iuint64_t i = 0; ii != v53; ++ii)
        {
          if (*(void *)v72 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v71 + 1) + 8 * ii) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v71 objects:v96 count:16];
      }
      while (v53);
    }

    [v3 setObject:v50 forKey:@"fourByFourSuggestions"];
  }
  if ([(NSMutableArray *)self->_fourByEightSuggestions count])
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fourByEightSuggestions, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v58 = self->_fourByEightSuggestions;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v67 objects:v95 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v68;
      do
      {
        for (juint64_t j = 0; jj != v60; ++jj)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = [*(id *)(*((void *)&v67 + 1) + 8 * jj) dictionaryRepresentation];
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v67 objects:v95 count:16];
      }
      while (v60);
    }

    [v3 setObject:v57 forKey:@"fourByEightSuggestions"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v6 = self->_oneByOneSuggestions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v8);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v11 = self->_oneByTwoSuggestions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v13);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v16 = self->_twoByTwoSuggestions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v18);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v21 = self->_oneByFourSuggestions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v55;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v55 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v23);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v26 = self->_twoByFourSuggestions;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v72 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v72 count:16];
    }
    while (v28);
  }

  char v31 = (char)self->_has;
  if ((v31 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v31 = (char)self->_has;
    if ((v31 & 8) == 0)
    {
LABEL_44:
      if ((v31 & 0x20) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_45:
  }
    PBDataWriterWriteBOOLField();
LABEL_46:
  if (self->_widgetUniqueId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_uuidOfHighestConfidenceSuggestion) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v32 = self->_fourByFourSuggestions;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v47;
    do
    {
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(v32);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
    }
    while (v34);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v37 = self->_fourByEightSuggestions;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v42 objects:v70 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v43;
    do
    {
      for (juint64_t j = 0; jj != v39; ++jj)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(v37);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v42 objects:v70 count:16];
    }
    while (v39);
  }
}

- (void)copyTo:(uint64_t)a1
{
  v37 = a2;
  if (!a1) {
    goto LABEL_63;
  }
  if ((*(unsigned char *)(a1 + 116) & 4) != 0)
  {
    id v3 = v37;
    *((_DWORD *)v37 + 10) = *(_DWORD *)(a1 + 40);
    *((unsigned char *)v37 + 116) |= 4u;
    if ((*(unsigned char *)(a1 + 116) & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v3 = v37;
  if (*(unsigned char *)(a1 + 116))
  {
LABEL_6:
    v3[1] = *(id *)(a1 + 8);
    *((unsigned char *)v3 + 116) |= 1u;
  }
LABEL_7:
  id v4 = *(void **)(a1 + 96);
  if (v4) {
    -[ATXPBSuggestionLayout setUuidString:]((uint64_t)v37, v4);
  }
  if ([*(id *)(a1 + 56) count])
  {
    if (v37) {
      [v37[7] removeAllObjects];
    }
    uint64_t v5 = [*(id *)(a1 + 56) count];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = -[ATXPBSuggestionLayout oneByOneSuggestionsAtIndex:]((id *)a1, i);
        -[ATXPBSuggestionLayout addOneByOneSuggestions:]((uint64_t)v37, v8);
      }
    }
  }
  if ([*(id *)(a1 + 64) count])
  {
    if (v37) {
      [v37[8] removeAllObjects];
    }
    uint64_t v9 = [*(id *)(a1 + 64) count];
    if (v9)
    {
      uint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = -[ATXPBSuggestionLayout oneByTwoSuggestionsAtIndex:]((id *)a1, j);
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:]((uint64_t)v37, v12);
      }
    }
  }
  if ([*(id *)(a1 + 80) count])
  {
    if (v37) {
      [v37[10] removeAllObjects];
    }
    uint64_t v13 = [*(id *)(a1 + 80) count];
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        v16 = -[ATXPBSuggestionLayout twoByTwoSuggestionsAtIndex:]((id *)a1, k);
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:]((uint64_t)v37, v16);
      }
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    if (v37) {
      [v37[6] removeAllObjects];
    }
    uint64_t v17 = [*(id *)(a1 + 48) count];
    if (v17)
    {
      uint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = -[ATXPBSuggestionLayout oneByFourSuggestionsAtIndex:]((id *)a1, m);
        -[ATXPBSuggestionLayout addOneByFourSuggestions:]((uint64_t)v37, v20);
      }
    }
  }
  if ([*(id *)(a1 + 72) count])
  {
    if (v37) {
      [v37[9] removeAllObjects];
    }
    uint64_t v21 = [*(id *)(a1 + 72) count];
    if (v21)
    {
      uint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = -[ATXPBSuggestionLayout twoByFourSuggestionsAtIndex:]((id *)a1, n);
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:]((uint64_t)v37, v24);
      }
    }
  }
  char v25 = *(unsigned char *)(a1 + 116);
  uint64_t v26 = v37;
  if ((v25 & 0x40) == 0)
  {
    if ((*(unsigned char *)(a1 + 116) & 8) == 0) {
      goto LABEL_41;
    }
LABEL_67:
    *((unsigned char *)v37 + 112) = *(unsigned char *)(a1 + 112);
    *((unsigned char *)v37 + 116) |= 8u;
    if ((*(unsigned char *)(a1 + 116) & 0x20) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  *((unsigned char *)v37 + 115) = *(unsigned char *)(a1 + 115);
  *((unsigned char *)v37 + 116) |= 0x40u;
  char v25 = *(unsigned char *)(a1 + 116);
  if ((v25 & 8) != 0) {
    goto LABEL_67;
  }
LABEL_41:
  if ((v25 & 0x20) != 0)
  {
LABEL_42:
    *((unsigned char *)v37 + 114) = *(unsigned char *)(a1 + 114);
    *((unsigned char *)v37 + 116) |= 0x20u;
  }
LABEL_43:
  uint64_t v27 = *(void **)(a1 + 104);
  if (v27)
  {
    -[ATXPBSuggestionLayout setWidgetUniqueId:]((uint64_t)v37, v27);
    uint64_t v26 = v37;
  }
  if ((*(unsigned char *)(a1 + 116) & 0x10) != 0)
  {
    *((unsigned char *)v26 + 113) = *(unsigned char *)(a1 + 113);
    *((unsigned char *)v26 + 116) |= 0x10u;
  }
  uint64_t v28 = *(void **)(a1 + 88);
  if (v28)
  {
    -[ATXPBSuggestionLayout setUuidOfHighestConfidenceSuggestion:]((uint64_t)v37, v28);
    uint64_t v26 = v37;
  }
  if ((*(unsigned char *)(a1 + 116) & 2) != 0)
  {
    v26[2] = *(id *)(a1 + 16);
    *((unsigned char *)v26 + 116) |= 2u;
  }
  if ([*(id *)(a1 + 32) count])
  {
    if (v37) {
      [v37[4] removeAllObjects];
    }
    uint64_t v29 = [*(id *)(a1 + 32) count];
    if (v29)
    {
      uint64_t v30 = v29;
      for (iuint64_t i = 0; ii != v30; ++ii)
      {
        uint64_t v32 = -[ATXPBSuggestionLayout fourByFourSuggestionsAtIndex:]((id *)a1, ii);
        -[ATXPBSuggestionLayout addFourByFourSuggestions:]((uint64_t)v37, v32);
      }
    }
  }
  if ([*(id *)(a1 + 24) count])
  {
    if (v37) {
      [v37[3] removeAllObjects];
    }
    uint64_t v33 = [*(id *)(a1 + 24) count];
    if (v33)
    {
      uint64_t v34 = v33;
      for (juint64_t j = 0; jj != v34; ++jj)
      {
        v36 = -[ATXPBSuggestionLayout fourByEightSuggestionsAtIndex:]((id *)a1, jj);
        -[ATXPBSuggestionLayout addFourByEightSuggestions:]((uint64_t)v37, v36);
      }
    }
  }
LABEL_63:
}

- (void)setUuidString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)setWidgetUniqueId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setUuidOfHighestConfidenceSuggestion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_layoutType;
    *(unsigned char *)(v5 + 116) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_layoutScore;
    *(unsigned char *)(v5 + 116) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v8;

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v10 = self->_oneByOneSuggestions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v82 objects:v92 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v83 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * i) copyWithZone:a3];
        -[ATXPBSuggestionLayout addOneByOneSuggestions:](v6, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v82 objects:v92 count:16];
    }
    while (v12);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v16 = self->_oneByTwoSuggestions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v79 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * j) copyWithZone:a3];
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:](v6, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v78 objects:v91 count:16];
    }
    while (v18);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v22 = self->_twoByTwoSuggestions;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v74 objects:v90 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v75 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * k) copyWithZone:a3];
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:](v6, v27);
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v74 objects:v90 count:16];
    }
    while (v24);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v28 = self->_oneByFourSuggestions;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v70 objects:v89 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v71;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v71 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * m) copyWithZone:a3];
        -[ATXPBSuggestionLayout addOneByFourSuggestions:](v6, v33);
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v70 objects:v89 count:16];
    }
    while (v30);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v34 = self->_twoByFourSuggestions;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v66 objects:v88 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v67;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v67 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * n) copyWithZone:a3];
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:](v6, v39);
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v66 objects:v88 count:16];
    }
    while (v36);
  }

  char v40 = (char)self->_has;
  if ((v40 & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 115) = self->_isValidForSuggestionsWidget;
    *(unsigned char *)(v6 + 116) |= 0x40u;
    char v40 = (char)self->_has;
    if ((v40 & 8) == 0)
    {
LABEL_42:
      if ((v40 & 0x20) == 0) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_42;
  }
  *(unsigned char *)(v6 + 112) = self->_confidenceWarrantsSnappingOrNPlusOne;
  *(unsigned char *)(v6 + 116) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_43:
    *(unsigned char *)(v6 + 114) = self->_isNPlusOne;
    *(unsigned char *)(v6 + 116) |= 0x20u;
  }
LABEL_44:
  uint64_t v41 = [(NSString *)self->_widgetUniqueId copyWithZone:a3];
  long long v42 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v41;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 113) = self->_isLowConfidenceStackRotationForStaleStack;
    *(unsigned char *)(v6 + 116) |= 0x10u;
  }
  uint64_t v43 = [(NSString *)self->_uuidOfHighestConfidenceSuggestion copyWithZone:a3];
  long long v44 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v43;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_numWidgetsInStack;
    *(unsigned char *)(v6 + 116) |= 2u;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v45 = self->_fourByFourSuggestions;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v62 objects:v87 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v63;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * ii) copyWithZone:a3];
        -[ATXPBSuggestionLayout addFourByFourSuggestions:](v6, v50);
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v62 objects:v87 count:16];
    }
    while (v47);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v51 = self->_fourByEightSuggestions;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v58 objects:v86 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v59;
    do
    {
      for (juint64_t j = 0; jj != v53; ++jj)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * jj), "copyWithZone:", a3, (void)v58);
        -[ATXPBSuggestionLayout addFourByEightSuggestions:](v6, v56);
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v58 objects:v86 count:16];
    }
    while (v53);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0 || self->_layoutType != *((_DWORD *)v4 + 10)) {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_71;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_layoutScore != *((double *)v4 + 1)) {
      goto LABEL_71;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_71;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 12)
    && !-[NSString isEqual:](uuidString, "isEqual:"))
  {
    goto LABEL_71;
  }
  oneByOneSuggestions = self->_oneByOneSuggestions;
  if ((unint64_t)oneByOneSuggestions | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](oneByOneSuggestions, "isEqual:")) {
      goto LABEL_71;
    }
  }
  oneByTwoSuggestions = self->_oneByTwoSuggestions;
  if ((unint64_t)oneByTwoSuggestions | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](oneByTwoSuggestions, "isEqual:")) {
      goto LABEL_71;
    }
  }
  twoByTwoSuggestions = self->_twoByTwoSuggestions;
  if ((unint64_t)twoByTwoSuggestions | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](twoByTwoSuggestions, "isEqual:")) {
      goto LABEL_71;
    }
  }
  oneByFourSuggestions = self->_oneByFourSuggestions;
  if ((unint64_t)oneByFourSuggestions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](oneByFourSuggestions, "isEqual:")) {
      goto LABEL_71;
    }
  }
  twoByFourSuggestions = self->_twoByFourSuggestions;
  if ((unint64_t)twoByFourSuggestions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](twoByFourSuggestions, "isEqual:")) {
      goto LABEL_71;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x40) == 0) {
      goto LABEL_71;
    }
    if (self->_isValidForSuggestionsWidget)
    {
      if (!*((unsigned char *)v4 + 115)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 115))
    {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) == 0) {
      goto LABEL_71;
    }
    if (self->_confidenceWarrantsSnappingOrNPlusOne)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x20) == 0) {
      goto LABEL_71;
    }
    if (self->_isNPlusOne)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x20) != 0)
  {
    goto LABEL_71;
  }
  widgetUniqueId = self->_widgetUniqueId;
  if ((unint64_t)widgetUniqueId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](widgetUniqueId, "isEqual:")) {
      goto LABEL_71;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x10) == 0) {
      goto LABEL_71;
    }
    if (self->_isLowConfidenceStackRotationForStaleStack)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x10) != 0)
  {
    goto LABEL_71;
  }
  uuidOfHighestConfidenceSuggestiouint64_t n = self->_uuidOfHighestConfidenceSuggestion;
  if (!((unint64_t)uuidOfHighestConfidenceSuggestion | *((void *)v4 + 11))) {
    goto LABEL_62;
  }
  if (!-[NSString isEqual:](uuidOfHighestConfidenceSuggestion, "isEqual:"))
  {
LABEL_71:
    char v16 = 0;
    goto LABEL_72;
  }
  char has = (char)self->_has;
LABEL_62:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 2) == 0 || self->_numWidgetsInStack != *((void *)v4 + 2)) {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    goto LABEL_71;
  }
  fourByFourSuggestions = self->_fourByFourSuggestions;
  if ((unint64_t)fourByFourSuggestions | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](fourByFourSuggestions, "isEqual:"))
  {
    goto LABEL_71;
  }
  fourByEightSuggestions = self->_fourByEightSuggestions;
  if ((unint64_t)fourByEightSuggestions | *((void *)v4 + 3)) {
    char v16 = -[NSMutableArray isEqual:](fourByEightSuggestions, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_72:

  return v16;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v25 = 2654435761 * self->_layoutType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v24 = 0;
    goto LABEL_12;
  }
  uint64_t v25 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double layoutScore = self->_layoutScore;
  double v4 = -layoutScore;
  if (layoutScore >= 0.0) {
    double v4 = self->_layoutScore;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  unint64_t v24 = v7;
LABEL_12:
  NSUInteger v23 = [(NSString *)self->_uuidString hash];
  uint64_t v22 = [(NSMutableArray *)self->_oneByOneSuggestions hash];
  uint64_t v21 = [(NSMutableArray *)self->_oneByTwoSuggestions hash];
  uint64_t v20 = [(NSMutableArray *)self->_twoByTwoSuggestions hash];
  uint64_t v8 = [(NSMutableArray *)self->_oneByFourSuggestions hash];
  uint64_t v9 = [(NSMutableArray *)self->_twoByFourSuggestions hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v10 = 2654435761 * self->_isValidForSuggestionsWidget;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v11 = 2654435761 * self->_confidenceWarrantsSnappingOrNPlusOne;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    uint64_t v12 = 2654435761 * self->_isNPlusOne;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v12 = 0;
LABEL_19:
  NSUInteger v13 = [(NSString *)self->_widgetUniqueId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v14 = 2654435761 * self->_isLowConfidenceStackRotationForStaleStack;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_uuidOfHighestConfidenceSuggestion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v16 = 2654435761u * self->_numWidgetsInStack;
  }
  else {
    unint64_t v16 = 0;
  }
  NSUInteger v17 = v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  uint64_t v18 = v16 ^ [(NSMutableArray *)self->_fourByFourSuggestions hash];
  return v17 ^ v18 ^ [(NSMutableArray *)self->_fourByEightSuggestions hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = (id *)v3;
  if (!a1) {
    goto LABEL_70;
  }
  char v5 = v3[116];
  if ((v5 & 4) != 0)
  {
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(unsigned char *)(a1 + 116) |= 4u;
    char v5 = v3[116];
  }
  if (v5)
  {
    *(void *)(a1 + 8) = *((void *)v3 + 1);
    *(unsigned char *)(a1 + 116) |= 1u;
  }
  double v6 = (void *)*((void *)v3 + 12);
  if (v6) {
    -[ATXPBSuggestionLayout setUuidString:](a1, v6);
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v7 = v4[7];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ATXPBSuggestionLayout addOneByOneSuggestions:](a1, *(void **)(*((void *)&v69 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v69 objects:v79 count:16];
    }
    while (v9);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v12 = v4[8];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v66 != v15) {
          objc_enumerationMutation(v12);
        }
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:](a1, *(void **)(*((void *)&v65 + 1) + 8 * j));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v14);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v17 = v4[10];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(v17);
        }
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:](a1, *(void **)(*((void *)&v61 + 1) + 8 * k));
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v61 objects:v77 count:16];
    }
    while (v19);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v22 = v4[6];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v76 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v58 != v25) {
          objc_enumerationMutation(v22);
        }
        -[ATXPBSuggestionLayout addOneByFourSuggestions:](a1, *(void **)(*((void *)&v57 + 1) + 8 * m));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v57 objects:v76 count:16];
    }
    while (v24);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v27 = v4[9];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v53 objects:v75 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v54;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v27);
        }
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:](a1, *(void **)(*((void *)&v53 + 1) + 8 * n));
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v53 objects:v75 count:16];
    }
    while (v29);
  }

  char v32 = *((unsigned char *)v4 + 116);
  if ((v32 & 0x40) == 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) == 0) {
      goto LABEL_45;
    }
LABEL_72:
    *(unsigned char *)(a1 + 112) = *((unsigned char *)v4 + 112);
    *(unsigned char *)(a1 + 116) |= 8u;
    if ((*((unsigned char *)v4 + 116) & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  *(unsigned char *)(a1 + 115) = *((unsigned char *)v4 + 115);
  *(unsigned char *)(a1 + 116) |= 0x40u;
  char v32 = *((unsigned char *)v4 + 116);
  if ((v32 & 8) != 0) {
    goto LABEL_72;
  }
LABEL_45:
  if ((v32 & 0x20) != 0)
  {
LABEL_46:
    *(unsigned char *)(a1 + 114) = *((unsigned char *)v4 + 114);
    *(unsigned char *)(a1 + 116) |= 0x20u;
  }
LABEL_47:
  id v33 = v4[13];
  if (v33) {
    -[ATXPBSuggestionLayout setWidgetUniqueId:](a1, v33);
  }
  if ((*((unsigned char *)v4 + 116) & 0x10) != 0)
  {
    *(unsigned char *)(a1 + 113) = *((unsigned char *)v4 + 113);
    *(unsigned char *)(a1 + 116) |= 0x10u;
  }
  id v34 = v4[11];
  if (v34) {
    -[ATXPBSuggestionLayout setUuidOfHighestConfidenceSuggestion:](a1, v34);
  }
  if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    *(void *)(a1 + 16) = v4[2];
    *(unsigned char *)(a1 + 116) |= 2u;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v35 = v4[4];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v74 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      for (iuint64_t i = 0; ii != v37; ++ii)
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v35);
        }
        -[ATXPBSuggestionLayout addFourByFourSuggestions:](a1, *(void **)(*((void *)&v49 + 1) + 8 * ii));
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v74 count:16];
    }
    while (v37);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v40 = v4[3];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v45 objects:v73 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v46;
    do
    {
      for (juint64_t j = 0; jj != v42; ++jj)
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(v40);
        }
        -[ATXPBSuggestionLayout addFourByEightSuggestions:](a1, *(void **)(*((void *)&v45 + 1) + 8 * jj));
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v45 objects:v73 count:16];
    }
    while (v42);
  }

LABEL_70:
}

- (void)setOneByOneSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setOneByTwoSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setTwoByTwoSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)setOneByFourSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setTwoByFourSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setFourByFourSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setFourByEightSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

@end