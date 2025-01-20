@interface TCDumpEmfPlusContainer
- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5;
@end

@implementation TCDumpEmfPlusContainer

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  v7 = [[TCDumpNumeric alloc] initWithType:5];
  v26 = [[TCDumpNumeric alloc] initWithType:3];
  v27[0] = 16385;
  v28 = @"Header";
  int v29 = 16386;
  v30 = @"EndOfFile";
  int v31 = 16387;
  v32 = @"Comment";
  int v33 = 16388;
  v34 = @"GetDC";
  int v35 = 16389;
  v36 = @"MultiFormatStart";
  int v37 = 16390;
  v38 = @"MultiFormatSection";
  int v39 = 16391;
  v40 = @"MultiFormatEnd";
  int v41 = 16392;
  v42 = @"Object";
  int v43 = 16393;
  v44 = @"Clear";
  int v45 = 16394;
  v46 = @"FillRects";
  int v47 = 16395;
  v48 = @"DrawRects";
  int v49 = 16396;
  v50 = @"FillPolygon";
  int v51 = 16397;
  v52 = @"DrawLines";
  int v53 = 16398;
  v54 = @"FillEllipse";
  int v55 = 16399;
  v56 = @"DrawEllipse";
  int v57 = 16400;
  v58 = @"FillPie";
  int v59 = 16401;
  v60 = @"DrawPie";
  int v61 = 16402;
  v62 = @"DrawArc";
  int v63 = 16403;
  v64 = @"FillRegion";
  int v65 = 16404;
  v66 = @"FillPath";
  int v67 = 16405;
  v68 = @"DrawPath";
  int v69 = 16406;
  v70 = @"FillClosedCurve";
  int v71 = 16407;
  v72 = @"DrawClosedCurve";
  int v73 = 16408;
  v74 = @"DrawCurve";
  int v75 = 16409;
  v76 = @"DrawBeziers";
  int v77 = 16410;
  v78 = @"DrawImage";
  int v79 = 16411;
  v80 = @"DrawImagePoints";
  int v81 = 16412;
  v82 = @"DrawString";
  int v83 = 16413;
  v84 = @"SetRenderingOrigin";
  int v85 = 16414;
  v86 = @"SetAntiAliasMode";
  int v87 = 16415;
  v88 = @"SetTextRenderingHint";
  int v89 = 16416;
  v90 = @"SetTextContrast";
  int v91 = 16417;
  v92 = @"SetInterpolationMode";
  int v93 = 16418;
  v94 = @"SetPixelOffsetMode";
  int v95 = 16419;
  v96 = @"SetCompositingMode";
  int v97 = 16420;
  v98 = @"SetCompositingQuality";
  int v99 = 16421;
  v100 = @"Save";
  int v101 = 16422;
  v102 = @"Restore";
  int v103 = 16423;
  v104 = @"BeginContainer";
  int v105 = 16424;
  v106 = @"BeginContainerNoParams";
  int v107 = 16425;
  v108 = @"EndContainer";
  int v109 = 16426;
  v110 = @"SetWorldTransform";
  int v111 = 16427;
  v112 = @"ResetWorldTransform";
  int v113 = 16428;
  v114 = @"MultiplyWorldTransform";
  int v115 = 16429;
  v116 = @"TranslateWorldTransform";
  int v117 = 16430;
  v118 = @"ScaleWorldTransform";
  int v119 = 16431;
  v120 = @"RotateWorldTransform";
  int v121 = 16432;
  v122 = @"SetPageTransform";
  int v123 = 16433;
  v124 = @"ResetClip";
  int v125 = 16434;
  v126 = @"SetClipRect";
  int v127 = 16435;
  v128 = @"SetClipPath";
  int v129 = 16436;
  v130 = @"SetClipRegion";
  int v131 = 16437;
  v132 = @"OffsetClip";
  int v133 = 16438;
  v134 = @"DrawDriverString";
  int v135 = 16439;
  v136 = @"StrokeFillPath";
  int v137 = 16440;
  v138 = @"SerializableObject";
  int v139 = 16441;
  v140 = @"SetTSGraphics";
  int v141 = 16442;
  v142 = @"SetTSClip";
  int v143 = 0;
  uint64_t v144 = 0;
  v25 = [[TCDumpEnum alloc] initWithTypeName:@"EmfPlusRecordType" pairs:v27];
  v8 = [[TCDumpNumeric alloc] initWithType:3 enumType:v25];
  fseek(a3, -8, 1);
  int LEUI32 = TCDumpReadLEUI32(a3);
  fseek(a3, 4, 1);
  unsigned int v10 = LEUI32 + ftello(a3) - 4;
  unsigned int v11 = ftello(a3);
  if (v10 > v11)
  {
    unsigned int v12 = v11;
    uint64_t v13 = 0;
    do
    {
      v14 = xmlNewNode(0, (const xmlChar *)"EmfPlusRecord");
      xmlAddChild(a4, v14);
      sfaxmlSetLongNoNsProp(v14, (const xmlChar *)"index", v13);
      v15 = xmlNewNode(0, (const xmlChar *)"type");
      xmlAddChild(v14, v15);
      [(TCDumpNumeric *)v8 fromBinary:a3 toXml:v15 state:0];
      v16 = xmlNewNode(0, (const xmlChar *)"flags");
      xmlAddChild(v14, v16);
      [(TCDumpNumeric *)v26 fromBinary:a3 toXml:v16 state:0];
      v17 = xmlNewNode(0, (const xmlChar *)"record-size");
      xmlAddChild(v14, v17);
      [(TCDumpNumeric *)v7 fromBinary:a3 toXml:v17 state:0];
      fseek(a3, -4, 1);
      if (TCDumpReadLEUI32(a3) != 8)
      {
        v18 = xmlNewNode(0, (const xmlChar *)"data-size");
        xmlAddChild(v14, v18);
        [(TCDumpNumeric *)v7 fromBinary:a3 toXml:v18 state:0];
        fseek(a3, -4, 1);
        unsigned int v19 = TCDumpReadLEUI32(a3);
        unsigned int v20 = v12 + 12;
        if (v19 + v12 + 12 > v10)
        {
          v21 = xmlNewNode(0, (const xmlChar *)"actual-data-size");
          xmlAddChild(v14, v21);
          unsigned int v19 = v10 - v20;
          writeIntToXml(v21, v10 - v20, 4, 0, 0, 0);
        }
        if (v19)
        {
          v22 = xmlNewNode(0, (const xmlChar *)"data");
          xmlAddChild(v14, v22);
          v23 = [[TCDumpBlob alloc] initWithSize_:v19];
          [(TCDumpBlob *)v23 fromBinary:a3 toXml:v22 state:0];
        }
      }
      ++v13;
      unsigned int v12 = ftello(a3);
    }
    while (v10 > v12);
  }

  for (uint64_t i = 234; i != -2; i -= 4)
}

@end