@interface SIRINLUEXTERNALMatchInfo
- (BOOL)hasEditDistance;
- (BOOL)hasMatchScore;
- (BOOL)hasMatchSignalBitset;
- (BOOL)hasMatchedAliasCount;
- (BOOL)hasMatchedStopWordCount;
- (BOOL)hasMatchedTokenCount;
- (BOOL)hasMaxAliasCount;
- (BOOL)hasMaxStopWordCount;
- (BOOL)hasMaxTokenCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRICOMMONFloatValue)matchScore;
- (SIRICOMMONUInt32Value)editDistance;
- (SIRICOMMONUInt32Value)matchedAliasCount;
- (SIRICOMMONUInt32Value)matchedStopWordCount;
- (SIRICOMMONUInt32Value)matchedTokenCount;
- (SIRICOMMONUInt32Value)maxAliasCount;
- (SIRICOMMONUInt32Value)maxStopWordCount;
- (SIRICOMMONUInt32Value)maxTokenCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matchedAliasTypesAsString:(int)a3;
- (int)StringAsMatchedAliasTypes:(id)a3;
- (int)matchedAliasTypes;
- (int)matchedAliasTypesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchedAliasTypesCount;
- (unsigned)matchSignalBitset;
- (void)addMatchedAliasTypes:(int)a3;
- (void)clearMatchedAliasTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEditDistance:(id)a3;
- (void)setHasMatchSignalBitset:(BOOL)a3;
- (void)setMatchScore:(id)a3;
- (void)setMatchSignalBitset:(unsigned int)a3;
- (void)setMatchedAliasCount:(id)a3;
- (void)setMatchedAliasTypes:(int *)a3 count:(unint64_t)a4;
- (void)setMatchedStopWordCount:(id)a3;
- (void)setMatchedTokenCount:(id)a3;
- (void)setMaxAliasCount:(id)a3;
- (void)setMaxStopWordCount:(id)a3;
- (void)setMaxTokenCount:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALMatchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTokenCount, 0);
  objc_storeStrong((id *)&self->_maxStopWordCount, 0);
  objc_storeStrong((id *)&self->_maxAliasCount, 0);
  objc_storeStrong((id *)&self->_matchedTokenCount, 0);
  objc_storeStrong((id *)&self->_matchedStopWordCount, 0);
  objc_storeStrong((id *)&self->_matchedAliasCount, 0);
  objc_storeStrong((id *)&self->_matchScore, 0);
  objc_storeStrong((id *)&self->_editDistance, 0);
}

- (void)setMatchedAliasCount:(id)a3
{
}

- (SIRICOMMONUInt32Value)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (void)setMaxAliasCount:(id)a3
{
}

- (SIRICOMMONUInt32Value)maxAliasCount
{
  return self->_maxAliasCount;
}

- (void)setEditDistance:(id)a3
{
}

- (SIRICOMMONUInt32Value)editDistance
{
  return self->_editDistance;
}

- (void)setMatchedStopWordCount:(id)a3
{
}

- (SIRICOMMONUInt32Value)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (void)setMaxStopWordCount:(id)a3
{
}

- (SIRICOMMONUInt32Value)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (void)setMatchedTokenCount:(id)a3
{
}

- (SIRICOMMONUInt32Value)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (void)setMaxTokenCount:(id)a3
{
}

- (SIRICOMMONUInt32Value)maxTokenCount
{
  return self->_maxTokenCount;
}

- (void)setMatchScore:(id)a3
{
}

- (SIRICOMMONFloatValue)matchScore
{
  return self->_matchScore;
}

- (unsigned)matchSignalBitset
{
  return self->_matchSignalBitset;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 104))
  {
    self->_matchSignalBitset = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  matchScore = self->_matchScore;
  uint64_t v7 = v5[5];
  v25 = v5;
  if (matchScore)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SIRICOMMONFloatValue mergeFrom:](matchScore, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SIRINLUEXTERNALMatchInfo setMatchScore:](self, "setMatchScore:");
  }
  v5 = v25;
LABEL_9:
  maxTokenCount = self->_maxTokenCount;
  uint64_t v9 = v5[12];
  if (maxTokenCount)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](maxTokenCount, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SIRINLUEXTERNALMatchInfo setMaxTokenCount:](self, "setMaxTokenCount:");
  }
  v5 = v25;
LABEL_15:
  matchedTokenCount = self->_matchedTokenCount;
  uint64_t v11 = v5[9];
  if (matchedTokenCount)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](matchedTokenCount, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SIRINLUEXTERNALMatchInfo setMatchedTokenCount:](self, "setMatchedTokenCount:");
  }
  v5 = v25;
LABEL_21:
  maxStopWordCount = self->_maxStopWordCount;
  uint64_t v13 = v5[11];
  if (maxStopWordCount)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](maxStopWordCount, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[SIRINLUEXTERNALMatchInfo setMaxStopWordCount:](self, "setMaxStopWordCount:");
  }
  v5 = v25;
LABEL_27:
  matchedStopWordCount = self->_matchedStopWordCount;
  uint64_t v15 = v5[8];
  if (matchedStopWordCount)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](matchedStopWordCount, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[SIRINLUEXTERNALMatchInfo setMatchedStopWordCount:](self, "setMatchedStopWordCount:");
  }
  v5 = v25;
LABEL_33:
  editDistance = self->_editDistance;
  uint64_t v17 = v5[4];
  if (editDistance)
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](editDistance, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[SIRINLUEXTERNALMatchInfo setEditDistance:](self, "setEditDistance:");
  }
  v5 = v25;
LABEL_39:
  maxAliasCount = self->_maxAliasCount;
  uint64_t v19 = v5[10];
  if (maxAliasCount)
  {
    if (!v19) {
      goto LABEL_45;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](maxAliasCount, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_45;
    }
    -[SIRINLUEXTERNALMatchInfo setMaxAliasCount:](self, "setMaxAliasCount:");
  }
  v5 = v25;
LABEL_45:
  matchedAliasCount = self->_matchedAliasCount;
  uint64_t v21 = v5[7];
  if (matchedAliasCount)
  {
    if (!v21) {
      goto LABEL_51;
    }
    -[SIRICOMMONUInt32Value mergeFrom:](matchedAliasCount, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_51;
    }
    -[SIRINLUEXTERNALMatchInfo setMatchedAliasCount:](self, "setMatchedAliasCount:");
  }
  v5 = v25;
LABEL_51:
  uint64_t v22 = [v5 matchedAliasTypesCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (uint64_t i = 0; i != v23; ++i)
      -[SIRINLUEXTERNALMatchInfo addMatchedAliasTypes:](self, "addMatchedAliasTypes:", [v25 matchedAliasTypesAtIndex:i]);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_matchSignalBitset;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SIRICOMMONFloatValue *)self->_matchScore hash] ^ v3;
  unint64_t v5 = [(SIRICOMMONUInt32Value *)self->_maxTokenCount hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRICOMMONUInt32Value *)self->_matchedTokenCount hash];
  unint64_t v7 = [(SIRICOMMONUInt32Value *)self->_maxStopWordCount hash];
  unint64_t v8 = v7 ^ [(SIRICOMMONUInt32Value *)self->_matchedStopWordCount hash];
  unint64_t v9 = v6 ^ v8 ^ [(SIRICOMMONUInt32Value *)self->_editDistance hash];
  unint64_t v10 = [(SIRICOMMONUInt32Value *)self->_maxAliasCount hash];
  unint64_t v11 = v10 ^ [(SIRICOMMONUInt32Value *)self->_matchedAliasCount hash];
  return v9 ^ v11 ^ PBRepeatedInt32Hash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_matchSignalBitset != *((_DWORD *)v4 + 12)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
LABEL_24:
    char IsEqual = 0;
    goto LABEL_25;
  }
  matchScore = self->_matchScore;
  if ((unint64_t)matchScore | *((void *)v4 + 5) && !-[SIRICOMMONFloatValue isEqual:](matchScore, "isEqual:")) {
    goto LABEL_24;
  }
  maxTokenCount = self->_maxTokenCount;
  if ((unint64_t)maxTokenCount | *((void *)v4 + 12))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](maxTokenCount, "isEqual:")) {
      goto LABEL_24;
    }
  }
  matchedTokenCount = self->_matchedTokenCount;
  if ((unint64_t)matchedTokenCount | *((void *)v4 + 9))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](matchedTokenCount, "isEqual:")) {
      goto LABEL_24;
    }
  }
  maxStopWordCount = self->_maxStopWordCount;
  if ((unint64_t)maxStopWordCount | *((void *)v4 + 11))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](maxStopWordCount, "isEqual:")) {
      goto LABEL_24;
    }
  }
  matchedStopWordCount = self->_matchedStopWordCount;
  if ((unint64_t)matchedStopWordCount | *((void *)v4 + 8))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](matchedStopWordCount, "isEqual:")) {
      goto LABEL_24;
    }
  }
  editDistance = self->_editDistance;
  if ((unint64_t)editDistance | *((void *)v4 + 4))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](editDistance, "isEqual:")) {
      goto LABEL_24;
    }
  }
  maxAliasCount = self->_maxAliasCount;
  if ((unint64_t)maxAliasCount | *((void *)v4 + 10))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](maxAliasCount, "isEqual:")) {
      goto LABEL_24;
    }
  }
  matchedAliasCount = self->_matchedAliasCount;
  if ((unint64_t)matchedAliasCount | *((void *)v4 + 7))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](matchedAliasCount, "isEqual:")) {
      goto LABEL_24;
    }
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_25:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_matchSignalBitset;
    *(unsigned char *)(v5 + 104) |= 1u;
  }
  id v7 = [(SIRICOMMONFloatValue *)self->_matchScore copyWithZone:a3];
  unint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(SIRICOMMONUInt32Value *)self->_maxTokenCount copyWithZone:a3];
  unint64_t v10 = (void *)v6[12];
  v6[12] = v9;

  id v11 = [(SIRICOMMONUInt32Value *)self->_matchedTokenCount copyWithZone:a3];
  v12 = (void *)v6[9];
  v6[9] = v11;

  id v13 = [(SIRICOMMONUInt32Value *)self->_maxStopWordCount copyWithZone:a3];
  v14 = (void *)v6[11];
  v6[11] = v13;

  id v15 = [(SIRICOMMONUInt32Value *)self->_matchedStopWordCount copyWithZone:a3];
  v16 = (void *)v6[8];
  v6[8] = v15;

  id v17 = [(SIRICOMMONUInt32Value *)self->_editDistance copyWithZone:a3];
  v18 = (void *)v6[4];
  v6[4] = v17;

  id v19 = [(SIRICOMMONUInt32Value *)self->_maxAliasCount copyWithZone:a3];
  v20 = (void *)v6[10];
  v6[10] = v19;

  id v21 = [(SIRICOMMONUInt32Value *)self->_matchedAliasCount copyWithZone:a3];
  uint64_t v22 = (void *)v6[7];
  v6[7] = v21;

  PBRepeatedInt32Copy();
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_matchSignalBitset;
    *((unsigned char *)v4 + 104) |= 1u;
  }
  id v8 = v4;
  if (self->_matchScore) {
    objc_msgSend(v4, "setMatchScore:");
  }
  if (self->_maxTokenCount) {
    objc_msgSend(v8, "setMaxTokenCount:");
  }
  if (self->_matchedTokenCount) {
    objc_msgSend(v8, "setMatchedTokenCount:");
  }
  if (self->_maxStopWordCount) {
    objc_msgSend(v8, "setMaxStopWordCount:");
  }
  if (self->_matchedStopWordCount) {
    objc_msgSend(v8, "setMatchedStopWordCount:");
  }
  if (self->_editDistance) {
    objc_msgSend(v8, "setEditDistance:");
  }
  if (self->_maxAliasCount) {
    objc_msgSend(v8, "setMaxAliasCount:");
  }
  if (self->_matchedAliasCount) {
    objc_msgSend(v8, "setMatchedAliasCount:");
  }
  if ([(SIRINLUEXTERNALMatchInfo *)self matchedAliasTypesCount])
  {
    [v8 clearMatchedAliasTypes];
    unint64_t v5 = [(SIRINLUEXTERNALMatchInfo *)self matchedAliasTypesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addMatchedAliasTypes:", -[SIRINLUEXTERNALMatchInfo matchedAliasTypesAtIndex:](self, "matchedAliasTypesAtIndex:", i));
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFixed32Field();
    id v4 = v7;
  }
  if (self->_matchScore)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_maxTokenCount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_matchedTokenCount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_maxStopWordCount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_matchedStopWordCount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_editDistance)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_maxAliasCount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_matchedAliasCount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  p_matchedAliasTypes = &self->_matchedAliasTypes;
  if (p_matchedAliasTypes->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_matchedAliasTypes->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALMatchInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_matchSignalBitset];
    [v3 setObject:v4 forKey:@"match_signal_bitset"];
  }
  matchScore = self->_matchScore;
  if (matchScore)
  {
    unint64_t v6 = [(SIRICOMMONFloatValue *)matchScore dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"match_score"];
  }
  maxTokenCount = self->_maxTokenCount;
  if (maxTokenCount)
  {
    id v8 = [(SIRICOMMONUInt32Value *)maxTokenCount dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"max_token_count"];
  }
  matchedTokenCount = self->_matchedTokenCount;
  if (matchedTokenCount)
  {
    unint64_t v10 = [(SIRICOMMONUInt32Value *)matchedTokenCount dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"matched_token_count"];
  }
  maxStopWordCount = self->_maxStopWordCount;
  if (maxStopWordCount)
  {
    v12 = [(SIRICOMMONUInt32Value *)maxStopWordCount dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"max_stop_word_count"];
  }
  matchedStopWordCount = self->_matchedStopWordCount;
  if (matchedStopWordCount)
  {
    v14 = [(SIRICOMMONUInt32Value *)matchedStopWordCount dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"matched_stop_word_count"];
  }
  editDistance = self->_editDistance;
  if (editDistance)
  {
    v16 = [(SIRICOMMONUInt32Value *)editDistance dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"edit_distance"];
  }
  maxAliasCount = self->_maxAliasCount;
  if (maxAliasCount)
  {
    v18 = [(SIRICOMMONUInt32Value *)maxAliasCount dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"max_alias_count"];
  }
  matchedAliasCount = self->_matchedAliasCount;
  if (matchedAliasCount)
  {
    v20 = [(SIRICOMMONUInt32Value *)matchedAliasCount dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"matched_alias_count"];
  }
  p_matchedAliasTypes = &self->_matchedAliasTypes;
  if (self->_matchedAliasTypes.count)
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (p_matchedAliasTypes->count)
    {
      unint64_t v23 = 0;
      do
      {
        uint64_t v24 = p_matchedAliasTypes->list[v23];
        if (v24 >= 0xC)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_matchedAliasTypes->list[v23]);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = off_1E6579050[v24];
        }
        [v22 addObject:v25];

        ++v23;
      }
      while (v23 < p_matchedAliasTypes->count);
    }
    [v3 setObject:v22 forKey:@"matched_alias_types"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALMatchInfo;
  id v4 = [(SIRINLUEXTERNALMatchInfo *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALMatchInfo *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsMatchedAliasTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALIAS_TYPE_UNDEFINED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_HOME_AUTOMATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_SYNONYM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_TRANSLITERATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_EXPANDED_EMOJI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_CONTACT_RELATIONSHIP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_CONTACT_HYPOCORISM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_CONTACT_HANDLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_PREFIX_MATCHING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_DIACRITIC_REMOVAL"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_PHONETIC_MATCHER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ALIAS_TYPE_LEMMATIZATION"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)matchedAliasTypesAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6579050[a3];
  }
  return v3;
}

- (void)setMatchedAliasTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)matchedAliasTypesAtIndex:(unint64_t)a3
{
  p_matchedAliasTypes = &self->_matchedAliasTypes;
  unint64_t count = self->_matchedAliasTypes.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_matchedAliasTypes->list[a3];
}

- (void)addMatchedAliasTypes:(int)a3
{
}

- (void)clearMatchedAliasTypes
{
}

- (int)matchedAliasTypes
{
  return self->_matchedAliasTypes.list;
}

- (unint64_t)matchedAliasTypesCount
{
  return self->_matchedAliasTypes.count;
}

- (BOOL)hasMatchedAliasCount
{
  return self->_matchedAliasCount != 0;
}

- (BOOL)hasMaxAliasCount
{
  return self->_maxAliasCount != 0;
}

- (BOOL)hasEditDistance
{
  return self->_editDistance != 0;
}

- (BOOL)hasMatchedStopWordCount
{
  return self->_matchedStopWordCount != 0;
}

- (BOOL)hasMaxStopWordCount
{
  return self->_maxStopWordCount != 0;
}

- (BOOL)hasMatchedTokenCount
{
  return self->_matchedTokenCount != 0;
}

- (BOOL)hasMaxTokenCount
{
  return self->_maxTokenCount != 0;
}

- (BOOL)hasMatchScore
{
  return self->_matchScore != 0;
}

- (BOOL)hasMatchSignalBitset
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMatchSignalBitset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMatchSignalBitset:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_matchSignalBitset = a3;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUEXTERNALMatchInfo;
  [(SIRINLUEXTERNALMatchInfo *)&v3 dealloc];
}

@end