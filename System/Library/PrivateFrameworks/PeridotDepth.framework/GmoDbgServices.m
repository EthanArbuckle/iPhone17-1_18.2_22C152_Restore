@interface GmoDbgServices
+ (int)compareVersions:(id)a3 toVersion:(id)a4;
- (GmoDbgServices)init;
- (id)createNewMetaDataDict;
- (id)generateFolderNameWithId:(id)a3;
- (id)getGmoMetaDataArray;
- (int)extractDbgDataFor_gmoBankInput:(GmoProcessBankInputs *)a3 inIndex:(unsigned int)a4;
- (int)extractDbgDataFor_gmoBankOutput:(id *)a3 anchorsWithHist:(PDAnchors *)a4 spotLocationsAtRefDist:(id *)a5 inIndex:(unsigned int)a6;
- (int)extractDbgDataFor_gmoConfig:(GmoCfgBits *)a3 inIndex:(unsigned int)a4;
- (int)extractDbgDataFor_gmoDebug:(GmoDebugData *)a3 inIndex:(unsigned int)a4;
- (int)extractDbgDataFor_gmoInit:(GmoInitInputs *)a3 inIndex:(unsigned int)a4;
- (unsigned)bankNumInHomogCycle;
- (unsigned)numOfHomogCylce;
- (void)addDbgDataFor_factorySpotLocation10m:(id *)a3;
- (void)addDbgDataFor_factorySpotLocation70cm:(id *)a3;
- (void)addDbgDataFor_findSpotLocation:(SpecsResults *)a3 withAnchors:(const SpConfig *)a4 spotLocationEstimation:(void *)a5 outBound:(void *)a6;
- (void)addDbgDataFor_getAnchorsWithHysteresis:(id *)a3 currAnchors:(const PDAnchors *)a4 snrHysteresisPct:(float)a5 anchorsWithHist:(PDAnchors *)a6 violations:(spViolations *)a7 numOfClippedSpots:(unint64_t)a8 anchorMoveIdx:(void *)a9 spotLocationsAtRefDist:(id *)a10 numQualifiedSpot:(unint64_t)a11 anchorsShift:(PDAnchors *)a12 anchorsMoved:(unint64_t)a13;
- (void)addDbgDataFor_globalEstimation:(id *)a3 spotLocationAtRefDist:(id *)a4 smoothedSNR:(PeridotSpotValues<common:(const void *)a6 :(void *)a7 PeridotSpotScalarValue<float>> *)a5 validSpotsIndexes:(GlobalEstimationCtrl *)a8 result:hCtrl:;
- (void)addDbgDataFor_gmoBankInput:(const GmoProcessBankInputs *)a3;
- (void)addDbgDataFor_gmoBankOutput:(id *)a3 anchorsWithHist:(const PDAnchors *)a4 spotLocationsAtRefDist:(id *)a5;
- (void)addDbgDataFor_gmoConfig:(GmoCfgBits *)a3;
- (void)addDbgDataFor_gmoInit:(GmoInitInputs *)a3;
- (void)addDbgDataFor_gtErrP95:(const float *)a3 smoothedErrP95:(const float *)a4 gtErrP95Sop:(const float *)a5 smoothedErrP95Sop:(const float *)a6;
- (void)addDbgDataFor_homogClassifier:(const GmoMetrics *)a3 estTols:(const EstTols *)a4;
- (void)addDbgDataFor_itpQual:(const float *)a3 itpQualSop:(const float *)a4;
- (void)addDbgDataFor_operationalSpotLocation10m:(id *)a3;
- (void)addDbgDataFor_operationalSpotLocation70cm:(id *)a3;
- (void)addDbgDataFor_spotLocation:(id *)a3 withName:(id)a4;
- (void)dumpMetaDataAsXML:(id)a3;
- (void)endOfBank;
- (void)endOfHomogCycle;
- (void)endOfSession;
- (void)readMetaDataFromXML:(id)a3;
- (void)recStart;
- (void)startOfHomogCycle;
@end

@implementation GmoDbgServices

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recFolder, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_gmoMetaDataForGetter, 0);
  objc_storeStrong((id *)&self->_gmoMetaDataForRecording, 0);
  objc_storeStrong((id *)&self->_gmoMetaData, 0);
}

- (unsigned)numOfHomogCylce
{
  return self->_numOfHomogCylce;
}

- (unsigned)bankNumInHomogCycle
{
  return self->_bankNumInHomogCycle;
}

- (int)extractDbgDataFor_gmoBankOutput:(id *)a3 anchorsWithHist:(PDAnchors *)a4 spotLocationsAtRefDist:(id *)a5 inIndex:(unsigned int)a6
{
  uint64_t v10 = a6;
  v97 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:a6];
  v11 = [v97 objectForKeyedSubscript:@"hasData"];
  char v12 = [v11 isEqual:MEMORY[0x263EFFA88]];

  if ((v12 & 1) == 0) {
    return 1;
  }
  v89 = a5;
  v90 = a4;
  v13 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v10];
  v98 = [v13 objectForKeyedSubscript:@"output"];

  uint64_t v94 = 0;
  p_var1 = &a3->var0[0].var0[0].var1;
  do
  {
    uint64_t v15 = 0;
    v91 = p_var1;
    do
    {
      v16 = [v98 objectForKeyedSubscript:@"smoothedSpotLocations"];
      v17 = [NSNumber numberWithUnsignedLong:v94];
      v18 = [v17 stringValue];
      v19 = [v16 objectForKeyedSubscript:v18];
      v20 = [NSNumber numberWithUnsignedLong:v15];
      v21 = [v20 stringValue];
      v22 = [v19 objectForKeyedSubscript:v21];
      v23 = [v22 objectForKeyedSubscript:@"x"];
      [v23 floatValue];
      *((_DWORD *)p_var1 - 1) = v24;

      v25 = [v98 objectForKeyedSubscript:@"smoothedSpotLocations"];
      v26 = [NSNumber numberWithUnsignedLong:v94];
      v27 = [v26 stringValue];
      v28 = [v25 objectForKeyedSubscript:v27];
      v29 = [NSNumber numberWithUnsignedLong:v15];
      v30 = [v29 stringValue];
      v31 = [v28 objectForKeyedSubscript:v30];
      v32 = [v31 objectForKeyedSubscript:@"y"];
      [v32 floatValue];
      *(_DWORD *)p_var1 = v33;
      p_var1 += 2;

      ++v15;
    }
    while (v15 != 14);
    p_var1 = v91 + 28;
    ++v94;
  }
  while (v94 != 8);
  uint64_t v95 = 0;
  p_useNorthHS2 = &v90->banks[0].anchors[0].useNorthHS2;
  do
  {
    uint64_t v35 = 0;
    v92 = p_useNorthHS2;
    do
    {
      v36 = [v98 objectForKeyedSubscript:@"anchors"];
      v37 = [NSNumber numberWithUnsignedLong:v95];
      v38 = [v37 stringValue];
      v39 = [v36 objectForKeyedSubscript:v38];
      v40 = [NSNumber numberWithUnsignedLong:v35];
      v41 = [v40 stringValue];
      v42 = [v39 objectForKeyedSubscript:v41];
      v43 = [v42 objectForKeyedSubscript:@"x"];
      [v43 floatValue];
      *(p_useNorthHS2 - 2) = (int)v44;

      v45 = [v98 objectForKeyedSubscript:@"anchors"];
      v46 = [NSNumber numberWithUnsignedLong:v95];
      v47 = [v46 stringValue];
      v48 = [v45 objectForKeyedSubscript:v47];
      v49 = [NSNumber numberWithUnsignedLong:v35];
      v50 = [v49 stringValue];
      v51 = [v48 objectForKeyedSubscript:v50];
      v52 = [v51 objectForKeyedSubscript:@"y"];
      [v52 floatValue];
      *(p_useNorthHS2 - 1) = (int)v53;

      v54 = [v98 objectForKeyedSubscript:@"anchors"];
      v55 = [NSNumber numberWithUnsignedLong:v95];
      v56 = [v55 stringValue];
      v57 = [v54 objectForKeyedSubscript:v56];
      v58 = [NSNumber numberWithUnsignedLong:v35];
      v59 = [v58 stringValue];
      v60 = [v57 objectForKeyedSubscript:v59];
      v61 = [v60 objectForKeyedSubscript:@"useNorthHS2"];
      [v61 floatValue];
      BOOL *p_useNorthHS2 = v62 != 0.0;
      p_useNorthHS2 += 3;

      ++v35;
    }
    while (v35 != 14);
    p_useNorthHS2 = v92 + 42;
    ++v95;
  }
  while (v95 != 8);
  v63 = [v98 objectForKeyedSubscript:@"globalSpotLocations"];
  v64 = [v63 objectForKeyedSubscript:@"calibDistance"];
  [v64 floatValue];
  v89->var1 = v65;

  v66 = [v98 objectForKeyedSubscript:@"globalSpotLocations"];
  v67 = [v66 objectForKeyedSubscript:@"isSphere"];
  v89->var2 = [v67 unsignedCharValue];

  uint64_t v96 = 0;
  v68 = (_DWORD *)&v89->var0[0].var0[0].var1;
  do
  {
    uint64_t v69 = 0;
    v93 = v68;
    do
    {
      v70 = [v98 objectForKeyedSubscript:@"globalSpotLocations"];
      v71 = [NSNumber numberWithUnsignedLong:v96];
      v72 = [v71 stringValue];
      v73 = [v70 objectForKeyedSubscript:v72];
      v74 = [NSNumber numberWithUnsignedLong:v69];
      v75 = [v74 stringValue];
      v76 = [v73 objectForKeyedSubscript:v75];
      v77 = [v76 objectForKeyedSubscript:@"x"];
      [v77 floatValue];
      *(v68 - 1) = v78;

      v79 = [v98 objectForKeyedSubscript:@"globalSpotLocations"];
      v80 = [NSNumber numberWithUnsignedLong:v96];
      v81 = [v80 stringValue];
      v82 = [v79 objectForKeyedSubscript:v81];
      v83 = [NSNumber numberWithUnsignedLong:v69];
      v84 = [v83 stringValue];
      v85 = [v82 objectForKeyedSubscript:v84];
      v86 = [v85 objectForKeyedSubscript:@"y"];
      [v86 floatValue];
      _DWORD *v68 = v87;
      v68 += 2;

      ++v69;
    }
    while (v69 != 14);
    v68 = v93 + 28;
    ++v96;
  }
  while (v96 != 8);

  return 0;
}

- (int)extractDbgDataFor_gmoBankInput:(GmoProcessBankInputs *)a3 inIndex:(unsigned int)a4
{
  uint64_t v262 = a4;
  v271 = -[NSMutableArray objectAtIndexedSubscript:](self->_gmoMetaData, "objectAtIndexedSubscript:");
  v4 = [v271 objectForKeyedSubscript:@"hasData"];
  char v5 = [v4 isEqual:MEMORY[0x263EFFA88]];

  if ((v5 & 1) == 0) {
    return 1;
  }
  v6 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v262];
  v7 = [v6 valueForKey:@"input"];

  v272 = v7;
  v8 = [v7 objectForKeyedSubscript:@"bankId"];
  a3->var0 = [v8 unsignedLongValue];

  v9 = [v7 objectForKeyedSubscript:@"bankIndx"];
  a3->var1 = [v9 unsignedLongValue];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"frameIdx"];
  a3->var2 = [v10 unsignedLongValue];

  v11 = [v7 objectForKeyedSubscript:@"phaseNum"];
  a3->unint64_t var3 = [v11 unsignedLongValue];

  char v12 = [v7 objectForKeyedSubscript:@"priNum"];
  a3->unint64_t var4 = [v12 unsignedLongValue];

  v13 = [v7 objectForKeyedSubscript:@"cfgUpdateId"];
  a3->var6 = [v13 unsignedIntValue];

  v14 = [v7 objectForKeyedSubscript:@"sensorTemperature"];
  [v14 floatValue];
  a3->var7 = v15;

  v16 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v262];
  v17 = [v16 objectForKeyedSubscript:@"metaDataVersion"];
  LODWORD(v7) = +[GmoDbgServices compareVersions:v17 toVersion:@"3.0.3"];

  if (v7 == 1)
  {
    v18 = [v272 objectForKeyedSubscript:@"timestamp"];
    [v18 doubleValue];
    a3->var8 = v19;
  }
  else
  {
    v18 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v262];
    v21 = [v18 objectForKeyedSubscript:@"debug"];
    v22 = [v21 objectForKeyedSubscript:@"timestamp"];
    [v22 floatValue];
    a3->var8 = v23;
  }
  int v24 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v262];
  v25 = [v24 objectForKeyedSubscript:@"metaDataVersion"];
  int v26 = +[GmoDbgServices compareVersions:v25 toVersion:@"3.0.4"];

  if (v26 == 1)
  {
    v27 = [v272 objectForKeyedSubscript:@"internalFwError"];
    a3->var9 = [v27 BOOLValue];
  }
  else
  {
    a3->var9 = 0;
  }
  v28 = [v272 objectForKeyedSubscript:@"lsb"];
  v29 = [NSNumber numberWithUnsignedLong:0];
  v30 = [v29 stringValue];
  v31 = [v28 objectForKeyedSubscript:v30];
  [v31 floatValue];
  a3->var5[0] = v32;

  int v33 = [v272 objectForKeyedSubscript:@"lsb"];
  v34 = [NSNumber numberWithUnsignedLong:1];
  uint64_t v35 = [v34 stringValue];
  v36 = [v33 objectForKeyedSubscript:v35];
  [v36 floatValue];
  a3->var5[1] = v37;

  v38 = [v272 objectForKeyedSubscript:@"lsb"];
  v39 = [NSNumber numberWithUnsignedLong:2];
  v40 = [v39 stringValue];
  v41 = [v38 objectForKeyedSubscript:v40];
  [v41 floatValue];
  v265 = &a3->var12.var0.var0[2].var0[3].var0[2].var0[1][1];
  a3->var5[2] = v42;

  uint64_t v43 = 0;
  do
  {
    uint64_t v44 = 0;
    v282 = (char *)&a3->var10 + 24 * v43;
    uint64_t v285 = v43;
    char v45 = 1;
    do
    {
      char v279 = v45;
      v46 = [v272 objectForKeyedSubscript:@"userOutput"];
      v47 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v43];
      v48 = [v47 stringValue];
      v49 = [v46 objectForKeyedSubscript:v48];
      v50 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v44];
      v51 = [v50 stringValue];
      v52 = [v49 objectForKeyedSubscript:v51];
      float v53 = [v52 objectForKeyedSubscript:@"confidence"];
      [v53 floatValue];
      v54 = &v282[12 * v44];
      *((_DWORD *)v54 + 1) = v55;

      v56 = [v272 objectForKeyedSubscript:@"userOutput"];
      v57 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v285];
      v58 = [v57 stringValue];
      v59 = [v56 objectForKeyedSubscript:v58];
      v60 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v44];
      v61 = [v60 stringValue];
      float v62 = [v59 objectForKeyedSubscript:v61];
      v63 = [v62 objectForKeyedSubscript:@"tof"];
      [v63 floatValue];
      *(_DWORD *)v54 = v64;

      float v65 = [v272 objectForKeyedSubscript:@"userOutput"];
      v66 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v285];
      v67 = [v66 stringValue];
      v68 = [v65 objectForKeyedSubscript:v67];
      uint64_t v69 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v44];
      v70 = [v69 stringValue];
      uint64_t v43 = [v68 objectForKeyedSubscript:v70];
      v71 = [(id)v43 objectForKeyedSubscript:@"na"];
      [v71 floatValue];
      *((_DWORD *)v54 + 2) = v72;

      char v45 = 0;
      uint64_t v44 = 1;
      LOWORD(v43) = v285;
    }
    while ((v279 & 1) != 0);
    uint64_t v43 = v285 + 1;
  }
  while (v285 != 13);
  uint64_t v73 = 0;
  do
  {
    uint64_t v286 = 0;
    v277 = (char *)&a3->var10.var0[7] + 32 * v73;
    char v74 = 1;
    uint64_t v283 = v73;
    do
    {
      char v280 = v74;
      v75 = [v272 objectForKeyedSubscript:@"spotDepth"];
      v76 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v73];
      v77 = [v76 stringValue];
      int v78 = [v75 objectForKeyedSubscript:v77];
      v79 = [v78 objectForKeyedSubscript:@"hs"];
      v80 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v286];
      v81 = [v80 stringValue];
      v82 = [v79 objectForKeyedSubscript:v81];
      v83 = [v82 objectForKeyedSubscript:@"confidence"];
      [v83 floatValue];
      v84 = &v277[8 * v286];
      *((_DWORD *)v84 + 1) = v85;

      v86 = [v272 objectForKeyedSubscript:@"spotDepth"];
      int v87 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v283];
      v88 = [v87 stringValue];
      v89 = [v86 objectForKeyedSubscript:v88];
      v90 = [v89 objectForKeyedSubscript:@"hs"];
      v91 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v286];
      v92 = [v91 stringValue];
      v93 = [v90 objectForKeyedSubscript:v92];
      uint64_t v94 = [v93 objectForKeyedSubscript:@"tof"];
      [v94 floatValue];
      *(_DWORD *)v84 = v95;

      uint64_t v96 = [v272 objectForKeyedSubscript:@"spotDepth"];
      v97 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v283];
      v98 = [v97 stringValue];
      v99 = [v96 objectForKeyedSubscript:v98];
      v100 = [v99 objectForKeyedSubscript:@"hp"];
      v101 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v286];
      v102 = [v101 stringValue];
      v103 = [v100 objectForKeyedSubscript:v102];
      v104 = [v103 objectForKeyedSubscript:@"confidence"];
      [v104 floatValue];
      uint64_t v73 = (uint64_t)&v277[8 * v286 + 16];
      *(_DWORD *)(v73 + 4) = v105;

      v106 = [v272 objectForKeyedSubscript:@"spotDepth"];
      v107 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v283];
      v108 = [v107 stringValue];
      v109 = [v106 objectForKeyedSubscript:v108];
      v110 = [v109 objectForKeyedSubscript:@"hp"];
      v111 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v286];
      v112 = [v111 stringValue];
      v113 = [v110 objectForKeyedSubscript:v112];
      v114 = [v113 objectForKeyedSubscript:@"tof"];
      [v114 floatValue];
      *(_DWORD *)uint64_t v73 = v115;

      char v74 = 0;
      uint64_t v286 = 1;
      LOWORD(v73) = v283;
    }
    while ((v280 & 1) != 0);
    uint64_t v73 = v283 + 1;
  }
  while (v283 != 13);
  v116 = a3;
  unint64_t var4 = a3->var4;
  if (var4 && a3->var3)
  {
    unsigned __int16 v267 = 0;
    v118 = &a3->var11.var0[2].var0[1][1];
    unint64_t var3 = 1;
    do
    {
      if (var3)
      {
        LODWORD(v120) = 0;
        v121 = &v118[672 * v267];
        v260 = v121;
        do
        {
          uint64_t v268 = 0;
          v122 = &v121[168 * (unsigned __int16)v120];
          int v266 = v120;
          do
          {
            v269 = v122;
            uint64_t v270 = 0;
            v264 = v122;
            do
            {
              for (uint64_t i = 0; i != 3; ++i)
              {
                v124 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
                v125 = [v124 objectForKeyedSubscript:@"specs"];
                v126 = [NSNumber numberWithUnsignedShort:v267];
                v127 = [v126 stringValue];
                v128 = [v125 objectForKeyedSubscript:v127];
                v287 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v120];
                v284 = [v287 stringValue];
                v129 = [v128 objectForKeyedSubscript:v284];
                v281 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v268];
                v276 = [v281 stringValue];
                v278 = v129;
                v130 = [v129 objectForKeyedSubscript:v276];
                uint64_t v120 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v270];
                v131 = [(id)v120 stringValue];
                v132 = [v130 objectForKeyedSubscript:v131];
                v273 = v126;
                v274 = v125;
                v275 = v124;
                v133 = [NSNumber numberWithUnsignedShort:(unsigned __int16)i];
                v134 = [v133 stringValue];
                v135 = [v132 objectForKeyedSubscript:v134];
                [v135 floatValue];
                v269[i] = v136;

                LOWORD(v120) = v266;
              }
              v269 += 3;
              ++v270;
            }
            while (v270 != 4);
            v122 = v264 + 12;
            ++v268;
          }
          while (v268 != 14);
          unint64_t var3 = a3->var3;
          LODWORD(v120) = v266 + 1;
          v121 = v260;
        }
        while (var3 > (unsigned __int16)(v266 + 1));
        unint64_t var4 = a3->var4;
        v118 = &a3->var11.var0[2].var0[1][1];
      }
      ++v267;
      v116 = a3;
    }
    while (var4 > v267);
  }
  v288 = &v116->var12.var0.var0[2].var0[3].var0[2].var0[3][2];
  uint64_t v137 = -14;
  do
  {
    v138 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
    v139 = [v138 objectForKeyedSubscript:@"spConfig"];
    v140 = [NSNumber numberWithUnsignedLong:v137 + 14];
    v141 = [v140 stringValue];
    v142 = [v139 objectForKeyedSubscript:v141];
    v143 = [v142 objectForKeyedSubscript:@"spx"];
    *(unsigned char *)v265 = [v143 charValue];

    v144 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
    v145 = [v144 objectForKeyedSubscript:@"spConfig"];
    v146 = [NSNumber numberWithUnsignedLong:v137 + 14];
    v147 = [v146 stringValue];
    v148 = [v145 objectForKeyedSubscript:v147];
    v149 = [v148 objectForKeyedSubscript:@"spy"];
    *((unsigned char *)v265 + 14) = [v149 charValue];

    v150 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
    v151 = [v150 objectForKeyedSubscript:@"spConfig"];
    v152 = [NSNumber numberWithUnsignedLong:v137 + 14];
    v153 = [v152 stringValue];
    v154 = [v151 objectForKeyedSubscript:v153];
    v155 = [v154 objectForKeyedSubscript:@"useNorthHS2"];
    *((unsigned char *)v288 + v137 + 14) = [v155 BOOLValue];

    v265 = (float *)((char *)v265 + 1);
  }
  while (!__CFADD__(v137++, 1));
  v157 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v262];
  v158 = [v157 objectForKeyedSubscript:@"metaDataVersion"];
  int v159 = +[GmoDbgServices compareVersions:v158 toVersion:@"3.0.5"];

  if (v159 == 1)
  {
    uint64_t v160 = 0;
    v161 = (char *)&a3->var12.var0.var0[2].var0[3].var0[3].var0[1][0] + 1;
    do
    {
      v162 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v163 = [v162 objectForKeyedSubscript:@"priConfig"];
      v164 = [v163 objectForKeyedSubscript:@"spect1hs1"];
      v165 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v166 = [v165 stringValue];
      v167 = [v164 objectForKeyedSubscript:v166];
      *(v161 - 3) = [v167 unsignedCharValue];

      v168 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v169 = [v168 objectForKeyedSubscript:@"priConfig"];
      v170 = [v169 objectForKeyedSubscript:@"spect2hs1"];
      v171 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v172 = [v171 stringValue];
      v173 = [v170 objectForKeyedSubscript:v172];
      *(v161 - 2) = [v173 unsignedCharValue];

      v174 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v175 = [v174 objectForKeyedSubscript:@"priConfig"];
      v176 = [v175 objectForKeyedSubscript:@"spect1hs2"];
      v177 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v178 = [v177 stringValue];
      v179 = [v176 objectForKeyedSubscript:v178];
      *(v161 - 1) = [v179 unsignedCharValue];

      v180 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v181 = [v180 objectForKeyedSubscript:@"priConfig"];
      v182 = [v181 objectForKeyedSubscript:@"spect2hs2"];
      v183 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v184 = [v183 stringValue];
      v185 = [v182 objectForKeyedSubscript:v184];
      char *v161 = [v185 unsignedCharValue];

      v186 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v187 = [v186 objectForKeyedSubscript:@"priConfig"];
      v188 = [v187 objectForKeyedSubscript:@"spect1hp"];
      v189 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v190 = [v189 stringValue];
      v191 = [v188 objectForKeyedSubscript:v190];
      v161[1] = [v191 unsignedCharValue];

      v192 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v193 = [v192 objectForKeyedSubscript:@"priConfig"];
      v194 = [v193 objectForKeyedSubscript:@"spect2hp"];
      v195 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v196 = [v195 stringValue];
      v197 = [v194 objectForKeyedSubscript:v196];
      v161[2] = [v197 unsignedCharValue];

      v198 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v199 = [v198 objectForKeyedSubscript:@"priConfig"];
      v200 = [v199 objectForKeyedSubscript:@"spect1pepx"];
      v201 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v202 = [v201 stringValue];
      v203 = [v200 objectForKeyedSubscript:v202];
      v161[3] = [v203 unsignedCharValue];

      v204 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v205 = [v204 objectForKeyedSubscript:@"priConfig"];
      v206 = [v205 objectForKeyedSubscript:@"spect2pepx"];
      v207 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v160];
      v208 = [v207 stringValue];
      v209 = [v206 objectForKeyedSubscript:v208];
      v161[4] = [v209 unsignedCharValue];

      ++v160;
      v161 += 8;
    }
    while (v160 != 16);
  }
  else
  {
    uint64_t v210 = 0;
    v211 = (char *)&a3->var12.var0.var0[2].var0[3].var0[3].var0[1][0] + 1;
    do
    {
      v212 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v213 = [v212 objectForKeyedSubscript:@"priConfig"];
      v214 = [v213 objectForKeyedSubscript:@"spect1hs1"];
      v215 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v216 = [v215 stringValue];
      v217 = [v214 objectForKeyedSubscript:v216];
      *(v211 - 3) = [v217 unsignedCharValue];

      v218 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v219 = [v218 objectForKeyedSubscript:@"priConfig"];
      v220 = [v219 objectForKeyedSubscript:@"spect2hs1"];
      v221 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v222 = [v221 stringValue];
      v223 = [v220 objectForKeyedSubscript:v222];
      *(v211 - 2) = [v223 unsignedCharValue];

      v224 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v225 = [v224 objectForKeyedSubscript:@"priConfig"];
      v226 = [v225 objectForKeyedSubscript:@"spect1hs2"];
      v227 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v228 = [v227 stringValue];
      v229 = [v226 objectForKeyedSubscript:v228];
      *(v211 - 1) = [v229 unsignedCharValue];

      v230 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v231 = [v230 objectForKeyedSubscript:@"priConfig"];
      v232 = [v231 objectForKeyedSubscript:@"spect2hs2"];
      v233 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v234 = [v233 stringValue];
      v235 = [v232 objectForKeyedSubscript:v234];
      char *v211 = [v235 unsignedCharValue];

      v236 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v237 = [v236 objectForKeyedSubscript:@"priConfig"];
      v238 = [v237 objectForKeyedSubscript:@"spect1hp"];
      v239 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v240 = [v239 stringValue];
      v241 = [v238 objectForKeyedSubscript:v240];
      v211[1] = [v241 unsignedCharValue];

      v242 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v243 = [v242 objectForKeyedSubscript:@"priConfig"];
      v244 = [v243 objectForKeyedSubscript:@"spect2hp"];
      v245 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v246 = [v245 stringValue];
      v247 = [v244 objectForKeyedSubscript:v246];
      v211[2] = [v247 unsignedCharValue];

      v248 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v249 = [v248 objectForKeyedSubscript:@"priConfig"];
      v250 = [v249 objectForKeyedSubscript:@"spect1pepx"];
      v251 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v252 = [v251 stringValue];
      v253 = [v250 objectForKeyedSubscript:v252];
      v211[3] = [v253 unsignedCharValue];

      v254 = [v272 objectForKeyedSubscript:@"superFrameDataNormalBank"];
      v255 = [v254 objectForKeyedSubscript:@"priConfig"];
      v256 = [v255 objectForKeyedSubscript:@"spect2pepx"];
      v257 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v210];
      v258 = [v257 stringValue];
      v259 = [v256 objectForKeyedSubscript:v258];
      v211[4] = [v259 unsignedCharValue];

      ++v210;
      v211 += 8;
    }
    while (v210 != 12);
    *(_OWORD *)((char *)&a3->var12.var0.var0[2].var0[3].var0[5].var0[0][2] + 2) = 0u;
    *(_OWORD *)((char *)&a3->var12.var0.var0[2].var0[3].var0[5].var0[2][0] + 2) = 0u;
  }

  return 0;
}

- (int)extractDbgDataFor_gmoConfig:(GmoCfgBits *)a3 inIndex:(unsigned int)a4
{
  uint64_t v6 = a4;
  v7 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:a4];
  v8 = [v7 objectForKeyedSubscript:@"hasData"];
  char v9 = [v8 isEqual:MEMORY[0x263EFFA88]];

  if ((v9 & 1) == 0) {
    return 1;
  }
  uint64_t v10 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v6];
  v11 = [v10 valueForKey:@"init"];

  char v12 = [v11 objectForKeyedSubscript:@"config"];
  a3->all = [v12 unsignedIntValue];

  return 0;
}

- (int)extractDbgDataFor_gmoInit:(GmoInitInputs *)a3 inIndex:(unsigned int)a4
{
  uint64_t v6 = a4;
  v7 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:a4];
  v8 = [v7 objectForKeyedSubscript:@"hasData"];
  char v9 = [v8 isEqual:MEMORY[0x263EFFA88]];

  if (v9)
  {
    uint64_t v10 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v6];
    v11 = [v10 valueForKey:@"init"];

    char v12 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v6];
    v13 = [v12 objectForKeyedSubscript:@"metaDataVersion"];
    LODWORD(v10) = +[GmoDbgServices compareVersions:v13 toVersion:@"3.0.2"];

    if (v10 == 1)
    {
      v14 = [v11 objectForKeyedSubscript:@"pulseShapeSize"];
      a3->var0.var1 = [v14 unsignedShortValue];
    }
    else
    {
      a3->var0.var1 = 64;
    }
    operator new[]();
  }
  return 1;
}

- (int)extractDbgDataFor_gmoDebug:(GmoDebugData *)a3 inIndex:(unsigned int)a4
{
  uint64_t v6 = a4;
  v108 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:a4];
  v7 = [v108 objectForKeyedSubscript:@"hasData"];
  char v8 = [v7 isEqual:MEMORY[0x263EFFA88]];

  if ((v8 & 1) == 0) {
    return 1;
  }
  char v9 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:v6];
  v109 = [v9 valueForKey:@"debug"];

  uint64_t v110 = 0;
  unint64_t v10 = 0x263F08000uLL;
  v106 = a3;
  v11 = a3;
  do
  {
    uint64_t v12 = 0;
    v107 = v11;
    do
    {
      v13 = objc_msgSend(v109, "objectForKeyedSubscript:", @"operationalSpotLocations10m", v106);
      v14 = [*(id *)(v10 + 2584) numberWithUnsignedLong:v110];
      float v15 = [v14 stringValue];
      v16 = [v13 objectForKeyedSubscript:v15];
      v17 = [*(id *)(v10 + 2584) numberWithUnsignedLong:v12];
      v18 = [v17 stringValue];
      double v19 = [v16 objectForKeyedSubscript:v18];
      v20 = [v19 objectForKeyedSubscript:@"x"];
      [v20 floatValue];
      v11->var0.var0[0].var0[0].var0 = v21;

      v22 = [v109 objectForKeyedSubscript:@"operationalSpotLocations10m"];
      float v23 = [NSNumber numberWithUnsignedLong:v110];
      int v24 = [v23 stringValue];
      v25 = [v22 objectForKeyedSubscript:v24];
      int v26 = [NSNumber numberWithUnsignedLong:v12];
      v27 = [v26 stringValue];
      v28 = [v25 objectForKeyedSubscript:v27];
      v29 = [v28 objectForKeyedSubscript:@"y"];
      [v29 floatValue];
      v11->var0.var0[0].var0[0].var1 = v30;

      v31 = [v109 objectForKeyedSubscript:@"operationalSpotLocations70cm"];
      float v32 = [NSNumber numberWithUnsignedLong:v110];
      int v33 = [v32 stringValue];
      v34 = [v31 objectForKeyedSubscript:v33];
      uint64_t v35 = [NSNumber numberWithUnsignedLong:v12];
      v36 = [v35 stringValue];
      float v37 = [v34 objectForKeyedSubscript:v36];
      v38 = [v37 objectForKeyedSubscript:@"x"];
      [v38 floatValue];
      v11->var1.var0[0].var0[0].var0 = v39;

      v40 = [v109 objectForKeyedSubscript:@"operationalSpotLocations70cm"];
      v41 = [NSNumber numberWithUnsignedLong:v110];
      float v42 = [v41 stringValue];
      uint64_t v43 = [v40 objectForKeyedSubscript:v42];
      uint64_t v44 = [NSNumber numberWithUnsignedLong:v12];
      char v45 = [v44 stringValue];
      v46 = [v43 objectForKeyedSubscript:v45];
      v47 = [v46 objectForKeyedSubscript:@"y"];
      [v47 floatValue];
      v11->var1.var0[0].var0[0].var1 = v48;

      v49 = [v109 objectForKeyedSubscript:@"factorySpotLocations10m"];
      v50 = [NSNumber numberWithUnsignedLong:v110];
      v51 = [v50 stringValue];
      v52 = [v49 objectForKeyedSubscript:v51];
      float v53 = [NSNumber numberWithUnsignedLong:v12];
      v54 = [v53 stringValue];
      int v55 = [v52 objectForKeyedSubscript:v54];
      v56 = [v55 objectForKeyedSubscript:@"x"];
      [v56 floatValue];
      v11->var2.var0[0].var0[0].var0 = v57;

      v58 = [v109 objectForKeyedSubscript:@"factorySpotLocations10m"];
      v59 = [NSNumber numberWithUnsignedLong:v110];
      v60 = [v59 stringValue];
      v61 = [v58 objectForKeyedSubscript:v60];
      float v62 = [NSNumber numberWithUnsignedLong:v12];
      v63 = [v62 stringValue];
      int v64 = [v61 objectForKeyedSubscript:v63];
      float v65 = [v64 objectForKeyedSubscript:@"y"];
      [v65 floatValue];
      v11->var2.var0[0].var0[0].var1 = v66;

      v67 = [v109 objectForKeyedSubscript:@"factorySpotLocations70cm"];
      v68 = [NSNumber numberWithUnsignedLong:v110];
      uint64_t v69 = [v68 stringValue];
      v70 = [v67 objectForKeyedSubscript:v69];
      v71 = [NSNumber numberWithUnsignedLong:v12];
      int v72 = [v71 stringValue];
      uint64_t v73 = [v70 objectForKeyedSubscript:v72];
      char v74 = [v73 objectForKeyedSubscript:@"x"];
      [v74 floatValue];
      v11->var3.var0[0].var0[0].var0 = v75;

      v76 = [v109 objectForKeyedSubscript:@"factorySpotLocations70cm"];
      v77 = [NSNumber numberWithUnsignedLong:v110];
      int v78 = [v77 stringValue];
      v79 = [v76 objectForKeyedSubscript:v78];
      v80 = [NSNumber numberWithUnsignedLong:v12];
      v81 = [v80 stringValue];
      v82 = [v79 objectForKeyedSubscript:v81];
      v83 = [v82 objectForKeyedSubscript:@"y"];
      [v83 floatValue];
      v11->var3.var0[0].var0[0].var1 = v84;

      ++v12;
      v11 = (GmoDebugData *)((char *)v11 + 8);
      unint64_t v10 = 0x263F08000;
    }
    while (v12 != 14);
    v11 = (GmoDebugData *)&v107->var0.var0[1];
    ++v110;
  }
  while (v110 != 8);
  int v85 = [v109 objectForKeyedSubscript:@"operationalSpotLocations10m"];
  v86 = [v85 objectForKeyedSubscript:@"isSphere"];
  v106->var0.var2 = [v86 unsignedCharValue];

  int v87 = [v109 objectForKeyedSubscript:@"operationalSpotLocations10m"];
  v88 = [v87 objectForKeyedSubscript:@"calibDistance"];
  [v88 floatValue];
  v106->var0.var1 = v89;

  v90 = [v109 objectForKeyedSubscript:@"operationalSpotLocations70cm"];
  v91 = [v90 objectForKeyedSubscript:@"isSphere"];
  v106->var1.var2 = [v91 unsignedCharValue];

  v92 = [v109 objectForKeyedSubscript:@"operationalSpotLocations70cm"];
  v93 = [v92 objectForKeyedSubscript:@"calibDistance"];
  [v93 floatValue];
  v106->var1.var1 = v94;

  int v95 = [v109 objectForKeyedSubscript:@"factorySpotLocations10m"];
  uint64_t v96 = [v95 objectForKeyedSubscript:@"isSphere"];
  v106->var2.var2 = [v96 unsignedCharValue];

  v97 = [v109 objectForKeyedSubscript:@"factorySpotLocations10m"];
  v98 = [v97 objectForKeyedSubscript:@"calibDistance"];
  [v98 floatValue];
  v106->var2.var1 = v99;

  v100 = [v109 objectForKeyedSubscript:@"factorySpotLocations70cm"];
  v101 = [v100 objectForKeyedSubscript:@"isSphere"];
  v106->var3.var2 = [v101 unsignedCharValue];

  v102 = [v109 objectForKeyedSubscript:@"factorySpotLocations70cm"];
  v103 = [v102 objectForKeyedSubscript:@"calibDistance"];
  [v103 floatValue];
  v106->var3.var1 = v104;

  return 0;
}

- (void)addDbgDataFor_homogClassifier:(const GmoMetrics *)a3 estTols:(const EstTols *)a4
{
  id v52 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v52 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  id v53 = [MEMORY[0x263EFF9A0] dictionary];
  v7 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  char v8 = [v7 valueForKey:@"intermediate"];

  [v8 setValue:v53 forKey:@"homogClassifier"];
  *(float *)&double v9 = a3->var2;
  unint64_t v10 = [NSNumber numberWithFloat:v9];
  [v53 setObject:v10 forKeyedSubscript:@"nQualRatio"];

  *(float *)&double v11 = a3->var1;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  [v53 setObject:v12 forKeyedSubscript:@"avgCoverage"];

  *(float *)&double v13 = a3->var3;
  v14 = [NSNumber numberWithFloat:v13];
  [v53 setObject:v14 forKeyedSubscript:@"modelErrQualP95"];

  *(float *)&double v15 = a3->var6;
  v16 = [NSNumber numberWithFloat:v15];
  [v53 setObject:v16 forKeyedSubscript:@"calibErrQualP95"];

  *(float *)&double v17 = a3->var8;
  v18 = [NSNumber numberWithFloat:v17];
  [v53 setObject:v18 forKeyedSubscript:@"calibErrUnQualP95"];

  *(float *)&double v19 = a3->var10;
  v20 = [NSNumber numberWithFloat:v19];
  [v53 setObject:v20 forKeyedSubscript:@"calibErrQualP50"];

  *(float *)&double v21 = a3->var12;
  v22 = [NSNumber numberWithFloat:v21];
  [v53 setObject:v22 forKeyedSubscript:@"u0Tol"];

  *(float *)&double v23 = a3->var11;
  int v24 = [NSNumber numberWithFloat:v23];
  [v53 setObject:v24 forKeyedSubscript:@"v0Tol"];

  *(float *)&double v25 = a3->var0;
  int v26 = [NSNumber numberWithFloat:v25];
  [v53 setObject:v26 forKeyedSubscript:@"ambientLevel"];

  v27 = [MEMORY[0x263EFF9A0] dictionary];
  [v53 setValue:v27 forKey:@"nc"];
  v28 = [NSNumber numberWithUnsignedInt:a3->var13.var0];
  [v27 setObject:v28 forKeyedSubscript:@"countTopLeft"];

  v29 = [NSNumber numberWithUnsignedInt:a3->var13.var1];
  [v27 setObject:v29 forKeyedSubscript:@"countLeft"];

  float v30 = [NSNumber numberWithUnsignedInt:a3->var13.var2];
  [v27 setObject:v30 forKeyedSubscript:@"countBottomLeft"];

  v31 = [NSNumber numberWithUnsignedInt:a3->var13.var3];
  [v27 setObject:v31 forKeyedSubscript:@"countTop"];

  float v32 = [NSNumber numberWithUnsignedInt:a3->var13.var4];
  [v27 setObject:v32 forKeyedSubscript:@"countCenter"];

  int v33 = [NSNumber numberWithUnsignedInt:a3->var13.var5];
  [v27 setObject:v33 forKeyedSubscript:@"countBottom"];

  v34 = [NSNumber numberWithUnsignedInt:a3->var13.var6];
  [v27 setObject:v34 forKeyedSubscript:@"countTopRight"];

  uint64_t v35 = [NSNumber numberWithUnsignedInt:a3->var13.var7];
  [v27 setObject:v35 forKeyedSubscript:@"countRight"];

  v36 = [NSNumber numberWithUnsignedInt:a3->var13.var8];
  [v27 setObject:v36 forKeyedSubscript:@"countBottomRight"];

  float v37 = [MEMORY[0x263EFF9A0] dictionary];
  [v53 setValue:v37 forKey:@"estTols"];
  *(float *)&double v38 = a4->var0;
  float v39 = [NSNumber numberWithFloat:v38];
  [v37 setObject:v39 forKeyedSubscript:@"efl"];

  *(float *)&double v40 = a4->var1;
  v41 = [NSNumber numberWithFloat:v40];
  [v37 setObject:v41 forKeyedSubscript:@"u0"];

  *(float *)&double v42 = a4->var2;
  uint64_t v43 = [NSNumber numberWithFloat:v42];
  [v37 setObject:v43 forKeyedSubscript:@"v0"];

  *(float *)&double v44 = a4->var3;
  char v45 = [NSNumber numberWithFloat:v44];
  [v37 setObject:v45 forKeyedSubscript:@"tiltX"];

  *(float *)&double v46 = a4->var4;
  v47 = [NSNumber numberWithFloat:v46];
  [v37 setObject:v47 forKeyedSubscript:@"tiltY"];

  *(float *)&double v48 = a4->var5;
  v49 = [NSNumber numberWithFloat:v48];
  [v37 setObject:v49 forKeyedSubscript:@"tiltZ"];

  *(float *)&double v50 = a4->var6;
  v51 = [NSNumber numberWithFloat:v50];
  [v37 setObject:v51 forKeyedSubscript:@"count"];
}

- (void)addDbgDataFor_factorySpotLocation10m:(id *)a3
{
}

- (void)addDbgDataFor_operationalSpotLocation10m:(id *)a3
{
}

- (void)addDbgDataFor_factorySpotLocation70cm:(id *)a3
{
}

- (void)addDbgDataFor_operationalSpotLocation70cm:(id *)a3
{
}

- (void)addDbgDataFor_spotLocation:(id *)a3 withName:(id)a4
{
  id v26 = a4;
  uint64_t v6 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  v7 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  char v8 = [v7 valueForKey:@"debug"];

  v27 = [MEMORY[0x263EFF9A0] dictionary];
  *(float *)&double v9 = a3->var1;
  unint64_t v10 = [NSNumber numberWithFloat:v9];
  [v27 setObject:v10 forKeyedSubscript:@"calibDistance"];

  double v11 = [NSNumber numberWithUnsignedChar:a3->var2];
  [v27 setObject:v11 forKeyedSubscript:@"isSphere"];

  uint64_t v12 = 0;
  p_var1 = &a3->var0[0].var0[0].var1;
  do
  {
    uint64_t v29 = v12;
    v14 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v15 = 0;
    v28 = p_var1;
    v16 = p_var1;
    do
    {
      double v17 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v18 = *(v16 - 1);
      double v19 = [NSNumber numberWithFloat:v18];
      [v17 setObject:v19 forKeyedSubscript:@"x"];

      *(float *)&double v20 = *v16;
      double v21 = [NSNumber numberWithFloat:v20];
      [v17 setObject:v21 forKeyedSubscript:@"y"];

      v22 = [NSNumber numberWithUnsignedLong:v15];
      double v23 = [v22 stringValue];
      [v14 setObject:v17 forKeyedSubscript:v23];

      ++v15;
      v16 += 2;
    }
    while (v15 != 14);
    int v24 = [NSNumber numberWithUnsignedLong:v29];
    double v25 = [v24 stringValue];
    [v27 setObject:v14 forKeyedSubscript:v25];

    uint64_t v12 = v29 + 1;
    p_var1 = v28 + 28;
  }
  while (v29 != 7);
  [v8 setObject:v27 forKeyedSubscript:v26];
}

- (void)addDbgDataFor_gtErrP95:(const float *)a3 smoothedErrP95:(const float *)a4 gtErrP95Sop:(const float *)a5 smoothedErrP95Sop:(const float *)a6
{
  id v20 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  double v11 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  id v21 = [v11 valueForKey:@"debug"];

  *(float *)&double v12 = *a3;
  double v13 = [NSNumber numberWithFloat:v12];
  [v21 setObject:v13 forKeyedSubscript:@"globalErrP95"];

  *(float *)&double v14 = *a4;
  uint64_t v15 = [NSNumber numberWithFloat:v14];
  [v21 setObject:v15 forKeyedSubscript:@"smoothedErrP95"];

  *(float *)&double v16 = *a5;
  double v17 = [NSNumber numberWithFloat:v16];
  [v21 setObject:v17 forKeyedSubscript:@"globalErrP95Sop"];

  *(float *)&double v18 = *a6;
  double v19 = [NSNumber numberWithFloat:v18];
  [v21 setObject:v19 forKeyedSubscript:@"smoothedErrP95Sop"];
}

- (void)addDbgDataFor_itpQual:(const float *)a3 itpQualSop:(const float *)a4
{
  id v12 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  v7 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  id v13 = [v7 valueForKey:@"debug"];

  *(float *)&double v8 = *a3;
  double v9 = [NSNumber numberWithFloat:v8];
  [v13 setObject:v9 forKeyedSubscript:@"itpQual"];

  *(float *)&double v10 = *a4;
  double v11 = [NSNumber numberWithFloat:v10];
  [v13 setObject:v11 forKeyedSubscript:@"itpQualSop"];
}

- (void)addDbgDataFor_getAnchorsWithHysteresis:(id *)a3 currAnchors:(const PDAnchors *)a4 snrHysteresisPct:(float)a5 anchorsWithHist:(PDAnchors *)a6 violations:(spViolations *)a7 numOfClippedSpots:(unint64_t)a8 anchorMoveIdx:(void *)a9 spotLocationsAtRefDist:(id *)a10 numQualifiedSpot:(unint64_t)a11 anchorsShift:(PDAnchors *)a12 anchorsMoved:(unint64_t)a13
{
  id v109 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v109 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  id v110 = [MEMORY[0x263EFF9A0] dictionary];
  v108 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
  [v110 setValue:v108 forKey:@"in"];
  [v110 setValue:v19 forKey:@"out"];
  id v20 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  id v21 = [v20 valueForKey:@"intermediate"];

  v107 = v21;
  [v21 setValue:v110 forKey:@"getAnchorsWithHysteresis"];
  v116 = (void *)v19;
  v113 = a6;
  v106 = a7;
  int v115 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v22 = 0;
  p_var1 = &a3->var0[0].var0[0].var1;
  do
  {
    int v24 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v25 = 0;
    v121 = p_var1;
    id v26 = p_var1;
    do
    {
      v27 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v28 = *(v26 - 1);
      uint64_t v29 = [NSNumber numberWithFloat:v28];
      [v27 setObject:v29 forKeyedSubscript:@"x"];

      *(float *)&double v30 = *v26;
      v31 = [NSNumber numberWithFloat:v30];
      [v27 setObject:v31 forKeyedSubscript:@"y"];

      float v32 = [NSNumber numberWithUnsignedLong:v25];
      int v33 = [v32 stringValue];
      [v24 setObject:v27 forKeyedSubscript:v33];

      ++v25;
      v26 += 2;
    }
    while (v25 != 14);
    v34 = [NSNumber numberWithUnsignedLong:v22];
    uint64_t v35 = [v34 stringValue];
    [v115 setObject:v24 forKeyedSubscript:v35];

    ++v22;
    p_var1 = v121 + 28;
  }
  while (v22 != 8);
  [v108 setObject:v115 forKeyedSubscript:@"spotLocations"];
  v112 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v36 = 0;
  p_useNorthHS2 = &a4->banks[0].anchors[0].useNorthHS2;
  do
  {
    uint64_t v117 = v36;
    float v37 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v38 = 0;
    float v39 = (unsigned __int8 *)p_useNorthHS2;
    do
    {
      double v40 = [MEMORY[0x263EFF9A0] dictionary];
      v41 = [NSNumber numberWithChar:(char)*(v39 - 2)];
      [v40 setObject:v41 forKeyedSubscript:@"x"];

      double v42 = [NSNumber numberWithChar:(char)*(v39 - 1)];
      [v40 setObject:v42 forKeyedSubscript:@"y"];

      uint64_t v43 = [NSNumber numberWithBool:*v39];
      [v40 setObject:v43 forKeyedSubscript:@"useNorthHS2"];

      double v44 = [NSNumber numberWithUnsignedLong:v38];
      char v45 = [v44 stringValue];
      [v37 setObject:v40 forKeyedSubscript:v45];

      ++v38;
      v39 += 3;
    }
    while (v38 != 14);
    double v46 = [NSNumber numberWithUnsignedLong:v117];
    v47 = [v46 stringValue];
    [v112 setObject:v37 forKeyedSubscript:v47];

    uint64_t v36 = v117 + 1;
    p_useNorthHS2 += 42;
  }
  while (v117 != 7);
  [v108 setObject:v112 forKeyedSubscript:@"currAnchors"];
  *(float *)&double v48 = a5;
  v49 = [NSNumber numberWithFloat:v48];
  [v108 setValue:v49 forKey:@"snrHysteresisPct"];

  v111 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v50 = 0;
  v51 = &v113->banks[0].anchors[0].useNorthHS2;
  do
  {
    uint64_t v123 = v50;
    id v52 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v53 = 0;
    v118 = v51;
    v54 = (unsigned __int8 *)v51;
    do
    {
      int v55 = [MEMORY[0x263EFF9A0] dictionary];
      v56 = [NSNumber numberWithChar:(char)*(v54 - 2)];
      [v55 setObject:v56 forKeyedSubscript:@"x"];

      float v57 = [NSNumber numberWithChar:(char)*(v54 - 1)];
      [v55 setObject:v57 forKeyedSubscript:@"y"];

      v58 = [NSNumber numberWithBool:*v54];
      [v55 setObject:v58 forKeyedSubscript:@"useNorthHS2"];

      v59 = [NSNumber numberWithUnsignedLong:v53];
      v60 = [v59 stringValue];
      [v52 setObject:v55 forKeyedSubscript:v60];

      ++v53;
      v54 += 3;
    }
    while (v53 != 14);
    v61 = [NSNumber numberWithUnsignedLong:v123];
    float v62 = [v61 stringValue];
    [v111 setObject:v52 forKeyedSubscript:v62];

    uint64_t v50 = v123 + 1;
    v51 = v118 + 42;
  }
  while (v123 != 7);
  [v116 setObject:v111 forKeyedSubscript:@"anchorsWithHist"];
  v114 = [MEMORY[0x263EFF9A0] dictionary];
  v63 = [NSNumber numberWithBool:v106->var0];
  [v114 setObject:v63 forKeyedSubscript:@"violationFlag"];

  int v64 = &v106->var1[0][0].var1;
  uint64_t v65 = 0;
  do
  {
    uint64_t v124 = v65;
    float v66 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v67 = 0;
    v119 = v64;
    v68 = (unsigned __int8 *)v64;
    do
    {
      uint64_t v69 = [MEMORY[0x263EFF9A0] dictionary];
      v70 = [NSNumber numberWithBool:*(v68 - 1)];
      [v69 setObject:v70 forKeyedSubscript:@"boundaryFlag"];

      v71 = [NSNumber numberWithBool:*v68];
      [v69 setObject:v71 forKeyedSubscript:@"boundingBoxFlag"];

      int v72 = [NSNumber numberWithBool:v68[1]];
      [v69 setObject:v72 forKeyedSubscript:@"verticalSepFlag"];

      uint64_t v73 = [NSNumber numberWithBool:v68[2]];
      [v69 setObject:v73 forKeyedSubscript:@"nearestNeighborFlag"];

      char v74 = [NSNumber numberWithUnsignedLong:v67];
      float v75 = [v74 stringValue];
      [v66 setObject:v69 forKeyedSubscript:v75];

      ++v67;
      v68 += 4;
    }
    while (v67 != 14);
    v76 = [NSNumber numberWithUnsignedLong:v124];
    v77 = [v76 stringValue];
    [v114 setObject:v66 forKeyedSubscript:v77];

    uint64_t v65 = v124 + 1;
    int v64 = v119 + 56;
  }
  while (v124 != 7);
  [v116 setObject:v114 forKeyedSubscript:@"violations"];
  int v78 = [NSNumber numberWithUnsignedLong:a8];
  [v116 setObject:v78 forKeyedSubscript:@"numOfClippedSpots"];

  v79 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t i = 0; i != 8; ++i)
  {
    v81 = [MEMORY[0x263EFF9A0] dictionary];
    for (uint64_t j = 0; j != 14; ++j)
    {
      v83 = [MEMORY[0x263EFF9A0] dictionary];
      float v84 = [NSNumber numberWithBool:*((unsigned __int8 *)a9 + j)];
      [v83 setObject:v84 forKeyedSubscript:@"val"];

      int v85 = [NSNumber numberWithUnsignedLong:j];
      v86 = [v85 stringValue];
      [v81 setObject:v83 forKeyedSubscript:v86];
    }
    int v87 = [NSNumber numberWithUnsignedLong:i];
    v88 = [v87 stringValue];
    [v79 setObject:v81 forKeyedSubscript:v88];

    a9 = (char *)a9 + 14;
    unint64_t v89 = 0x263EFF000uLL;
  }
  [v116 setObject:v79 forKeyedSubscript:@"anchorMoveIdx"];
  v90 = [NSNumber numberWithUnsignedLong:a13];
  [v116 setObject:v90 forKeyedSubscript:@"anchorsMoved"];

  v91 = [NSNumber numberWithUnsignedLong:a11];
  [v116 setObject:v91 forKeyedSubscript:@"numQualSpots"];
  uint64_t v120 = v79;

  v125 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v92 = 0;
  v93 = &a10->var0[0].var0[0].var1;
  do
  {
    float v94 = [*(id *)(v89 + 2464) dictionary];
    uint64_t v95 = 0;
    v127 = v93;
    do
    {
      uint64_t v96 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v97 = *(v93 - 1);
      v98 = [NSNumber numberWithFloat:v97];
      [v96 setObject:v98 forKeyedSubscript:@"x"];

      *(float *)&double v99 = *v93;
      v100 = [NSNumber numberWithFloat:v99];
      [v96 setObject:v100 forKeyedSubscript:@"y"];

      v101 = [NSNumber numberWithUnsignedLong:v95];
      v102 = [v101 stringValue];
      [v94 setObject:v96 forKeyedSubscript:v102];

      ++v95;
      v93 += 2;
    }
    while (v95 != 14);
    v103 = [NSNumber numberWithUnsignedLong:v92];
    float v104 = [v103 stringValue];
    [v125 setObject:v94 forKeyedSubscript:v104];

    ++v92;
    v93 = v127 + 28;
    unint64_t v89 = 0x263EFF000;
  }
  while (v92 != 8);
  [v116 setObject:v125 forKeyedSubscript:@"spotLocationsAtRefDist"];
}

- (void)addDbgDataFor_globalEstimation:(id *)a3 spotLocationAtRefDist:(id *)a4 smoothedSNR:(PeridotSpotValues<common:(const void *)a6 :(void *)a7 PeridotSpotScalarValue<float>> *)a5 validSpotsIndexes:(GlobalEstimationCtrl *)a8 result:hCtrl:
{
  id v107 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v107 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  id v108 = [MEMORY[0x263EFF9A0] dictionary];
  v106 = [MEMORY[0x263EFF9A0] dictionary];
  int v105 = [MEMORY[0x263EFF9A0] dictionary];
  float v104 = [MEMORY[0x263EFF9A0] dictionary];
  [v108 setValue:v106 forKey:@"ctrl"];
  [v108 setValue:v105 forKey:@"in"];
  [v108 setValue:v104 forKey:@"out"];
  id v13 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  double v14 = [v13 valueForKey:@"intermediate"];

  v103 = v14;
  [v14 setValue:v108 forKey:@"globalEstimation"];
  uint64_t v15 = [NSNumber numberWithBool:a8->attemptHomog];
  [v106 setObject:v15 forKeyedSubscript:@"attemptHomog"];

  double v16 = [NSNumber numberWithBool:a8->doHomog];
  [v106 setObject:v16 forKeyedSubscript:@"doHomog"];

  double v17 = [NSNumber numberWithBool:a8->hDone];
  [v106 setObject:v17 forKeyedSubscript:@"hDone"];

  double v18 = [NSNumber numberWithBool:a8->hOk];
  [v106 setObject:v18 forKeyedSubscript:@"hOk"];

  v111 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v19 = 0;
  p_var1 = &a3->var0[0].var0[0].var1;
  do
  {
    uint64_t v117 = v19;
    id v21 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v22 = 0;
    v114 = p_var1;
    double v23 = p_var1;
    do
    {
      int v24 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v25 = *(v23 - 1);
      id v26 = [NSNumber numberWithFloat:v25];
      [v24 setObject:v26 forKeyedSubscript:@"x"];

      *(float *)&double v27 = *v23;
      double v28 = [NSNumber numberWithFloat:v27];
      [v24 setObject:v28 forKeyedSubscript:@"y"];

      uint64_t v29 = [NSNumber numberWithUnsignedLong:v22];
      double v30 = [v29 stringValue];
      [v21 setObject:v24 forKeyedSubscript:v30];

      ++v22;
      v23 += 2;
    }
    while (v22 != 14);
    v31 = [NSNumber numberWithUnsignedLong:v117];
    float v32 = [v31 stringValue];
    [v111 setObject:v21 forKeyedSubscript:v32];

    uint64_t v19 = v117 + 1;
    p_var1 = v114 + 28;
  }
  while (v117 != 7);
  [v105 setObject:v111 forKeyedSubscript:@"refLocations"];

  v112 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v33 = 0;
  v34 = &a4->var0[0].var0[0].var1;
  do
  {
    uint64_t v118 = v33;
    uint64_t v35 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v36 = 0;
    int v115 = v34;
    float v37 = v34;
    do
    {
      uint64_t v38 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v39 = *(v37 - 1);
      double v40 = [NSNumber numberWithFloat:v39];
      [v38 setObject:v40 forKeyedSubscript:@"x"];

      *(float *)&double v41 = *v37;
      double v42 = [NSNumber numberWithFloat:v41];
      [v38 setObject:v42 forKeyedSubscript:@"y"];

      uint64_t v43 = [NSNumber numberWithUnsignedLong:v36];
      double v44 = [v43 stringValue];
      [v35 setObject:v38 forKeyedSubscript:v44];

      ++v36;
      v37 += 2;
    }
    while (v36 != 14);
    char v45 = [NSNumber numberWithUnsignedLong:v118];
    double v46 = [v45 stringValue];
    [v112 setObject:v35 forKeyedSubscript:v46];

    uint64_t v33 = v118 + 1;
    v34 = v115 + 28;
  }
  while (v118 != 7);
  [v105 setObject:v112 forKeyedSubscript:@"spotLocationAtRefDist"];

  v47 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t i = 0; i != 8; ++i)
  {
    v49 = [MEMORY[0x263EFF9A0] dictionary];
    for (uint64_t j = 0; j != 14; ++j)
    {
      *(float *)&double v50 = a5->var0[0].var0[j].var0;
      id v52 = [NSNumber numberWithFloat:v50];
      uint64_t v53 = [NSNumber numberWithUnsignedLong:j];
      v54 = [v53 stringValue];
      [v49 setObject:v52 forKeyedSubscript:v54];
    }
    int v55 = [NSNumber numberWithUnsignedLong:i];
    v56 = [v55 stringValue];
    [v47 setObject:v49 forKeyedSubscript:v56];

    a5 = (PeridotSpotValues<common::PeridotSpotScalarValue<float>> *)((char *)a5 + 56);
  }
  [v105 setObject:v47 forKeyedSubscript:@"smoothedSNR"];

  float v57 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t k = 0; k != 8; ++k)
  {
    v59 = [MEMORY[0x263EFF9A0] dictionary];
    v60 = (char *)a6 + 24 * k;
    v61 = *(unsigned __int8 **)v60;
    float v62 = (unsigned __int8 *)*((void *)v60 + 1);
    if (*(unsigned __int8 **)v60 != v62)
    {
      int v63 = 0;
      do
      {
        int v64 = [NSNumber numberWithUnsignedChar:*v61];
        uint64_t v65 = [NSNumber numberWithUnsignedChar:v63];
        float v66 = [v65 stringValue];
        [v59 setObject:v64 forKeyedSubscript:v66];

        ++v63;
        ++v61;
      }
      while (v61 != v62);
    }
    uint64_t v67 = [NSNumber numberWithUnsignedInt:k];
    v68 = [v67 stringValue];
    [v57 setObject:v59 forKeyedSubscript:v68];
    unint64_t v69 = 0x263EFF000uLL;
  }
  [v105 setObject:v57 forKeyedSubscript:@"validSpotsIndexes"];

  v70 = [MEMORY[0x263EFF9A0] dictionary];
  v71 = [NSNumber numberWithUnsignedInt:*(unsigned int *)a7];
  [v70 setObject:v71 forKeyedSubscript:@"trials"];

  int v72 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a7 + 1)];
  [v70 setObject:v72 forKeyedSubscript:@"nInliers"];

  LODWORD(v73) = *((_DWORD *)a7 + 22);
  char v74 = [NSNumber numberWithFloat:v73];
  [v70 setObject:v74 forKeyedSubscript:@"modelError"];

  float v75 = [MEMORY[0x263EFF9A0] dictionary];
  if (*((_DWORD *)a7 + 7))
  {
    unint64_t v76 = 0;
    do
    {
      v77 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*((void *)a7 + 2) + 4 * v76)];
      int v78 = [NSNumber numberWithUnsignedInt:v76];
      v79 = [v78 stringValue];
      [v75 setObject:v77 forKeyedSubscript:v79];

      ++v76;
    }
    while (v76 < *((unsigned int *)a7 + 7));
  }
  [v70 setObject:v75 forKeyedSubscript:@"inliers"];
  v113 = v70;

  v80 = [MEMORY[0x263EFF9A0] dictionary];
  if (*((_DWORD *)a7 + 16))
  {
    uint64_t v81 = 0;
    do
    {
      v82 = [MEMORY[0x263EFF9A0] dictionary];
      v83 = [NSNumber numberWithUnsignedInt:v81];
      float v84 = [v83 stringValue];
      [v80 setObject:v82 forKeyedSubscript:v84];

      LODWORD(v85) = *((_DWORD *)a7 + 17);
      if (v85)
      {
        unint64_t v86 = 0;
        do
        {
          int v87 = [NSNumber numberWithDouble:*(double *)(*((void *)a7 + 7) + 8 * (v81 * v85) + 8 * v86)];
          v88 = [NSNumber numberWithUnsignedInt:v86];
          unint64_t v89 = [v88 stringValue];
          [v82 setObject:v87 forKeyedSubscript:v89];

          ++v86;
          unint64_t v85 = *((unsigned int *)a7 + 17);
        }
        while (v86 < v85);
      }

      uint64_t v81 = (v81 + 1);
    }
    while (v81 < *((_DWORD *)a7 + 16));
  }
  [v113 setObject:v80 forKeyedSubscript:@"hModel"];

  v116 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v90 = 0;
  v91 = (char *)a7 + 96;
  do
  {
    uint64_t v92 = [*(id *)(v69 + 2464) dictionary];
    uint64_t v93 = 0;
    v119 = v91;
    do
    {
      float v94 = [MEMORY[0x263EFF9A0] dictionary];
      LODWORD(v95) = *(v91 - 1);
      uint64_t v96 = [NSNumber numberWithFloat:v95];
      [v94 setObject:v96 forKeyedSubscript:@"x"];

      LODWORD(v97) = *v91;
      v98 = [NSNumber numberWithFloat:v97];
      [v94 setObject:v98 forKeyedSubscript:@"y"];

      double v99 = [NSNumber numberWithUnsignedLong:v93];
      v100 = [v99 stringValue];
      [v92 setObject:v94 forKeyedSubscript:v100];

      ++v93;
      v91 += 2;
    }
    while (v93 != 14);
    v101 = [NSNumber numberWithUnsignedLong:v90];
    [v101 stringValue];
    v102 = unint64_t v69 = 0x263EFF000;
    [v116 setObject:v92 forKeyedSubscript:v102];

    ++v90;
    v91 = v119 + 28;
  }
  while (v90 != 8);
  [v113 setObject:v116 forKeyedSubscript:@"newSpotLocAtRefDist"];
  [v104 setObject:v113 forKeyedSubscript:@"result"];
}

- (void)addDbgDataFor_findSpotLocation:(SpecsResults *)a3 withAnchors:(const SpConfig *)a4 spotLocationEstimation:(void *)a5 outBound:(void *)a6
{
  id v79 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v79 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  id v80 = [MEMORY[0x263EFF9A0] dictionary];
  int v78 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  [v80 setValue:v78 forKey:@"in"];
  [v80 setValue:v10 forKey:@"out"];
  double v11 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  id v12 = [v11 valueForKey:@"intermediate"];

  unint64_t v76 = v12;
  [v12 setValue:v80 forKey:@"findSpotLocation"];
  v77 = [MEMORY[0x263EFF9A0] dictionary];
  char v74 = (char *)a6;
  float v75 = (char *)a5;
  unint64_t v85 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v13 = 0;
  uint64_t v81 = a3;
  double v14 = a3->var0[0][1];
  float v84 = (void *)v10;
  do
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v16 = 0;
    double v17 = v14;
    do
    {
      double v18 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v19 = *(v17 - 14);
      id v20 = [NSNumber numberWithFloat:v19];
      id v21 = [NSNumber numberWithUnsignedLong:0];
      uint64_t v22 = [v21 stringValue];
      [v18 setObject:v20 forKeyedSubscript:v22];

      *(float *)&double v23 = *v17;
      int v24 = [NSNumber numberWithFloat:v23];
      double v25 = [NSNumber numberWithUnsignedLong:1];
      id v26 = [v25 stringValue];
      [v18 setObject:v24 forKeyedSubscript:v26];

      *(float *)&double v27 = v17[14];
      double v28 = [NSNumber numberWithFloat:v27];
      uint64_t v29 = [NSNumber numberWithUnsignedLong:2];
      double v30 = [v29 stringValue];
      [v18 setObject:v28 forKeyedSubscript:v30];

      v31 = [NSNumber numberWithUnsignedLong:v16];
      float v32 = [v31 stringValue];
      [v15 setObject:v18 forKeyedSubscript:v32];

      ++v16;
      v17 += 42;
    }
    while (v16 != 4);
    uint64_t v33 = [NSNumber numberWithUnsignedLong:v13];
    v34 = [v33 stringValue];
    [v85 setObject:v15 forKeyedSubscript:v34];

    ++v13;
    ++v14;
  }
  while (v13 != 14);
  [v77 setObject:v85 forKeyedSubscript:@"specQs"];
  v83 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t i = 0; i != 14; ++i)
  {
    *(float *)&double v35 = v81->var1[i];
    float v37 = [NSNumber numberWithFloat:v35];
    uint64_t v38 = [NSNumber numberWithUnsignedLong:i];
    double v39 = [v38 stringValue];
    [v83 setObject:v37 forKeyedSubscript:v39];
  }
  [v77 setObject:v83 forKeyedSubscript:@"specSnr"];
  double v40 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t j = 0; j != 14; ++j)
  {
    double v42 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v43 = [NSNumber numberWithBool:v81->var2[0][j]];
    double v44 = [NSNumber numberWithUnsignedLong:0];
    char v45 = [v44 stringValue];
    [v42 setObject:v43 forKeyedSubscript:v45];

    double v46 = [NSNumber numberWithBool:v81->var2[1][j]];
    v47 = [NSNumber numberWithUnsignedLong:1];
    double v48 = [v47 stringValue];
    [v42 setObject:v46 forKeyedSubscript:v48];

    v49 = [NSNumber numberWithUnsignedLong:j];
    double v50 = [v49 stringValue];
    [v40 setObject:v42 forKeyedSubscript:v50];
  }
  [v77 setObject:v40 forKeyedSubscript:@"specQsValid"];
  [v78 setObject:v77 forKeyedSubscript:@"specsOut"];
  v82 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t k = 0; k != 14; ++k)
  {
    id v52 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v53 = [NSNumber numberWithChar:a4->var0[k]];
    [v52 setObject:v53 forKeyedSubscript:@"x"];

    v54 = [NSNumber numberWithChar:a4->var1[k]];
    [v52 setObject:v54 forKeyedSubscript:@"y"];

    int v55 = [NSNumber numberWithBool:a4->var2[k]];
    [v52 setObject:v55 forKeyedSubscript:@"useNorthHS2"];

    v56 = [NSNumber numberWithUnsignedLong:k];
    float v57 = [v56 stringValue];
    [v82 setObject:v52 forKeyedSubscript:v57];
  }
  [v78 setObject:v82 forKeyedSubscript:@"anchors"];
  int v87 = v40;
  v58 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v59 = 0;
  v60 = (double *)(v75 + 8);
  do
  {
    v61 = [MEMORY[0x263EFF9A0] dictionary];
    float v62 = [NSNumber numberWithDouble:*(v60 - 1)];
    [v61 setObject:v62 forKeyedSubscript:@"x"];

    int v63 = [NSNumber numberWithDouble:*v60];
    [v61 setObject:v63 forKeyedSubscript:@"y"];

    int v64 = [NSNumber numberWithUnsignedLong:v59];
    uint64_t v65 = [v64 stringValue];
    [v58 setObject:v61 forKeyedSubscript:v65];

    ++v59;
    v60 += 2;
  }
  while (v59 != 14);
  [v84 setObject:v58 forKeyedSubscript:@"spotLocationEstimation"];
  float v66 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v67 = 0;
  v68 = (unsigned __int8 *)(v74 + 1);
  do
  {
    unint64_t v69 = [MEMORY[0x263EFF9A0] dictionary];
    v70 = [NSNumber numberWithBool:*(v68 - 1)];
    [v69 setObject:v70 forKeyedSubscript:@"outBound0"];

    v71 = [NSNumber numberWithBool:*v68];
    [v69 setObject:v71 forKeyedSubscript:@"outBound1"];

    int v72 = [NSNumber numberWithUnsignedLong:v67];
    double v73 = [v72 stringValue];
    [v66 setObject:v69 forKeyedSubscript:v73];

    ++v67;
    v68 += 2;
  }
  while (v67 != 14);
  [v84 setObject:v66 forKeyedSubscript:@"outBound"];
}

- (void)addDbgDataFor_gmoBankOutput:(id *)a3 anchorsWithHist:(const PDAnchors *)a4 spotLocationsAtRefDist:(id *)a5
{
  id v52 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v52 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  id v53 = [MEMORY[0x263EFF9A0] dictionary];
  double v9 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v9 setObject:v53 forKeyedSubscript:@"output"];
  v56 = a4;
  v51 = a5;

  int v55 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = 0;
  p_var1 = &a3->var0[0].var0[0].var1;
  do
  {
    id v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v51);
    uint64_t v13 = 0;
    uint64_t v59 = p_var1;
    do
    {
      double v14 = [MEMORY[0x263EFF9A0] dictionary];
      *(float *)&double v15 = *(p_var1 - 1);
      uint64_t v16 = [NSNumber numberWithFloat:v15];
      [v14 setObject:v16 forKeyedSubscript:@"x"];

      *(float *)&double v17 = *p_var1;
      double v18 = [NSNumber numberWithFloat:v17];
      [v14 setObject:v18 forKeyedSubscript:@"y"];

      double v19 = [NSNumber numberWithUnsignedLong:v13];
      id v20 = [v19 stringValue];
      [v12 setObject:v14 forKeyedSubscript:v20];

      ++v13;
      p_var1 += 2;
    }
    while (v13 != 14);
    id v21 = [NSNumber numberWithUnsignedLong:v10];
    uint64_t v22 = [v21 stringValue];
    [v55 setObject:v12 forKeyedSubscript:v22];

    ++v10;
    p_var1 = v59 + 28;
  }
  while (v10 != 8);
  [v53 setObject:v55 forKeyedSubscript:@"smoothedSpotLocations"];
  v54 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v23 = 0;
  p_useNorthHS2 = (unsigned __int8 *)&v56->banks[0].anchors[0].useNorthHS2;
  do
  {
    uint64_t v60 = v23;
    double v25 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v26 = 0;
    float v57 = p_useNorthHS2;
    do
    {
      double v27 = [MEMORY[0x263EFF9A0] dictionary];
      double v28 = [NSNumber numberWithChar:(char)*(p_useNorthHS2 - 2)];
      [v27 setObject:v28 forKeyedSubscript:@"x"];

      uint64_t v29 = [NSNumber numberWithChar:(char)*(p_useNorthHS2 - 1)];
      [v27 setObject:v29 forKeyedSubscript:@"y"];

      double v30 = [NSNumber numberWithBool:*p_useNorthHS2];
      [v27 setObject:v30 forKeyedSubscript:@"useNorthHS2"];

      v31 = [NSNumber numberWithUnsignedLong:v26];
      float v32 = [v31 stringValue];
      [v25 setObject:v27 forKeyedSubscript:v32];

      ++v26;
      p_useNorthHS2 += 3;
    }
    while (v26 != 14);
    uint64_t v33 = [NSNumber numberWithUnsignedLong:v60];
    v34 = [v33 stringValue];
    [v54 setObject:v25 forKeyedSubscript:v34];

    uint64_t v23 = v60 + 1;
    p_useNorthHS2 = v57 + 42;
  }
  while (v60 != 7);
  [v53 setObject:v54 forKeyedSubscript:@"anchors"];
  v58 = [MEMORY[0x263EFF9A0] dictionary];
  *(float *)&double v35 = v51->var1;
  uint64_t v36 = [NSNumber numberWithFloat:v35];
  [v58 setObject:v36 forKeyedSubscript:@"calibDistance"];

  float v37 = [NSNumber numberWithUnsignedChar:v51->var2];
  [v58 setObject:v37 forKeyedSubscript:@"isSphere"];

  uint64_t v38 = 0;
  double v39 = (_DWORD *)&v51->var0[0].var0[0].var1;
  do
  {
    double v40 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v41 = 0;
    v61 = v39;
    do
    {
      double v42 = [MEMORY[0x263EFF9A0] dictionary];
      LODWORD(v43) = *(v39 - 1);
      double v44 = [NSNumber numberWithFloat:v43];
      [v42 setObject:v44 forKeyedSubscript:@"x"];

      LODWORD(v45) = *v39;
      double v46 = [NSNumber numberWithFloat:v45];
      [v42 setObject:v46 forKeyedSubscript:@"y"];

      v47 = [NSNumber numberWithUnsignedLong:v41];
      double v48 = [v47 stringValue];
      [v40 setObject:v42 forKeyedSubscript:v48];

      ++v41;
      v39 += 2;
    }
    while (v41 != 14);
    v49 = [NSNumber numberWithUnsignedLong:v38];
    double v50 = [v49 stringValue];
    [v58 setObject:v40 forKeyedSubscript:v50];

    ++v38;
    double v39 = v61 + 28;
  }
  while (v38 != 8);
  [v53 setObject:v58 forKeyedSubscript:@"globalSpotLocations"];
}

- (void)addDbgDataFor_gmoBankInput:(const GmoProcessBankInputs *)a3
{
  id v157 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v157 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  v4 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  id v158 = [v4 valueForKey:@"input"];

  char v5 = [NSNumber numberWithLong:a3->var0];
  [v158 setObject:v5 forKeyedSubscript:@"bankId"];

  uint64_t v6 = [NSNumber numberWithLong:a3->var1];
  [v158 setObject:v6 forKeyedSubscript:@"bankIndx"];

  v7 = [NSNumber numberWithLong:a3->var2];
  [v158 setObject:v7 forKeyedSubscript:@"frameIdx"];

  double v8 = [NSNumber numberWithLong:a3->var3];
  [v158 setObject:v8 forKeyedSubscript:@"phaseNum"];

  double v9 = [NSNumber numberWithLong:a3->var4];
  [v158 setObject:v9 forKeyedSubscript:@"priNum"];

  uint64_t v10 = [NSNumber numberWithLong:a3->var6];
  [v158 setObject:v10 forKeyedSubscript:@"cfgUpdateId"];

  *(float *)&double v11 = a3->var7;
  id v12 = [NSNumber numberWithFloat:v11];
  [v158 setObject:v12 forKeyedSubscript:@"sensorTemperature"];

  uint64_t v13 = [NSNumber numberWithDouble:a3->var8];
  [v158 setObject:v13 forKeyedSubscript:@"timestamp"];

  double v14 = [NSNumber numberWithBool:a3->var9];
  [v158 setObject:v14 forKeyedSubscript:@"internalFwError"];

  v154 = [MEMORY[0x263EFF9A0] dictionary];
  *(float *)&double v15 = a3->var5[0];
  uint64_t v16 = [NSNumber numberWithFloat:v15];
  double v17 = [NSNumber numberWithUnsignedLong:0];
  double v18 = [v17 stringValue];
  [v154 setObject:v16 forKeyedSubscript:v18];

  *(float *)&double v19 = a3->var5[1];
  id v20 = [NSNumber numberWithFloat:v19];
  id v21 = [NSNumber numberWithUnsignedLong:1];
  uint64_t v22 = [v21 stringValue];
  [v154 setObject:v20 forKeyedSubscript:v22];

  *(float *)&double v23 = a3->var5[2];
  int v24 = [NSNumber numberWithFloat:v23];
  double v25 = [NSNumber numberWithUnsignedLong:2];
  uint64_t v26 = [v25 stringValue];
  [v154 setObject:v24 forKeyedSubscript:v26];

  [v158 setObject:v154 forKeyedSubscript:@"lsb"];
  uint64_t v160 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v27 = 0;
  double v28 = &a3->var10.var0[0].var0[1][2];
  do
  {
    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
    double v30 = [MEMORY[0x263EFF9A0] dictionary];
    *(float *)&double v31 = *(v28 - 4);
    float v32 = [NSNumber numberWithFloat:v31];
    [v30 setObject:v32 forKeyedSubscript:@"confidence"];

    *(float *)&double v33 = *(v28 - 5);
    v34 = [NSNumber numberWithFloat:v33];
    [v30 setObject:v34 forKeyedSubscript:@"tof"];

    *(float *)&double v35 = *(v28 - 3);
    uint64_t v36 = [NSNumber numberWithFloat:v35];
    [v30 setObject:v36 forKeyedSubscript:@"na"];

    float v37 = [NSNumber numberWithUnsignedShort:0];
    uint64_t v38 = [v37 stringValue];
    [v29 setObject:v30 forKeyedSubscript:v38];

    double v39 = [MEMORY[0x263EFF9A0] dictionary];
    *(float *)&double v40 = *(v28 - 1);
    uint64_t v41 = [NSNumber numberWithFloat:v40];
    [v39 setObject:v41 forKeyedSubscript:@"confidence"];

    *(float *)&double v42 = *(v28 - 2);
    double v43 = [NSNumber numberWithFloat:v42];
    [v39 setObject:v43 forKeyedSubscript:@"tof"];

    *(float *)&double v44 = *v28;
    double v45 = [NSNumber numberWithFloat:v44];
    [v39 setObject:v45 forKeyedSubscript:@"na"];

    double v46 = [NSNumber numberWithUnsignedShort:1];
    v47 = [v46 stringValue];
    [v29 setObject:v39 forKeyedSubscript:v47];

    double v48 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v27];
    v49 = [v48 stringValue];
    [v160 setObject:v29 forKeyedSubscript:v49];

    ++v27;
    v28 += 6;
  }
  while (v27 != 14);
  [v158 setObject:v160 forKeyedSubscript:@"userOutput"];
  int v159 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v50 = 0;
  v51 = &a3->var10.var0[7].var0[2][1];
  do
  {
    id v52 = [MEMORY[0x263EFF9A0] dictionary];
    id v53 = [MEMORY[0x263EFF9A0] dictionary];
    v54 = [MEMORY[0x263EFF9A0] dictionary];
    int v55 = [MEMORY[0x263EFF9A0] dictionary];
    *(float *)&double v56 = *(v51 - 6);
    float v57 = [NSNumber numberWithFloat:v56];
    [v55 setObject:v57 forKeyedSubscript:@"confidence"];

    *(float *)&double v58 = *(v51 - 7);
    uint64_t v59 = [NSNumber numberWithFloat:v58];
    [v55 setObject:v59 forKeyedSubscript:@"tof"];

    uint64_t v60 = [NSNumber numberWithUnsignedShort:0];
    v61 = [v60 stringValue];
    [v53 setObject:v55 forKeyedSubscript:v61];

    float v62 = [MEMORY[0x263EFF9A0] dictionary];
    *(float *)&double v63 = *(v51 - 2);
    int v64 = [NSNumber numberWithFloat:v63];
    [v62 setObject:v64 forKeyedSubscript:@"confidence"];

    *(float *)&double v65 = *(v51 - 3);
    float v66 = [NSNumber numberWithFloat:v65];
    [v62 setObject:v66 forKeyedSubscript:@"tof"];

    uint64_t v67 = [NSNumber numberWithUnsignedShort:0];
    v68 = [v67 stringValue];
    [v54 setObject:v62 forKeyedSubscript:v68];

    unint64_t v69 = [MEMORY[0x263EFF9A0] dictionary];
    *(float *)&double v70 = *(v51 - 4);
    v71 = [NSNumber numberWithFloat:v70];
    [v69 setObject:v71 forKeyedSubscript:@"confidence"];

    *(float *)&double v72 = *(v51 - 5);
    double v73 = [NSNumber numberWithFloat:v72];
    [v69 setObject:v73 forKeyedSubscript:@"tof"];

    char v74 = [NSNumber numberWithUnsignedShort:1];
    float v75 = [v74 stringValue];
    [v53 setObject:v69 forKeyedSubscript:v75];

    unint64_t v76 = [MEMORY[0x263EFF9A0] dictionary];
    *(float *)&double v77 = *v51;
    int v78 = [NSNumber numberWithFloat:v77];
    [v76 setObject:v78 forKeyedSubscript:@"confidence"];

    *(float *)&double v79 = *(v51 - 1);
    id v80 = [NSNumber numberWithFloat:v79];
    [v76 setObject:v80 forKeyedSubscript:@"tof"];

    uint64_t v81 = [NSNumber numberWithUnsignedShort:1];
    v82 = [v81 stringValue];
    [v54 setObject:v76 forKeyedSubscript:v82];

    [v52 setObject:v53 forKeyedSubscript:@"hs"];
    [v52 setObject:v54 forKeyedSubscript:@"hp"];
    v83 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v50];
    float v84 = [v83 stringValue];
    [v159 setObject:v52 forKeyedSubscript:v84];

    ++v50;
    v51 += 8;
  }
  while (v50 != 14);
  [v158 setObject:v159 forKeyedSubscript:@"spotDepth"];
  v152 = [MEMORY[0x263EFF9A0] dictionary];
  v153 = [MEMORY[0x263EFF9A0] dictionary];
  if (a3->var4)
  {
    unsigned __int16 v155 = 0;
    do
    {
      unint64_t v85 = [MEMORY[0x263EFF9A0] dictionary];
      v162 = v85;
      if (a3->var3)
      {
        int v86 = 0;
        do
        {
          v167 = [MEMORY[0x263EFF9A0] dictionary];
          uint64_t v87 = 0;
          int v165 = v86;
          v88 = a3->var11.var0[56 * v155 + 2 + 14 * (unsigned __int16)v86].var0[2];
          do
          {
            unint64_t v89 = [MEMORY[0x263EFF9A0] dictionary];
            uint64_t v90 = 0;
            v91 = v88;
            do
            {
              uint64_t v92 = [MEMORY[0x263EFF9A0] dictionary];
              *(float *)&double v93 = *(v91 - 2);
              float v94 = [NSNumber numberWithFloat:v93];
              double v95 = [NSNumber numberWithUnsignedShort:0];
              uint64_t v96 = [v95 stringValue];
              [v92 setObject:v94 forKeyedSubscript:v96];

              *(float *)&double v97 = *(v91 - 1);
              v98 = [NSNumber numberWithFloat:v97];
              double v99 = [NSNumber numberWithUnsignedShort:1];
              v100 = [v99 stringValue];
              [v92 setObject:v98 forKeyedSubscript:v100];

              *(float *)&double v101 = *v91;
              v102 = [NSNumber numberWithFloat:v101];
              v103 = [NSNumber numberWithUnsignedShort:2];
              float v104 = [v103 stringValue];
              [v92 setObject:v102 forKeyedSubscript:v104];

              int v105 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v90];
              v106 = [v105 stringValue];
              [v89 setObject:v92 forKeyedSubscript:v106];

              ++v90;
              v91 += 3;
            }
            while (v90 != 4);
            id v107 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v87];
            id v108 = [v107 stringValue];
            [v167 setObject:v89 forKeyedSubscript:v108];

            ++v87;
            v88 += 12;
          }
          while (v87 != 14);
          id v109 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v165];
          unint64_t v85 = v162;
          id v110 = [v109 stringValue];
          [v162 setObject:v167 forKeyedSubscript:v110];

          int v86 = v165 + 1;
        }
        while (a3->var3 > (unsigned __int16)(v165 + 1));
      }
      v111 = [NSNumber numberWithUnsignedShort:v155];
      v112 = [v111 stringValue];
      [v153 setObject:v85 forKeyedSubscript:v112];

      ++v155;
    }
    while (a3->var4 > v155);
  }
  [v152 setObject:v153 forKeyedSubscript:@"specs"];
  v168 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t i = 0; i != 14; ++i)
  {
    v114 = [MEMORY[0x263EFF9A0] dictionary];
    int v115 = [NSNumber numberWithChar:*((char *)&a3->var12.var0.var0[2].var0[3].var0[2].var0[1][1] + i)];
    [v114 setObject:v115 forKeyedSubscript:@"spx"];

    v116 = [NSNumber numberWithChar:*((char *)&a3->var12.var0.var0[2].var0[3].var0[2].var0[2][1] + i + 2)];
    [v114 setObject:v116 forKeyedSubscript:@"spy"];

    uint64_t v117 = [NSNumber numberWithBool:*((unsigned __int8 *)&a3->var12.var0.var0[2].var0[3].var0[2].var0[3][2] + i)];
    [v114 setObject:v117 forKeyedSubscript:@"useNorthHS2"];

    uint64_t v118 = [NSNumber numberWithUnsignedLong:i];
    v119 = [v118 stringValue];
    [v168 setObject:v114 forKeyedSubscript:v119];
  }
  [v152 setObject:v168 forKeyedSubscript:@"spConfig"];
  uint64_t v120 = [MEMORY[0x263EFF9A0] dictionary];
  v166 = [MEMORY[0x263EFF9A0] dictionary];
  v163 = [MEMORY[0x263EFF9A0] dictionary];
  v161 = [MEMORY[0x263EFF9A0] dictionary];
  v156 = [MEMORY[0x263EFF9A0] dictionary];
  v121 = [MEMORY[0x263EFF9A0] dictionary];
  v122 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v123 = [MEMORY[0x263EFF9A0] dictionary];
  v151 = (void *)v120;
  uint64_t v124 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v125 = 0;
  v126 = (unsigned __int8 *)&a3->var12.var0.var0[2].var0[3].var0[3].var0[1][0] + 1;
  do
  {
    v127 = [NSNumber numberWithUnsignedChar:*(v126 - 3)];
    v128 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v129 = [v128 stringValue];
    [v166 setObject:v127 forKeyedSubscript:v129];

    v130 = [NSNumber numberWithUnsignedChar:*(v126 - 2)];
    v131 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v132 = [v131 stringValue];
    [v163 setObject:v130 forKeyedSubscript:v132];

    v133 = [NSNumber numberWithUnsignedChar:*(v126 - 1)];
    v134 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v135 = [v134 stringValue];
    [v161 setObject:v133 forKeyedSubscript:v135];

    float v136 = [NSNumber numberWithUnsignedChar:*v126];
    uint64_t v137 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v138 = [v137 stringValue];
    [v156 setObject:v136 forKeyedSubscript:v138];

    v139 = [NSNumber numberWithUnsignedChar:v126[1]];
    v140 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v141 = [v140 stringValue];
    [v121 setObject:v139 forKeyedSubscript:v141];

    v142 = [NSNumber numberWithUnsignedChar:v126[2]];
    v143 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v144 = [v143 stringValue];
    [v122 setObject:v142 forKeyedSubscript:v144];

    v145 = [NSNumber numberWithUnsignedChar:v126[3]];
    v146 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v147 = [v146 stringValue];
    [v123 setObject:v145 forKeyedSubscript:v147];

    v148 = [NSNumber numberWithUnsignedChar:v126[4]];
    v149 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v125];
    v150 = [v149 stringValue];
    [v124 setObject:v148 forKeyedSubscript:v150];

    ++v125;
    v126 += 8;
  }
  while (v125 != 16);
  [v151 setObject:v166 forKeyedSubscript:@"spect1hs1"];
  [v151 setObject:v163 forKeyedSubscript:@"spect2hs1"];
  [v151 setObject:v161 forKeyedSubscript:@"spect1hs2"];
  [v151 setObject:v156 forKeyedSubscript:@"spect2hs2"];
  [v151 setObject:v121 forKeyedSubscript:@"spect1hp"];
  [v151 setObject:v122 forKeyedSubscript:@"spect2hp"];
  [v151 setObject:v123 forKeyedSubscript:@"spect1pepx"];
  [v151 setObject:v124 forKeyedSubscript:@"spect2pepx"];
  [v152 setObject:v151 forKeyedSubscript:@"priConfig"];
  [v158 setObject:v152 forKeyedSubscript:@"superFrameDataNormalBank"];
}

- (void)addDbgDataFor_gmoConfig:(GmoCfgBits *)a3
{
  char v5 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  uint64_t v6 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  id v8 = [v6 objectForKeyedSubscript:@"init"];

  v7 = [NSNumber numberWithUnsignedInt:a3->all];
  [v8 setObject:v7 forKeyedSubscript:@"config"];
}

- (void)addDbgDataFor_gmoInit:(GmoInitInputs *)a3
{
  id v13 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasData"];

  id v14 = [MEMORY[0x263EFF9A0] dictionary];
  char v5 = [(NSMutableArray *)self->_gmoMetaData objectAtIndexedSubscript:self->_bankNumInHomogCycle];
  [v5 setObject:v14 forKeyedSubscript:@"init"];

  [v14 setObject:0 forKeyedSubscript:@"config"];
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  [v14 setObject:v6 forKeyedSubscript:@"pulseShape"];
  v7 = [NSNumber numberWithUnsignedShort:a3->var0.var1];
  [v14 setObject:v7 forKeyedSubscript:@"pulseShapeSize"];

  if (a3->var0.var1)
  {
    unint64_t v9 = 0;
    do
    {
      *(float *)&double v8 = a3->var0.var0[v9];
      uint64_t v10 = [NSNumber numberWithFloat:v8];
      double v11 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v9];
      id v12 = [v11 stringValue];
      [v6 setValue:v10 forKey:v12];

      ++v9;
    }
    while (v9 < a3->var0.var1);
  }
}

- (void)readMetaDataFromXML:(id)a3
{
  id v6 = a3;
  v4 = (NSMutableArray *)[v6 mutableCopy];
  gmoMetaData = self->_gmoMetaData;
  self->_gmoMetaData = v4;
}

- (void)dumpMetaDataAsXML:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263EFFA80];
  for (id i = v4; ; v4 = i)
  {
    id v6 = [v4 lastObject];
    v7 = [v6 objectForKeyedSubscript:@"hasData"];
    int v8 = [v7 isEqual:v5];

    if (!v8) {
      break;
    }
    [i removeLastObject];
  }
  [(GmoRecorder *)self->_recorder addRecWithObject:i];
}

- (void)endOfSession
{
  self->_bankNumInHomogCycle = 0;
  self->_bankNumSinceRecStart = 0;
}

- (void)endOfHomogCycle
{
  objc_storeStrong((id *)&self->_gmoMetaDataForRecording, self->_gmoMetaData);
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:480];
  gmoMetaData = self->_gmoMetaData;
  self->_gmoMetaData = v3;

  uint64_t v5 = self->_gmoMetaData;
  id v6 = [(GmoDbgServices *)self createNewMetaDataDict];
  [(NSMutableArray *)v5 addObject:v6];

  self->_writingToDisuint64_t k = 1;
  self->_numOfHomogCylceForRecording = self->_numOfHomogCylce;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__GmoDbgServices_endOfHomogCycle__block_invoke;
  block[3] = &unk_265447860;
  block[4] = self;
  dispatch_async(queue, block);
  unsigned int v8 = self->_numOfHomogCylce + 1;
  self->_bankNumInHomogCycle = 0;
  self->_numOfHomogCylce = v8;
}

uint64_t __33__GmoDbgServices_endOfHomogCycle__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recStart];
  [*(id *)(a1 + 32) dumpMetaDataAsXML:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) stop];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  return result;
}

- (void)startOfHomogCycle
{
}

- (void)endOfBank
{
  gmoMetaData = self->_gmoMetaData;
  id v4 = [(GmoDbgServices *)self createNewMetaDataDict];
  [(NSMutableArray *)gmoMetaData addObject:v4];

  ++self->_bankNumSinceRecStart;
  ++self->_bankNumInHomogCycle;
}

- (void)recStart
{
  v3 = [[GmoRecorder alloc] init:@"/private/var/mobile/tmp/com.apple.cameracaptured/GMO_REC" recordType:1 recorderId:0 filePrefix:@"gmo" fileExt:@"plist"];
  recorder = self->_recorder;
  self->_recorder = v3;

  [(GmoRecorder *)self->_recorder requestWithRecordLengthMs:3600000];
  objc_msgSend(NSString, "stringWithFormat:", @"_H%d", self->_numOfHomogCylceForRecording);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GmoRecorder startWithFileId:addTimeStamp:dirName:](self->_recorder, "startWithFileId:addTimeStamp:dirName:");
}

- (id)createNewMetaDataDict
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"3.3.0" forKeyedSubscript:@"metaDataVersion"];
  [v2 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"hasData"];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:v3 forKeyedSubscript:@"input"];

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:v4 forKeyedSubscript:@"intermediate"];

  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:v5 forKeyedSubscript:@"debug"];

  return v2;
}

- (id)generateFolderNameWithId:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] date];
  id v5 = objc_opt_new();
  [v5 setDateFormat:@"yyyy-MM-dd"];
  id v6 = [v5 stringFromDate:v4];
  v7 = [MEMORY[0x263EFF910] date];
  unsigned int v8 = objc_opt_new();
  [v8 setDateFormat:@"HH-mm-ss"];
  unint64_t v9 = [v8 stringFromDate:v7];
  if (v3) {
    [NSString stringWithFormat:@"%@_%@%@", v6, v9, v3];
  }
  else {
  uint64_t v10 = [NSString stringWithFormat:@"%@_%@", v6, v9];
  }

  return v10;
}

- (id)getGmoMetaDataArray
{
  return self->_gmoMetaDataForGetter;
}

- (GmoDbgServices)init
{
  self->_bankNumSinceRecStart = 0;
  *(void *)&self->_bankNumInHomogCycle = 0;
  self->_writingToDisuint64_t k = 0;
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:480];
  gmoMetaData = self->_gmoMetaData;
  self->_gmoMetaData = v3;

  id v5 = [(GmoDbgServices *)self generateFolderNameWithId:@"_fileId"];
  recFolder = self->_recFolder;
  self->_recFolder = v5;

  v7 = [MEMORY[0x263F08850] defaultManager];
  [v7 createDirectoryAtPath:@"/private/var/mobile/tmp/com.apple.cameracaptured/GMO_REC" withIntermediateDirectories:1 attributes:0 error:0];

  unsigned int v8 = self->_gmoMetaData;
  unint64_t v9 = [(GmoDbgServices *)self createNewMetaDataDict];
  [(NSMutableArray *)v8 addObject:v9];

  uint64_t v10 = (OS_dispatch_queue *)dispatch_queue_create("PeridotDepth online updates", 0);
  queue = self->_queue;
  self->_queue = v10;

  return self;
}

+ (int)compareVersions:(id)a3 toVersion:(id)a4
{
  id v5 = a4;
  id v6 = strdup((const char *)[a3 UTF8String]);
  id v7 = v5;
  unsigned int v8 = strdup((const char *)[v7 UTF8String]);
  unint64_t v9 = strtok(v6, ".");
  uint64_t v10 = strtok(0, ".");
  double v11 = strtok(0, ".");
  id v12 = strtok(v8, ".");
  id v13 = strtok(0, ".");
  id v14 = strtok(0, ".");
  int v15 = atoi(v9);
  int v16 = atoi(v10);
  int v22 = atoi(v11);
  int v17 = atoi(v12);
  int v18 = atoi(v13);
  int v19 = atoi(v14);
  free(v6);
  free(v8);
  if (v15 < v17) {
    goto LABEL_7;
  }
  if (v15 <= v17)
  {
    if (v16 >= v18)
    {
      if (v16 > v18) {
        goto LABEL_5;
      }
      if (v22 >= v19)
      {
        int v20 = v22 > v19;
        goto LABEL_8;
      }
    }
LABEL_7:
    int v20 = -1;
    goto LABEL_8;
  }
LABEL_5:
  int v20 = 1;
LABEL_8:

  return v20;
}

@end