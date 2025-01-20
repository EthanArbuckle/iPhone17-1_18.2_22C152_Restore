@interface COMAPPLEPROACTIVEGMSGMSInferenceEvent
- (BOOL)hasAssetLoadAndTtftCombinedMillis;
- (BOOL)hasExtendInferenceMillis;
- (BOOL)hasInferenceTimeMillis;
- (BOOL)hasInputTokensCount;
- (BOOL)hasOutputTokensCount;
- (BOOL)hasRequestType;
- (BOOL)hasSdDraftModelInferenceCallCount;
- (BOOL)hasSdDraftModelTotalLatencyMillis;
- (BOOL)hasSdDraftOutputTokensCount;
- (BOOL)hasSdDraftTokenAcceptanceRate;
- (BOOL)hasSdSpeculationSuccessRate;
- (BOOL)hasSdTargetModelInferenceCallCount;
- (BOOL)hasSdTargetModelTotalLatencyMillis;
- (BOOL)hasSdTinyModelInferenceCallCount;
- (BOOL)hasSdTinyModelTotalLatencyMillis;
- (BOOL)hasSdTinyTokenAcceptanceRate;
- (BOOL)hasSdTotalOutputTokensCount;
- (BOOL)hasTimeToFirstTokenMillis;
- (BOOL)hasTokensPerSecond;
- (BOOL)hasTotalLatencyMillis;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)assetLoadAndTtftCombinedMillis;
- (double)extendInferenceMillis;
- (double)inferenceTimeMillis;
- (double)sdDraftModelTotalLatencyMillis;
- (double)sdDraftTokenAcceptanceRate;
- (double)sdSpeculationSuccessRate;
- (double)sdTargetModelTotalLatencyMillis;
- (double)sdTinyModelTotalLatencyMillis;
- (double)sdTinyTokenAcceptanceRate;
- (double)timeToFirstTokenMillis;
- (double)tokensPerSecond;
- (double)totalLatencyMillis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestTypeAsString:(int)a3;
- (int)StringAsRequestType:(id)a3;
- (int)requestType;
- (int64_t)inputTokensCount;
- (int64_t)outputTokensCount;
- (int64_t)sdDraftModelInferenceCallCount;
- (int64_t)sdDraftOutputTokensCount;
- (int64_t)sdTargetModelInferenceCallCount;
- (int64_t)sdTinyModelInferenceCallCount;
- (int64_t)sdTotalOutputTokensCount;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetLoadAndTtftCombinedMillis:(double)a3;
- (void)setExtendInferenceMillis:(double)a3;
- (void)setHasAssetLoadAndTtftCombinedMillis:(BOOL)a3;
- (void)setHasExtendInferenceMillis:(BOOL)a3;
- (void)setHasInferenceTimeMillis:(BOOL)a3;
- (void)setHasInputTokensCount:(BOOL)a3;
- (void)setHasOutputTokensCount:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setHasSdDraftModelInferenceCallCount:(BOOL)a3;
- (void)setHasSdDraftModelTotalLatencyMillis:(BOOL)a3;
- (void)setHasSdDraftOutputTokensCount:(BOOL)a3;
- (void)setHasSdDraftTokenAcceptanceRate:(BOOL)a3;
- (void)setHasSdSpeculationSuccessRate:(BOOL)a3;
- (void)setHasSdTargetModelInferenceCallCount:(BOOL)a3;
- (void)setHasSdTargetModelTotalLatencyMillis:(BOOL)a3;
- (void)setHasSdTinyModelInferenceCallCount:(BOOL)a3;
- (void)setHasSdTinyModelTotalLatencyMillis:(BOOL)a3;
- (void)setHasSdTinyTokenAcceptanceRate:(BOOL)a3;
- (void)setHasSdTotalOutputTokensCount:(BOOL)a3;
- (void)setHasTimeToFirstTokenMillis:(BOOL)a3;
- (void)setHasTokensPerSecond:(BOOL)a3;
- (void)setHasTotalLatencyMillis:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInferenceTimeMillis:(double)a3;
- (void)setInputTokensCount:(int64_t)a3;
- (void)setOutputTokensCount:(int64_t)a3;
- (void)setRequestType:(int)a3;
- (void)setSdDraftModelInferenceCallCount:(int64_t)a3;
- (void)setSdDraftModelTotalLatencyMillis:(double)a3;
- (void)setSdDraftOutputTokensCount:(int64_t)a3;
- (void)setSdDraftTokenAcceptanceRate:(double)a3;
- (void)setSdSpeculationSuccessRate:(double)a3;
- (void)setSdTargetModelInferenceCallCount:(int64_t)a3;
- (void)setSdTargetModelTotalLatencyMillis:(double)a3;
- (void)setSdTinyModelInferenceCallCount:(int64_t)a3;
- (void)setSdTinyModelTotalLatencyMillis:(double)a3;
- (void)setSdTinyTokenAcceptanceRate:(double)a3;
- (void)setSdTotalOutputTokensCount:(int64_t)a3;
- (void)setTimeToFirstTokenMillis:(double)a3;
- (void)setTokensPerSecond:(double)a3;
- (void)setTotalLatencyMillis:(double)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEPROACTIVEGMSGMSInferenceEvent

- (double)sdTargetModelTotalLatencyMillis
{
  return self->_sdTargetModelTotalLatencyMillis;
}

- (double)sdDraftModelTotalLatencyMillis
{
  return self->_sdDraftModelTotalLatencyMillis;
}

- (double)sdTinyModelTotalLatencyMillis
{
  return self->_sdTinyModelTotalLatencyMillis;
}

- (int64_t)sdTotalOutputTokensCount
{
  return self->_sdTotalOutputTokensCount;
}

- (int64_t)sdDraftOutputTokensCount
{
  return self->_sdDraftOutputTokensCount;
}

- (double)sdSpeculationSuccessRate
{
  return self->_sdSpeculationSuccessRate;
}

- (double)sdTinyTokenAcceptanceRate
{
  return self->_sdTinyTokenAcceptanceRate;
}

- (double)sdDraftTokenAcceptanceRate
{
  return self->_sdDraftTokenAcceptanceRate;
}

- (int64_t)sdTargetModelInferenceCallCount
{
  return self->_sdTargetModelInferenceCallCount;
}

- (int64_t)sdDraftModelInferenceCallCount
{
  return self->_sdDraftModelInferenceCallCount;
}

- (int64_t)sdTinyModelInferenceCallCount
{
  return self->_sdTinyModelInferenceCallCount;
}

- (double)assetLoadAndTtftCombinedMillis
{
  return self->_assetLoadAndTtftCombinedMillis;
}

- (double)extendInferenceMillis
{
  return self->_extendInferenceMillis;
}

- (double)inferenceTimeMillis
{
  return self->_inferenceTimeMillis;
}

- (int64_t)version
{
  return self->_version;
}

- (double)tokensPerSecond
{
  return self->_tokensPerSecond;
}

- (double)timeToFirstTokenMillis
{
  return self->_timeToFirstTokenMillis;
}

- (double)totalLatencyMillis
{
  return self->_totalLatencyMillis;
}

- (int64_t)outputTokensCount
{
  return self->_outputTokensCount;
}

- (int64_t)inputTokensCount
{
  return self->_inputTokensCount;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x100000) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v5 = *((_DWORD *)v4 + 43);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_inputTokensCount = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_outputTokensCount = *((void *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x40000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_totalLatencyMillis = *((double *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x10000) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_timeToFirstTokenMillis = *((double *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x20000) == 0)
  {
LABEL_7:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_tokensPerSecond = *((double *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x80000) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_version = *((void *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_inferenceTimeMillis = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_extendInferenceMillis = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_assetLoadAndTtftCombinedMillis = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_sdTinyModelInferenceCallCount = *((void *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_sdDraftModelInferenceCallCount = *((void *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_sdTargetModelInferenceCallCount = *((void *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_sdDraftTokenAcceptanceRate = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_sdTinyTokenAcceptanceRate = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_sdSpeculationSuccessRate = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x80) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_sdDraftOutputTokensCount = *((void *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x8000) == 0)
  {
LABEL_19:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_sdTotalOutputTokensCount = *((void *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x2000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_sdTinyModelTotalLatencyMillis = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x40) == 0)
  {
LABEL_21:
    if ((v5 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  self->_sdDraftModelTotalLatencyMillis = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v4 + 43) & 0x800) != 0)
  {
LABEL_22:
    self->_sdTargetModelTotalLatencyMillis = *((double *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_23:
}

- (unint64_t)hash
{
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v79 = 2654435761 * self->_requestType;
    if ((*(unsigned char *)&has & 8) != 0)
    {
LABEL_3:
      uint64_t v78 = 2654435761 * self->_inputTokensCount;
      if ((*(unsigned char *)&has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v77 = 0;
      if ((*(_DWORD *)&has & 0x40000) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v79 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v78 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v77 = 2654435761 * self->_outputTokensCount;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double totalLatencyMillis = self->_totalLatencyMillis;
  double v5 = -totalLatencyMillis;
  if (totalLatencyMillis >= 0.0) {
    double v5 = self->_totalLatencyMillis;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_15:
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    double timeToFirstTokenMillis = self->_timeToFirstTokenMillis;
    double v11 = -timeToFirstTokenMillis;
    if (timeToFirstTokenMillis >= 0.0) {
      double v11 = self->_timeToFirstTokenMillis;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    double tokensPerSecond = self->_tokensPerSecond;
    double v16 = -tokensPerSecond;
    if (tokensPerSecond >= 0.0) {
      double v16 = self->_tokensPerSecond;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    uint64_t v76 = 2654435761 * self->_version;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_33;
    }
LABEL_38:
    unint64_t v23 = 0;
    goto LABEL_41;
  }
  uint64_t v76 = 0;
  if ((*(unsigned char *)&has & 4) == 0) {
    goto LABEL_38;
  }
LABEL_33:
  double inferenceTimeMillis = self->_inferenceTimeMillis;
  double v20 = -inferenceTimeMillis;
  if (inferenceTimeMillis >= 0.0) {
    double v20 = self->_inferenceTimeMillis;
  }
  long double v21 = floor(v20 + 0.5);
  double v22 = (v20 - v21) * 1.84467441e19;
  unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0) {
      v23 += (unint64_t)v22;
    }
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_41:
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double extendInferenceMillis = self->_extendInferenceMillis;
    double v26 = -extendInferenceMillis;
    if (extendInferenceMillis >= 0.0) {
      double v26 = self->_extendInferenceMillis;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double assetLoadAndTtftCombinedMillis = self->_assetLoadAndTtftCombinedMillis;
    double v31 = -assetLoadAndTtftCombinedMillis;
    if (assetLoadAndTtftCombinedMillis >= 0.0) {
      double v31 = self->_assetLoadAndTtftCombinedMillis;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    uint64_t v73 = 2654435761 * self->_sdTinyModelInferenceCallCount;
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
LABEL_59:
      uint64_t v72 = 2654435761 * self->_sdDraftModelInferenceCallCount;
      if ((*(_WORD *)&has & 0x400) != 0) {
        goto LABEL_60;
      }
LABEL_67:
      uint64_t v71 = 0;
      if ((*(_WORD *)&has & 0x100) != 0) {
        goto LABEL_61;
      }
LABEL_68:
      unint64_t v38 = 0;
      goto LABEL_71;
    }
  }
  else
  {
    uint64_t v73 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_59;
    }
  }
  uint64_t v72 = 0;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_67;
  }
LABEL_60:
  uint64_t v71 = 2654435761 * self->_sdTargetModelInferenceCallCount;
  if ((*(_WORD *)&has & 0x100) == 0) {
    goto LABEL_68;
  }
LABEL_61:
  double sdDraftTokenAcceptanceRate = self->_sdDraftTokenAcceptanceRate;
  double v35 = -sdDraftTokenAcceptanceRate;
  if (sdDraftTokenAcceptanceRate >= 0.0) {
    double v35 = self->_sdDraftTokenAcceptanceRate;
  }
  long double v36 = floor(v35 + 0.5);
  double v37 = (v35 - v36) * 1.84467441e19;
  unint64_t v38 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
  if (v37 >= 0.0)
  {
    if (v37 > 0.0) {
      v38 += (unint64_t)v37;
    }
  }
  else
  {
    v38 -= (unint64_t)fabs(v37);
  }
LABEL_71:
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
    unint64_t v80 = 0;
    goto LABEL_80;
  }
  double sdTinyTokenAcceptanceRate = self->_sdTinyTokenAcceptanceRate;
  double v40 = -sdTinyTokenAcceptanceRate;
  if (sdTinyTokenAcceptanceRate >= 0.0) {
    double v40 = self->_sdTinyTokenAcceptanceRate;
  }
  long double v41 = floor(v40 + 0.5);
  double v42 = (v40 - v41) * 1.84467441e19;
  double v43 = fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    unint64_t v80 = 2654435761u * (unint64_t)v43;
    if (v42 <= 0.0) {
      goto LABEL_80;
    }
    unint64_t v44 = v80 + (unint64_t)v42;
  }
  else
  {
    unint64_t v44 = 2654435761u * (unint64_t)v43 - (unint64_t)fabs(v42);
  }
  unint64_t v80 = v44;
LABEL_80:
  unint64_t v75 = v23;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double sdSpeculationSuccessRate = self->_sdSpeculationSuccessRate;
    double v47 = -sdSpeculationSuccessRate;
    if (sdSpeculationSuccessRate >= 0.0) {
      double v47 = self->_sdSpeculationSuccessRate;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v74 = v8;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
    uint64_t v70 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_90;
    }
LABEL_96:
    uint64_t v69 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_91;
    }
LABEL_97:
    unint64_t v55 = v38;
    unint64_t v54 = 0;
    goto LABEL_100;
  }
  uint64_t v70 = 2654435761 * self->_sdDraftOutputTokensCount;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_96;
  }
LABEL_90:
  uint64_t v69 = 2654435761 * self->_sdTotalOutputTokensCount;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_97;
  }
LABEL_91:
  double sdTinyModelTotalLatencyMillis = self->_sdTinyModelTotalLatencyMillis;
  double v51 = -sdTinyModelTotalLatencyMillis;
  if (sdTinyModelTotalLatencyMillis >= 0.0) {
    double v51 = self->_sdTinyModelTotalLatencyMillis;
  }
  long double v52 = floor(v51 + 0.5);
  double v53 = (v51 - v52) * 1.84467441e19;
  unint64_t v54 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
  unint64_t v55 = v38;
  if (v53 >= 0.0)
  {
    if (v53 > 0.0) {
      v54 += (unint64_t)v53;
    }
  }
  else
  {
    v54 -= (unint64_t)fabs(v53);
  }
LABEL_100:
  unint64_t v56 = v14;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    double sdDraftModelTotalLatencyMillis = self->_sdDraftModelTotalLatencyMillis;
    double v59 = -sdDraftModelTotalLatencyMillis;
    if (sdDraftModelTotalLatencyMillis >= 0.0) {
      double v59 = self->_sdDraftModelTotalLatencyMillis;
    }
    long double v60 = floor(v59 + 0.5);
    double v61 = (v59 - v60) * 1.84467441e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    unint64_t v57 = 0;
  }
  if ((*(_WORD *)&has & 0x800) == 0)
  {
    unint64_t v62 = 0;
LABEL_114:
    unint64_t v67 = v80;
    return v78 ^ v79 ^ v77 ^ v74 ^ v9 ^ v56 ^ v76 ^ v75 ^ v24 ^ v29 ^ v73 ^ v72 ^ v71 ^ v55 ^ v67 ^ v45 ^ v70 ^ v69 ^ v54 ^ v57 ^ v62;
  }
  double sdTargetModelTotalLatencyMillis = self->_sdTargetModelTotalLatencyMillis;
  double v64 = -sdTargetModelTotalLatencyMillis;
  if (sdTargetModelTotalLatencyMillis >= 0.0) {
    double v64 = self->_sdTargetModelTotalLatencyMillis;
  }
  long double v65 = floor(v64 + 0.5);
  double v66 = (v64 - v65) * 1.84467441e19;
  unint64_t v62 = 2654435761u * (unint64_t)fmod(v65, 1.84467441e19);
  if (v66 < 0.0)
  {
    v62 -= (unint64_t)fabs(v66);
    goto LABEL_114;
  }
  unint64_t v67 = v80;
  if (v66 > 0.0) {
    v62 += (unint64_t)v66;
  }
  return v78 ^ v79 ^ v77 ^ v74 ^ v9 ^ v56 ^ v76 ^ v75 ^ v24 ^ v29 ^ v73 ^ v72 ^ v71 ^ v55 ^ v67 ^ v45 ^ v70 ^ v69 ^ v54 ^ v57 ^ v62;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_107;
  }
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  int v6 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_requestType != *((_DWORD *)v4 + 42)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
LABEL_107:
    BOOL v7 = 0;
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_inputTokensCount != *((void *)v4 + 4)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_outputTokensCount != *((void *)v4 + 5)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_totalLatencyMillis != *((double *)v4 + 19)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_timeToFirstTokenMillis != *((double *)v4 + 17)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_tokensPerSecond != *((double *)v4 + 18)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_version != *((void *)v4 + 20)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_inferenceTimeMillis != *((double *)v4 + 3)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_extendInferenceMillis != *((double *)v4 + 2)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_107;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_assetLoadAndTtftCombinedMillis != *((double *)v4 + 1)) {
      goto LABEL_107;
    }
  }
  else if (v6)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_sdTinyModelInferenceCallCount != *((void *)v4 + 13)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_sdDraftModelInferenceCallCount != *((void *)v4 + 6)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_sdTargetModelInferenceCallCount != *((void *)v4 + 11)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_sdDraftTokenAcceptanceRate != *((double *)v4 + 9)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_sdTinyTokenAcceptanceRate != *((double *)v4 + 15)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_sdSpeculationSuccessRate != *((double *)v4 + 10)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sdDraftOutputTokensCount != *((void *)v4 + 8)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_sdTotalOutputTokensCount != *((void *)v4 + 16)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sdTinyModelTotalLatencyMillis != *((double *)v4 + 14)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_sdDraftModelTotalLatencyMillis != *((double *)v4 + 7)) {
      goto LABEL_107;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_sdTargetModelTotalLatencyMillis != *((double *)v4 + 12)) {
      goto LABEL_107;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 43) & 0x800) == 0;
  }
LABEL_108:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *((_DWORD *)result + 42) = self->_requestType;
    *((_DWORD *)result + 43) |= 0x100000u;
    $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_inputTokensCount;
  *((_DWORD *)result + 43) |= 8u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 5) = self->_outputTokensCount;
  *((_DWORD *)result + 43) |= 0x10u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 19) = *(void *)&self->_totalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x40000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 17) = *(void *)&self->_timeToFirstTokenMillis;
  *((_DWORD *)result + 43) |= 0x10000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 18) = *(void *)&self->_tokensPerSecond;
  *((_DWORD *)result + 43) |= 0x20000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 20) = self->_version;
  *((_DWORD *)result + 43) |= 0x80000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)result + 3) = *(void *)&self->_inferenceTimeMillis;
  *((_DWORD *)result + 43) |= 4u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)result + 2) = *(void *)&self->_extendInferenceMillis;
  *((_DWORD *)result + 43) |= 2u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 1) = *(void *)&self->_assetLoadAndTtftCombinedMillis;
  *((_DWORD *)result + 43) |= 1u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 13) = self->_sdTinyModelInferenceCallCount;
  *((_DWORD *)result + 43) |= 0x1000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 6) = self->_sdDraftModelInferenceCallCount;
  *((_DWORD *)result + 43) |= 0x20u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 11) = self->_sdTargetModelInferenceCallCount;
  *((_DWORD *)result + 43) |= 0x400u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 9) = *(void *)&self->_sdDraftTokenAcceptanceRate;
  *((_DWORD *)result + 43) |= 0x100u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 15) = *(void *)&self->_sdTinyTokenAcceptanceRate;
  *((_DWORD *)result + 43) |= 0x4000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 10) = *(void *)&self->_sdSpeculationSuccessRate;
  *((_DWORD *)result + 43) |= 0x200u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 8) = self->_sdDraftOutputTokensCount;
  *((_DWORD *)result + 43) |= 0x80u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 16) = self->_sdTotalOutputTokensCount;
  *((_DWORD *)result + 43) |= 0x8000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 14) = *(void *)&self->_sdTinyModelTotalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x2000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      return result;
    }
    goto LABEL_22;
  }
LABEL_43:
  *((void *)result + 7) = *(void *)&self->_sdDraftModelTotalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_22:
  *((void *)result + 12) = *(void *)&self->_sdTargetModelTotalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x800u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v4[42] = self->_requestType;
    v4[43] |= 0x100000u;
    $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 4) = self->_inputTokensCount;
  v4[43] |= 8u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 5) = self->_outputTokensCount;
  v4[43] |= 0x10u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v4 + 19) = *(void *)&self->_totalLatencyMillis;
  v4[43] |= 0x40000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 17) = *(void *)&self->_timeToFirstTokenMillis;
  v4[43] |= 0x10000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v4 + 18) = *(void *)&self->_tokensPerSecond;
  v4[43] |= 0x20000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 20) = self->_version;
  v4[43] |= 0x80000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)v4 + 3) = *(void *)&self->_inferenceTimeMillis;
  v4[43] |= 4u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 2) = *(void *)&self->_extendInferenceMillis;
  v4[43] |= 2u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 1) = *(void *)&self->_assetLoadAndTtftCombinedMillis;
  v4[43] |= 1u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v4 + 13) = self->_sdTinyModelInferenceCallCount;
  v4[43] |= 0x1000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)v4 + 6) = self->_sdDraftModelInferenceCallCount;
  v4[43] |= 0x20u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)v4 + 11) = self->_sdTargetModelInferenceCallCount;
  v4[43] |= 0x400u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)v4 + 9) = *(void *)&self->_sdDraftTokenAcceptanceRate;
  v4[43] |= 0x100u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v4 + 15) = *(void *)&self->_sdTinyTokenAcceptanceRate;
  v4[43] |= 0x4000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)v4 + 10) = *(void *)&self->_sdSpeculationSuccessRate;
  v4[43] |= 0x200u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)v4 + 8) = self->_sdDraftOutputTokensCount;
  v4[43] |= 0x80u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)v4 + 16) = self->_sdTotalOutputTokensCount;
  v4[43] |= 0x8000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)v4 + 14) = *(void *)&self->_sdTinyModelTotalLatencyMillis;
  v4[43] |= 0x2000u;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  *((void *)v4 + 7) = *(void *)&self->_sdDraftModelTotalLatencyMillis;
  v4[43] |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_22:
    *((void *)v4 + 12) = *(void *)&self->_sdTargetModelTotalLatencyMillis;
    v4[43] |= 0x800u;
  }
LABEL_23:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_22:
  }
    PBDataWriterWriteDoubleField();
LABEL_23:
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSInferenceEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t requestType = self->_requestType;
    if (requestType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestType);
      int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v6 = off_1E56C4460[requestType];
    }
    [v3 setObject:v6 forKey:@"requestType"];

    $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    unint64_t v9 = [NSNumber numberWithLongLong:self->_inputTokensCount];
    [v3 setObject:v9 forKey:@"inputTokensCount"];

    $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&has & 0x40000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_8;
  }
  v10 = [NSNumber numberWithLongLong:self->_outputTokensCount];
  [v3 setObject:v10 forKey:@"outputTokensCount"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  double v11 = [NSNumber numberWithDouble:self->_totalLatencyMillis];
  [v3 setObject:v11 forKey:@"totalLatencyMillis"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  long double v12 = [NSNumber numberWithDouble:self->_timeToFirstTokenMillis];
  [v3 setObject:v12 forKey:@"timeToFirstTokenMillis"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  double v13 = [NSNumber numberWithDouble:self->_tokensPerSecond];
  [v3 setObject:v13 forKey:@"tokensPerSecond"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v14 = [NSNumber numberWithLongLong:self->_version];
  [v3 setObject:v14 forKey:@"version"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  v15 = [NSNumber numberWithDouble:self->_inferenceTimeMillis];
  [v3 setObject:v15 forKey:@"inferenceTimeMillis"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  double v16 = [NSNumber numberWithDouble:self->_extendInferenceMillis];
  [v3 setObject:v16 forKey:@"extendInferenceMillis"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  long double v17 = [NSNumber numberWithDouble:self->_assetLoadAndTtftCombinedMillis];
  [v3 setObject:v17 forKey:@"assetLoadAndTtftCombinedMillis"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  double v18 = [NSNumber numberWithLongLong:self->_sdTinyModelInferenceCallCount];
  [v3 setObject:v18 forKey:@"sdTinyModelInferenceCallCount"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  v19 = [NSNumber numberWithLongLong:self->_sdDraftModelInferenceCallCount];
  [v3 setObject:v19 forKey:@"sdDraftModelInferenceCallCount"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  double v20 = [NSNumber numberWithLongLong:self->_sdTargetModelInferenceCallCount];
  [v3 setObject:v20 forKey:@"sdTargetModelInferenceCallCount"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  long double v21 = [NSNumber numberWithDouble:self->_sdDraftTokenAcceptanceRate];
  [v3 setObject:v21 forKey:@"sdDraftTokenAcceptanceRate"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  double v22 = [NSNumber numberWithDouble:self->_sdTinyTokenAcceptanceRate];
  [v3 setObject:v22 forKey:@"sdTinyTokenAcceptanceRate"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v23 = [NSNumber numberWithDouble:self->_sdSpeculationSuccessRate];
  [v3 setObject:v23 forKey:@"sdSpeculationSuccessRate"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v24 = [NSNumber numberWithLongLong:self->_sdDraftOutputTokensCount];
  [v3 setObject:v24 forKey:@"sdDraftOutputTokensCount"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_46:
  v25 = [NSNumber numberWithLongLong:self->_sdTotalOutputTokensCount];
  [v3 setObject:v25 forKey:@"sdTotalOutputTokensCount"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_48;
  }
LABEL_47:
  double v26 = [NSNumber numberWithDouble:self->_sdTinyModelTotalLatencyMillis];
  [v3 setObject:v26 forKey:@"sdTinyModelTotalLatencyMillis"];

  $8B3226069B0D9AEB47C44336741E4A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_48:
  long double v27 = [NSNumber numberWithDouble:self->_sdDraftModelTotalLatencyMillis];
  [v3 setObject:v27 forKey:@"sdDraftModelTotalLatencyMillis"];

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_26:
    BOOL v7 = [NSNumber numberWithDouble:self->_sdTargetModelTotalLatencyMillis];
    [v3 setObject:v7 forKey:@"sdTargetModelTotalLatencyMillis"];
  }
LABEL_27:

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSInferenceEvent;
  id v4 = [(COMAPPLEPROACTIVEGMSGMSInferenceEvent *)&v8 description];
  id v5 = [(COMAPPLEPROACTIVEGMSGMSInferenceEvent *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSdTargetModelTotalLatencyMillis
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasSdTargetModelTotalLatencyMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setSdTargetModelTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_double sdTargetModelTotalLatencyMillis = a3;
}

- (BOOL)hasSdDraftModelTotalLatencyMillis
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasSdDraftModelTotalLatencyMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)setSdDraftModelTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_double sdDraftModelTotalLatencyMillis = a3;
}

- (BOOL)hasSdTinyModelTotalLatencyMillis
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasSdTinyModelTotalLatencyMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)setSdTinyModelTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_double sdTinyModelTotalLatencyMillis = a3;
}

- (BOOL)hasSdTotalOutputTokensCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasSdTotalOutputTokensCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)setSdTotalOutputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_sdTotalOutputTokensCount = a3;
}

- (BOOL)hasSdDraftOutputTokensCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasSdDraftOutputTokensCount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)setSdDraftOutputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sdDraftOutputTokensCount = a3;
}

- (BOOL)hasSdSpeculationSuccessRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasSdSpeculationSuccessRate:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)setSdSpeculationSuccessRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_double sdSpeculationSuccessRate = a3;
}

- (BOOL)hasSdTinyTokenAcceptanceRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasSdTinyTokenAcceptanceRate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)setSdTinyTokenAcceptanceRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_double sdTinyTokenAcceptanceRate = a3;
}

- (BOOL)hasSdDraftTokenAcceptanceRate
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasSdDraftTokenAcceptanceRate:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setSdDraftTokenAcceptanceRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_double sdDraftTokenAcceptanceRate = a3;
}

- (BOOL)hasSdTargetModelInferenceCallCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasSdTargetModelInferenceCallCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)setSdTargetModelInferenceCallCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_sdTargetModelInferenceCallCount = a3;
}

- (BOOL)hasSdDraftModelInferenceCallCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasSdDraftModelInferenceCallCount:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)setSdDraftModelInferenceCallCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_sdDraftModelInferenceCallCount = a3;
}

- (BOOL)hasSdTinyModelInferenceCallCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasSdTinyModelInferenceCallCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setSdTinyModelInferenceCallCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sdTinyModelInferenceCallCount = a3;
}

- (BOOL)hasAssetLoadAndTtftCombinedMillis
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAssetLoadAndTtftCombinedMillis:(BOOL)a3
{
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setAssetLoadAndTtftCombinedMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_double assetLoadAndTtftCombinedMillis = a3;
}

- (BOOL)hasExtendInferenceMillis
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasExtendInferenceMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)setExtendInferenceMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_double extendInferenceMillis = a3;
}

- (BOOL)hasInferenceTimeMillis
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasInferenceTimeMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)setInferenceTimeMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_double inferenceTimeMillis = a3;
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)setVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_version = a3;
}

- (BOOL)hasTokensPerSecond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasTokensPerSecond:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)setTokensPerSecond:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_double tokensPerSecond = a3;
}

- (BOOL)hasTimeToFirstTokenMillis
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasTimeToFirstTokenMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setTimeToFirstTokenMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_double timeToFirstTokenMillis = a3;
}

- (BOOL)hasTotalLatencyMillis
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasTotalLatencyMillis:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_double totalLatencyMillis = a3;
}

- (BOOL)hasOutputTokensCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasOutputTokensCount:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)setOutputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_outputTokensCount = a3;
}

- (BOOL)hasInputTokensCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasInputTokensCount:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)setInputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_inputTokensCount = a3;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GMS_REQUEST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GMS_REQUEST_TYPE_ONE_SHOT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GMS_REQUEST_TYPE_STREAMING"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C4460[a3];
  }

  return v3;
}

- (BOOL)hasRequestType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasRequestType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$8B3226069B0D9AEB47C44336741E4A83 has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)setRequestType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_uint64_t requestType = a3;
}

- (int)requestType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    return self->_requestType;
  }
  else {
    return 0;
  }
}

@end