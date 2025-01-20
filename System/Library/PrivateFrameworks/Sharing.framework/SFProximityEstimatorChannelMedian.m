@interface SFProximityEstimatorChannelMedian
- (id)description;
- (int)_estimateRSSIForSFBLEDevice:(id)a3;
@end

@implementation SFProximityEstimatorChannelMedian

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  v4 = [(SFProximityEstimator *)self descriptionParams];
  if (v4)
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }

  return v3;
}

- (int)_estimateRSSIForSFBLEDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rssi];
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_27;
  }
  char v6 = v5;
  v7 = [v4 advertisementFields];
  char Int64Ranged = CFDictionaryGetInt64Ranged();

  v9 = (char *)self->_channels + 8 * (Int64Ranged & 3) - (Int64Ranged & 3);
  char *v9 = Int64Ranged;
  uint64_t v10 = v9[4];
  v9[v10 + 1] = v6;
  if ((v10 + 1) <= 2u) {
    char v11 = v10 + 1;
  }
  else {
    char v11 = 0;
  }
  v9[4] = v11;
  unsigned int v14 = v9[5];
  v12 = v9 + 5;
  char v13 = v14;
  if (v14 < 3) {
    unsigned char *v12 = v13 + 1;
  }
  uint64_t v15 = 0;
  v16 = &self->_channels[0].rssiValues[2];
  char v17 = 0x80;
  do
  {
    v18 = &v16[v15];
    if (v16[v15 + 2] >= 3u)
    {
      int v19 = *(v18 - 2);
      int v20 = *(v18 - 1);
      int v21 = *v18;
      if (v21 <= v19) {
        char v22 = *(v18 - 2);
      }
      else {
        char v22 = *v18;
      }
      if (v20 < v21) {
        char v22 = *(v18 - 1);
      }
      if (v21 >= v19) {
        char v23 = *(v18 - 2);
      }
      else {
        char v23 = *v18;
      }
      if (v20 <= v21) {
        char v24 = v23;
      }
      else {
        char v24 = *(v18 - 1);
      }
      if (v19 > v20) {
        char v25 = v24;
      }
      else {
        char v25 = v22;
      }
      v18[3] = v25;
      if (v25 > v17) {
        char v17 = v25;
      }
    }
    v15 += 7;
  }
  while (v15 != 28);
  if (v17 != 128)
  {
    int v26 = v17;
    if (gLogCategory_SFProximityEstimator <= 9
      && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
    {
      int v39 = v26;
      uint64_t v28 = 0;
      rssiValues = self->_channels[0].rssiValues;
      do
      {
        v30 = &self->_channels[0].channel + 8 * v28 - v28;
        v31 = v30 + 5;
        if (v30[5])
        {
          v32 = "; ";
          if (!v28) {
            v32 = "";
          }
          uint64_t v37 = *v30;
          uint64_t v38 = (char)v30[6];
          v36 = v32;
          SNPrintF_Add();
          if (*v31)
          {
            unint64_t v33 = 0;
            do
            {
              if (v33) {
                v34 = ", ";
              }
              else {
                v34 = "";
              }
              v36 = v34;
              uint64_t v37 = rssiValues[v33];
              SNPrintF_Add();
              ++v33;
            }
            while (v33 < *v31);
          }
          SNPrintF_Add();
        }
        ++v28;
        rssiValues += 7;
      }
      while (v28 != 4);
      int v26 = v39;
      if (gLogCategory_SFProximityEstimator < 51
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
        v35 = objc_msgSend(v4, "identifier", v36, v37, v38);
        LogPrintF();
      }
    }
  }
  else
  {
LABEL_27:
    int v26 = 0;
  }

  return v26;
}

@end