@interface SFProximityEstimator
+ (SFProximityEstimator)proximityEstimatorWithProximityInfo:(id)a3;
- (SFProximityEstimator)initWithProximityInfo:(id)a3;
- (id)description;
- (id)descriptionParams;
- (int)_estimateRSSIForSFBLEDevice:(id)a3;
- (int)estimatedRSSI;
- (unsigned)updateWithSFBLEDevice:(id)a3;
@end

@implementation SFProximityEstimator

- (unsigned)updateWithSFBLEDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 closeProximityEstimatorMedium];

  v6 = [v4 closeProximityEstimatorSmall];

  uint64_t v7 = [(SFProximityEstimator *)self _estimateRSSIForSFBLEDevice:v4];
  if ((v7 & 0x80000000) == 0 && !SFDeviceIsVirtualMachine())
  {
    unsigned int v8 = 0;
    goto LABEL_62;
  }
  if (v7 == [v4 rssiEstimate])
  {
    unsigned int v8 = 0;
  }
  else
  {
    [v4 setRssiEstimate:v7];
    unsigned int v8 = 4;
  }
  p_int rssiEnter = &self->_rssiEnter;
  int rssiEnter = self->_rssiEnter;
  BOOL IsVirtualMachine = SFDeviceIsVirtualMachine();
  uint64_t v12 = (int)v7 >= rssiEnter || IsVirtualMachine;
  [v4 setTriggered:v12];
  if (v12 == 1)
  {
    if (v6 == self)
    {
      if (([v4 insideSmallBubble] & 1) == 0)
      {
        [v4 setInsideSmallBubble:1];
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if (v5 == self)
    {
      if (([v4 insideMediumBubble] & 1) == 0)
      {
        [v4 setInsideMediumBubble:1];
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if (([v4 insideBubble] & 1) == 0)
    {
      [v4 setInsideBubble:1];
      v8 |= 0x10u;
      if (gLogCategory_SFProximityEstimator <= 30
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
LABEL_39:
        uint64_t v19 = *p_rssiEnter;
        id v20 = v4;
        LogPrintF();
      }
    }
  }
  else
  {
    p_int rssiEnter = &self->_rssiExit;
    if ((int)v7 >= self->_rssiExit) {
      goto LABEL_40;
    }
    if (v6 == self)
    {
      if ([v4 insideSmallBubble])
      {
        [v4 setInsideSmallBubble:0];
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if (v5 == self)
    {
      if ([v4 insideMediumBubble])
      {
        [v4 setInsideMediumBubble:0];
        v8 |= 0x10u;
        if (gLogCategory_SFProximityEstimator <= 30
          && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_39;
        }
      }
    }
    else if ([v4 insideBubble])
    {
      [v4 setInsideBubble:0];
      v8 |= 0x10u;
      if (gLogCategory_SFProximityEstimator <= 30
        && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_39;
      }
    }
  }
LABEL_40:
  uint64_t v13 = objc_msgSend(v4, "distance", v19, v20);
  if (v13 != 60)
  {
    if (v13 == 20)
    {
      if ((int)v7 < self->_rssiImmediate)
      {
        BOOL v14 = (int)v7 <= self->_rssiFar;
        uint64_t v15 = 60;
        uint64_t v16 = 20;
LABEL_51:
        if (v14) {
          uint64_t v17 = v15;
        }
        else {
          uint64_t v17 = v16;
        }
        goto LABEL_56;
      }
LABEL_54:
      uint64_t v17 = 10;
      goto LABEL_56;
    }
    if (v13 == 10)
    {
      if ((int)v7 <= self->_rssiFar)
      {
        uint64_t v17 = 60;
        goto LABEL_56;
      }
      BOOL v14 = (int)v7 <= self->_rssiNear;
      uint64_t v15 = 20;
      uint64_t v16 = 10;
      goto LABEL_51;
    }
  }
  if ((int)v7 >= self->_rssiImmediate) {
    goto LABEL_54;
  }
  if ((int)v7 >= self->_rssiNear) {
    uint64_t v17 = 20;
  }
  else {
    uint64_t v17 = 60;
  }
LABEL_56:
  if (v17 != v13)
  {
    [v4 setDistance:v17];
    if (gLogCategory_SFProximityEstimator <= 30
      && (gLogCategory_SFProximityEstimator != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 |= 2u;
  }
LABEL_62:

  return v8;
}

+ (SFProximityEstimator)proximityEstimatorWithProximityInfo:(id)a3
{
  id v3 = a3;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  v5 = (Class *)off_1E5BBB778;
  v6 = off_1E5BBB770;
  if (Int64Ranged << 32 != 0x700000000) {
    v6 = off_1E5BBB768;
  }
  if (Int64Ranged << 32 != 0x600000000) {
    v5 = (Class *)v6;
  }
  uint64_t v7 = (void *)[objc_alloc(*v5) initWithProximityInfo:v3];

  return (SFProximityEstimator *)v7;
}

- (SFProximityEstimator)initWithProximityInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFProximityEstimator;
  v5 = [(SFProximityEstimator *)&v8 init];
  if (v5)
  {
    v5->_int rssiEnter = CFDictionaryGetInt64Ranged();
    v5->_rssiExit = CFDictionaryGetInt64Ranged();
    v5->_rssiImmediate = CFDictionaryGetInt64Ranged();
    v5->_rssiNear = CFDictionaryGetInt64Ranged();
    v5->_rssiFar = CFDictionaryGetInt64Ranged();
    v6 = v5;
  }

  return v5;
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

  return v3;
}

- (id)descriptionParams
{
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EF9BDC68];
  id v4 = (void *)v3;
  if (self->_rssiEnter)
  {
    v11 = (void *)v3;
    NSAppendPrintF();
    id v5 = v11;

    id v4 = v5;
  }
  if (self->_rssiExit)
  {
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  if (self->_rssiImmediate)
  {
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }
  if (self->_rssiNear)
  {
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }
  if (self->_rssiFar)
  {
    NSAppendPrintF();
    id v9 = v4;

    id v4 = v9;
  }

  return v4;
}

- (int)_estimateRSSIForSFBLEDevice:(id)a3
{
  return [a3 smoothedRSSI];
}

- (int)estimatedRSSI
{
  return self->_estimatedRSSI;
}

@end