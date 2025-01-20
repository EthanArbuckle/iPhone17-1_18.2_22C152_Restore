@interface TITraceLogRecordParser
+ (void)parseRecord:(id)a3;
@end

@implementation TITraceLogRecordParser

+ (void)parseRecord:(id)a3
{
  id v3 = a3;
  if (![v3 parsingStatus])
  {
    id v4 = v3;
    v5 = [v4 logText];
    if (([v5 hasPrefix:@"Typed String:"] & 1) == 0)
    {

      uint64_t v16 = 1;
LABEL_18:
      [v4 setParsingStatus:v16];
      goto LABEL_19;
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v5];
    id v62 = 0;
    [v6 scanUpToString:@"\n" intoString:&v62];
    id v7 = v62;
    v70[0] = 0;
    v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"Typed String: \"(.+)\"  Lookup Type: (.+)" options:0 error:v70];
    id v9 = v70[0];
    v57 = v7;
    v10 = objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
    v11 = [v10 firstObject];
    v12 = v11;
    v54 = v6;
    if (v11)
    {
      char v13 = 1;
      if ([v11 numberOfRanges] == 2)
      {
        char v14 = 0;
        id v55 = 0;
        id v56 = 0;
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v17 = [v12 rangeAtIndex:1];
        v19 = objc_msgSend(v57, "substringWithRange:", v17, v18);
        uint64_t v20 = [v12 rangeAtIndex:2];
        v22 = objc_msgSend(v57, "substringWithRange:", v20, v21);
        LOBYTE(v63[0]) = 1;
        id v56 = v19;
        v63[1] = v56;
        id v55 = v22;
        v63[2] = v55;
        v63[3] = 0;
        uint64_t v15 = _recordTypeForEventRecordHeader((uint64_t)v63);
        char v13 = 0;
        char v14 = 1;
      }
    }
    else
    {
      char v14 = 0;
      id v55 = 0;
      id v56 = 0;
      uint64_t v15 = 0;
      char v13 = 1;
    }

    v23 = v57;
    if (v13)
    {
      uint64_t v16 = 1;
      v24 = v54;
      v25 = v55;
    }
    else
    {
      [v4 setTypedString:v56];
      v58[0] = v14;
      id v59 = v56;
      v25 = v55;
      id v60 = v55;
      uint64_t v61 = v15;
      uint64_t v26 = _recordTypeForEventRecordHeader((uint64_t)v58);
      if (v26 == 3)
      {
        v43 = (objc_class *)MEMORY[0x1E4F28FE8];
        id v44 = v4;
        id v45 = v5;
        v46 = (void *)[[v43 alloc] initWithString:v45];

        [v46 scanUpToString:@"[" intoString:0];
        v63[0] = 0;
        [v46 scanUpToString:@"\n\n" intoString:v63];
        id v47 = v63[0];
        v48 = _parseRawCandidateGroupsFromString(v47);
        [v44 setRawPredictionCandidates:v48];
        [v46 scanUpToString:@"\n[" intoString:0];
        v70[0] = v47;
        [v46 scanUpToString:@"==============================\n" intoString:v70];
        id v49 = v70[0];

        v50 = _parseFinalCandidatesGroupFromString(v49);

        [v44 setFinalPredictionCandidates:v50];
        v42 = @"predictions";
        [v44 addParsedSection:@"predictions"];

        v25 = v55;
      }
      else
      {
        if (v26 != 1)
        {
          uint64_t v16 = 1;
          v24 = v54;
          goto LABEL_17;
        }
        v27 = (objc_class *)MEMORY[0x1E4F28FE8];
        id v28 = v4;
        id v29 = v5;
        v30 = (void *)[[v27 alloc] initWithString:v29];

        [v30 scanUpToString:@"[" intoString:0];
        v63[0] = 0;
        [v30 scanUpToString:@"\n\n" intoString:v63];
        id v31 = v63[0];
        v51 = _parseRawCandidateGroupsFromString(v31);
        [v28 setRawCompletionCandidates:v51];
        v70[0] = v31;
        [v30 scanUpToString:@"\n\n" intoString:v70];
        id v32 = v70[0];

        v52 = _parseRemovedCandidatesGroupFromString(v32);
        [v28 setRemovedCompletionCandidates:v52];
        [v30 scanUpToString:@"\n[" intoString:0];
        id v69 = v32;
        [v30 scanUpToString:@"==============================\n" intoString:&v69];
        id v33 = v69;

        v53 = _parseFinalCandidatesGroupFromString(v33);
        [v28 setFinalCompletionCandidates:v53];
        [v28 addParsedSection:@"completions"];
        id v68 = v33;
        [v30 scanUpToString:@"\n" intoString:&v68];
        id v34 = v68;

        id v67 = v34;
        [v30 scanUpToString:@"\n" intoString:&v67];
        id v35 = v67;

        [v30 scanUpToString:@"\n[" intoString:0];
        id v66 = v35;
        [v30 scanUpToString:@"\n\n" intoString:&v66];
        id v36 = v66;

        v37 = _parseRawCandidateGroupsFromString(v36);

        [v28 setRawAutocorrectionCandidates:v37];
        id v65 = v36;
        [v30 scanUpToString:@"\n\n" intoString:&v65];
        id v38 = v65;

        v39 = _parseRemovedCandidatesGroupFromString(v38);

        [v28 setRemovedAutocorrectionCandidates:v39];
        [v30 scanUpToString:@"\n[" intoString:0];
        id v64 = v38;
        [v30 scanUpToString:@"==============================\n" intoString:&v64];
        id v40 = v64;

        v41 = _parseFinalCandidatesGroupFromString(v40);

        [v28 setFinalAutocorrectionCandidates:v41];
        [v28 addParsedSection:@"autocorrection"];

        v42 = @"autocorrections";
      }
      [v4 setRecordType:v42];
      uint64_t v16 = 2;
      v24 = v54;
      v23 = v57;
    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
}

@end