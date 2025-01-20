@interface MFPColorLUTEffect
+ (id)GUID;
- (MFPColorLUTEffect)initWithLUTA:(unsigned __int8)a3[256] LUTR:(unsigned __int8)a4[256] LUTG:(unsigned __int8)a5[256] LUTB:(unsigned __int8)a6[256];
@end

@implementation MFPColorLUTEffect

+ (id)GUID
{
  return @"A7CE72A9-0F7F-40D7-B3CC-D0C02D5C3212";
}

- (MFPColorLUTEffect)initWithLUTA:(unsigned __int8)a3[256] LUTR:(unsigned __int8)a4[256] LUTG:(unsigned __int8)a5[256] LUTB:(unsigned __int8)a6[256]
{
  v59.receiver = self;
  v59.super_class = (Class)MFPColorLUTEffect;
  result = [(MFPColorLUTEffect *)&v59 init];
  if (result)
  {
    long long v11 = *((_OWORD *)a3 + 3);
    long long v13 = *(_OWORD *)a3;
    long long v12 = *((_OWORD *)a3 + 1);
    *(_OWORD *)&result->mLutA[32] = *((_OWORD *)a3 + 2);
    *(_OWORD *)&result->mLutA[48] = v11;
    *(_OWORD *)result->mLutA = v13;
    *(_OWORD *)&result->mLutA[16] = v12;
    long long v14 = *((_OWORD *)a3 + 7);
    long long v16 = *((_OWORD *)a3 + 4);
    long long v15 = *((_OWORD *)a3 + 5);
    *(_OWORD *)&result->mLutA[96] = *((_OWORD *)a3 + 6);
    *(_OWORD *)&result->mLutA[112] = v14;
    *(_OWORD *)&result->mLutA[64] = v16;
    *(_OWORD *)&result->mLutA[80] = v15;
    long long v17 = *((_OWORD *)a3 + 11);
    long long v19 = *((_OWORD *)a3 + 8);
    long long v18 = *((_OWORD *)a3 + 9);
    *(_OWORD *)&result->mLutA[160] = *((_OWORD *)a3 + 10);
    *(_OWORD *)&result->mLutA[176] = v17;
    *(_OWORD *)&result->mLutA[128] = v19;
    *(_OWORD *)&result->mLutA[144] = v18;
    long long v20 = *((_OWORD *)a3 + 15);
    long long v22 = *((_OWORD *)a3 + 12);
    long long v21 = *((_OWORD *)a3 + 13);
    *(_OWORD *)&result->mLutA[224] = *((_OWORD *)a3 + 14);
    *(_OWORD *)&result->mLutA[240] = v20;
    *(_OWORD *)&result->mLutA[192] = v22;
    *(_OWORD *)&result->mLutA[208] = v21;
    long long v23 = *((_OWORD *)a4 + 3);
    long long v25 = *(_OWORD *)a4;
    long long v24 = *((_OWORD *)a4 + 1);
    *(_OWORD *)&result->mLutR[32] = *((_OWORD *)a4 + 2);
    *(_OWORD *)&result->mLutR[48] = v23;
    *(_OWORD *)result->mLutR = v25;
    *(_OWORD *)&result->mLutR[16] = v24;
    long long v26 = *((_OWORD *)a4 + 7);
    long long v28 = *((_OWORD *)a4 + 4);
    long long v27 = *((_OWORD *)a4 + 5);
    *(_OWORD *)&result->mLutR[96] = *((_OWORD *)a4 + 6);
    *(_OWORD *)&result->mLutR[112] = v26;
    *(_OWORD *)&result->mLutR[64] = v28;
    *(_OWORD *)&result->mLutR[80] = v27;
    long long v29 = *((_OWORD *)a4 + 11);
    long long v31 = *((_OWORD *)a4 + 8);
    long long v30 = *((_OWORD *)a4 + 9);
    *(_OWORD *)&result->mLutR[160] = *((_OWORD *)a4 + 10);
    *(_OWORD *)&result->mLutR[176] = v29;
    *(_OWORD *)&result->mLutR[128] = v31;
    *(_OWORD *)&result->mLutR[144] = v30;
    long long v32 = *((_OWORD *)a4 + 15);
    long long v34 = *((_OWORD *)a4 + 12);
    long long v33 = *((_OWORD *)a4 + 13);
    *(_OWORD *)&result->mLutR[224] = *((_OWORD *)a4 + 14);
    *(_OWORD *)&result->mLutR[240] = v32;
    *(_OWORD *)&result->mLutR[192] = v34;
    *(_OWORD *)&result->mLutR[208] = v33;
    long long v35 = *((_OWORD *)a5 + 3);
    long long v37 = *(_OWORD *)a5;
    long long v36 = *((_OWORD *)a5 + 1);
    *(_OWORD *)&result->mLutG[32] = *((_OWORD *)a5 + 2);
    *(_OWORD *)&result->mLutG[48] = v35;
    *(_OWORD *)result->mLutG = v37;
    *(_OWORD *)&result->mLutG[16] = v36;
    long long v38 = *((_OWORD *)a5 + 7);
    long long v40 = *((_OWORD *)a5 + 4);
    long long v39 = *((_OWORD *)a5 + 5);
    *(_OWORD *)&result->mLutG[96] = *((_OWORD *)a5 + 6);
    *(_OWORD *)&result->mLutG[112] = v38;
    *(_OWORD *)&result->mLutG[64] = v40;
    *(_OWORD *)&result->mLutG[80] = v39;
    long long v41 = *((_OWORD *)a5 + 11);
    long long v43 = *((_OWORD *)a5 + 8);
    long long v42 = *((_OWORD *)a5 + 9);
    *(_OWORD *)&result->mLutG[160] = *((_OWORD *)a5 + 10);
    *(_OWORD *)&result->mLutG[176] = v41;
    *(_OWORD *)&result->mLutG[128] = v43;
    *(_OWORD *)&result->mLutG[144] = v42;
    long long v44 = *((_OWORD *)a5 + 15);
    long long v46 = *((_OWORD *)a5 + 12);
    long long v45 = *((_OWORD *)a5 + 13);
    *(_OWORD *)&result->mLutG[224] = *((_OWORD *)a5 + 14);
    *(_OWORD *)&result->mLutG[240] = v44;
    *(_OWORD *)&result->mLutG[192] = v46;
    *(_OWORD *)&result->mLutG[208] = v45;
    long long v47 = *((_OWORD *)a6 + 3);
    long long v49 = *(_OWORD *)a6;
    long long v48 = *((_OWORD *)a6 + 1);
    *(_OWORD *)&result->mLutB[32] = *((_OWORD *)a6 + 2);
    *(_OWORD *)&result->mLutB[48] = v47;
    *(_OWORD *)result->mLutB = v49;
    *(_OWORD *)&result->mLutB[16] = v48;
    long long v50 = *((_OWORD *)a6 + 7);
    long long v52 = *((_OWORD *)a6 + 4);
    long long v51 = *((_OWORD *)a6 + 5);
    *(_OWORD *)&result->mLutB[96] = *((_OWORD *)a6 + 6);
    *(_OWORD *)&result->mLutB[112] = v50;
    *(_OWORD *)&result->mLutB[64] = v52;
    *(_OWORD *)&result->mLutB[80] = v51;
    long long v53 = *((_OWORD *)a6 + 11);
    long long v55 = *((_OWORD *)a6 + 8);
    long long v54 = *((_OWORD *)a6 + 9);
    *(_OWORD *)&result->mLutB[160] = *((_OWORD *)a6 + 10);
    *(_OWORD *)&result->mLutB[176] = v53;
    *(_OWORD *)&result->mLutB[128] = v55;
    *(_OWORD *)&result->mLutB[144] = v54;
    long long v56 = *((_OWORD *)a6 + 15);
    long long v58 = *((_OWORD *)a6 + 12);
    long long v57 = *((_OWORD *)a6 + 13);
    *(_OWORD *)&result->mLutB[224] = *((_OWORD *)a6 + 14);
    *(_OWORD *)&result->mLutB[240] = v56;
    *(_OWORD *)&result->mLutB[192] = v58;
    *(_OWORD *)&result->mLutB[208] = v57;
  }
  return result;
}

@end