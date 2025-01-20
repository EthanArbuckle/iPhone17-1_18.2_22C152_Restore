@interface SFProximityEstimatorMaxOfMean
- (SFProximityEstimatorMaxOfMean)initWithProximityInfo:(id)a3;
- (id)description;
- (int)_estimateRSSIForSFBLEDevice:(id)a3;
- (void)dealloc;
@end

@implementation SFProximityEstimatorMaxOfMean

- (int)_estimateRSSIForSFBLEDevice:(id)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 rssi];
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_17;
  }
  char v6 = v5;
  uint64_t rssiIndex = self->_rssiIndex;
  v8 = [v4 advertisementFields];
  char Int64Ranged = CFDictionaryGetInt64Ranged();

  self->_channelNumberArray[rssiIndex] = Int64Ranged;
  self->_rssiArray[rssiIndex] = v6;
  if ((rssiIndex + 1) < self->_rssiMinCount) {
    unsigned int v10 = rssiIndex + 1;
  }
  else {
    unsigned int v10 = 0;
  }
  self->_uint64_t rssiIndex = v10;
  LODWORD(v11) = self->_rssiCount;
  unsigned int rssiMinCount = self->_rssiMinCount;
  if (v11 < rssiMinCount)
  {
    LODWORD(v11) = v11 + 1;
    self->_unint64_t rssiCount = v11;
    unsigned int rssiMinCount = self->_rssiMinCount;
  }
  if (v11 < rssiMinCount) {
    goto LABEL_17;
  }
  v51[0] = 0;
  v51[1] = 0;
  v50[0] = 0;
  v50[1] = 0;
  int v33 = -1;
  if (v11)
  {
    channelNumberArray = self->_channelNumberArray;
    rssiArray = self->_rssiArray;
    uint64_t v11 = v11;
    do
    {
      char v16 = *channelNumberArray++;
      char v15 = v16;
      uint64_t v17 = v16 & 3;
      int v18 = *rssiArray++;
      *((_DWORD *)v51 + v17) += v18;
      ++*((_DWORD *)v50 + v17);
      *(unsigned char *)((unint64_t)&v33 | v15 & 3) = v15;
      --v11;
    }
    while (v11);
  }
  uint64_t v19 = 0;
  char v20 = 0x80;
  do
  {
    int v21 = *(_DWORD *)((char *)v50 + v19);
    if (v21)
    {
      int v22 = *(_DWORD *)((char *)v51 + v19) / v21;
      *(_DWORD *)((char *)v51 + v19) = (char)v22;
      if ((char)v22 > v20) {
        char v20 = v22;
      }
    }
    v19 += 4;
  }
  while (v19 != 16);
  if (v20 != 128)
  {
    int v23 = v20;
    if (gLogCategory_SFProximityEstimator <= 9
      && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
    {
      v32 = v4;
      uint64_t v25 = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      do
      {
        int v26 = *((unsigned __int8 *)&v33 + v25);
        if (v26 != 255)
        {
          uint64_t v30 = *((unsigned __int8 *)&v33 + v25);
          uint64_t v31 = *((unsigned int *)v51 + v25);
          SNPrintF_Add();
          unint64_t rssiCount = self->_rssiCount;
          if (rssiCount)
          {
            for (unint64_t i = 0; i < rssiCount; ++i)
            {
              if (self->_channelNumberArray[i] == v26)
              {
                uint64_t v30 = self->_rssiArray[i];
                SNPrintF_Add();
                unint64_t rssiCount = self->_rssiCount;
              }
            }
          }
          SNPrintF_Add();
        }
        ++v25;
      }
      while (v25 != 4);
      id v4 = v32;
      if (gLogCategory_SFProximityEstimator < 51
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
        v29 = objc_msgSend(v32, "identifier", v30, v31);
        LogPrintF();
      }
    }
  }
  else
  {
LABEL_17:
    int v23 = 0;
  }

  return v23;
}

- (void)dealloc
{
  channelNumberArray = self->_channelNumberArray;
  if (channelNumberArray)
  {
    free(channelNumberArray);
    self->_channelNumberArray = 0;
  }
  rssiArray = self->_rssiArray;
  if (rssiArray)
  {
    free(rssiArray);
    self->_rssiArray = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SFProximityEstimatorMaxOfMean;
  [(SFProximityEstimatorMaxOfMean *)&v5 dealloc];
}

- (SFProximityEstimatorMaxOfMean)initWithProximityInfo:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFProximityEstimatorMaxOfMean;
  objc_super v5 = [(SFProximityEstimator *)&v15 initWithProximityInfo:v4];
  if (!v5) {
    goto LABEL_10;
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  v5->_unsigned int rssiMinCount = Int64Ranged;
  if (Int64Ranged)
  {
    if (Int64Ranged < 0x41) {
      goto LABEL_7;
    }
    unsigned int Int64Ranged = 64;
    int v7 = 64;
  }
  else
  {
    int v7 = 16;
    unsigned int Int64Ranged = 16;
  }
  v5->_unsigned int rssiMinCount = v7;
LABEL_7:
  v8 = (char *)malloc_type_calloc(Int64Ranged, 1uLL, 0x100004077774924uLL);
  v5->_channelNumberArray = v8;
  if (v8)
  {
    v9 = (char *)malloc_type_calloc(v5->_rssiMinCount, 1uLL, 0x100004077774924uLL);
    v5->_rssiArray = v9;
    if (v9)
    {
      unsigned int v10 = v5;
LABEL_10:

      return v5;
    }
  }
  else
  {
    FatalErrorF();
  }
  v12 = (SFProximityEstimator *)FatalErrorF();
  return (SFProximityEstimatorMaxOfMean *)[(SFProximityEstimator *)v12 initWithProximityInfo:v14];
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = [(SFProximityEstimator *)self descriptionParams];
  if (v4)
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }

  if (self->_rssiMinCount)
  {
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }

  return v3;
}

@end