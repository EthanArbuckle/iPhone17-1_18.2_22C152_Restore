@interface _PSHistogramFeatures
+ (id)computeFactorNameForFeature:(id)a3;
+ (id)conditionedProbabilityAcrossAllBucketsWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6 histogramSmoothingParameterK:(id)a7 histogramSmoothingParameterV:(id)a8;
+ (id)conditionedProbabilityAcrossAllCandidatesWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6 histogramSmoothingParameterK:(id)a7 histogramSmoothingParameterV:(id)a8;
+ (id)fetchBucketNamesFromPredictionContextForFeatureName:(int)a3 predictionContext:(id)a4;
+ (id)fetchIntervalStringForFeatureName:(int)a3;
+ (id)hasEverInBucketWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6;
+ (int)bucketCounttimeIntervalForFeatureName:(int)a3;
+ (int)virtualFeatureToDurableFeatureSourceMapping:(int)a3;
@end

@implementation _PSHistogramFeatures

+ (id)conditionedProbabilityAcrossAllBucketsWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6 histogramSmoothingParameterK:(id)a7 histogramSmoothingParameterV:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v63 = a6;
  id v55 = a7;
  id v54 = a8;
  if ([v13 count])
  {
    v15 = objc_opt_new();
    +[_PSHistogramFeatures virtualFeatureToDurableFeatureSourceMapping:v12];
    v16 = BMMLSEDurableFeatureStorefeatureNameAsString();
    v62 = +[_PSHistogramFeatures computeFactorNameForFeature:v16];

    v61 = +[_PSHistogramFeatures fetchIntervalStringForFeatureName:v12];
    v53 = +[_PSHistogramFeatures fetchBucketNamesFromPredictionContextForFeatureName:v12 predictionContext:v14];
    if ([v53 count])
    {
      id v50 = v13;
      v51 = v15;
      id v49 = v14;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v13;
      uint64_t v17 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v70;
        uint64_t v52 = *(void *)v70;
        do
        {
          uint64_t v20 = 0;
          uint64_t v56 = v18;
          do
          {
            if (*(void *)v70 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
            v22 = (void *)MEMORY[0x1A6243860]();
            if ([v21 hasCandidateIdentifier])
            {
              v64 = v21;
              long long v67 = 0u;
              long long v68 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v60 = v53;
              uint64_t v23 = [v60 countByEnumeratingWithState:&v65 objects:v73 count:16];
              v58 = v22;
              uint64_t v59 = v20;
              if (v23)
              {
                uint64_t v24 = v23;
                int v25 = 0;
                uint64_t v26 = *(void *)v66;
                do
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v66 != v26) {
                      objc_enumerationMutation(v60);
                    }
                    uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8 * i);
                    v29 = objc_msgSend(v63, "cache", v49, v50);
                    v30 = [v64 candidateIdentifier];
                    v31 = [v29 objectForKeyedSubscript:v30];
                    v32 = [v31 objectForKeyedSubscript:v62];
                    v33 = [v32 objectForKeyedSubscript:v61];
                    v34 = [v33 objectForKeyedSubscript:v28];
                    v35 = v34;
                    if (!v34) {
                      v34 = &unk_1EF675B28;
                    }
                    v25 += [v34 intValue];
                  }
                  uint64_t v24 = [v60 countByEnumeratingWithState:&v65 objects:v73 count:16];
                }
                while (v24);
              }
              else
              {
                int v25 = 0;
              }

              v36 = [v63 bucketSums];
              v37 = [v64 candidateIdentifier];
              v38 = [v36 objectForKeyedSubscript:v37];
              v39 = [v38 objectForKeyedSubscript:v62];
              v40 = [v39 objectForKeyedSubscript:v61];
              v41 = v40;
              if (!v40) {
                v40 = &unk_1EF675B28;
              }
              int v42 = objc_msgSend(v40, "intValue", v49, v50);

              int v43 = [v55 intValue];
              int v44 = [v55 intValue];
              int v45 = v42 + [v54 intValue] * v44;
              uint64_t v19 = v52;
              uint64_t v18 = v56;
              v22 = v58;
              uint64_t v20 = v59;
              if (v45 >= 1)
              {
                v46 = [NSNumber numberWithDouble:(double)(v43 + v25) / (double)v45];
                [v51 addFeatureWithIntValue:0 doubleValue:v46 stringValue:0 BOOLValue:0 timeBucket:0 forKey:v64];
              }
            }
            ++v20;
          }
          while (v20 != v18);
          uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
        }
        while (v18);
      }

      v15 = v51;
      id v47 = v51;
      id v14 = v49;
      id v13 = v50;
    }
    else
    {
      id v47 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v47 = (id)MEMORY[0x1E4F1CC08];
  }

  return v47;
}

+ (id)conditionedProbabilityAcrossAllCandidatesWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6 histogramSmoothingParameterK:(id)a7 histogramSmoothingParameterV:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v54 = a6;
  id v47 = a7;
  id v46 = a8;
  if ([v13 count])
  {
    int v43 = objc_opt_new();
    +[_PSHistogramFeatures virtualFeatureToDurableFeatureSourceMapping:v12];
    v15 = BMMLSEDurableFeatureStorefeatureNameAsString();
    v53 = +[_PSHistogramFeatures computeFactorNameForFeature:v15];

    uint64_t v52 = +[_PSHistogramFeatures fetchIntervalStringForFeatureName:v12];
    int v45 = +[_PSHistogramFeatures fetchBucketNamesFromPredictionContextForFeatureName:v12 predictionContext:v14];
    if ([v45 count])
    {
      id v42 = v13;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id obj = v13;
      uint64_t v16 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v66;
        uint64_t v44 = *(void *)v66;
        do
        {
          uint64_t v19 = 0;
          uint64_t v48 = v17;
          do
          {
            if (*(void *)v66 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v56 = *(void **)(*((void *)&v65 + 1) + 8 * v19);
            if ([v56 hasCandidateIdentifier])
            {
              uint64_t v50 = v19;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              id v51 = v45;
              uint64_t v57 = [v51 countByEnumeratingWithState:&v61 objects:v69 count:16];
              if (v57)
              {
                int v60 = 0;
                int v20 = 0;
                uint64_t v55 = *(void *)v62;
                do
                {
                  for (uint64_t i = 0; i != v57; ++i)
                  {
                    int v59 = v20;
                    if (*(void *)v62 != v55) {
                      objc_enumerationMutation(v51);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v61 + 1) + 8 * i);
                    uint64_t v58 = v22;
                    uint64_t v23 = [v54 cache];
                    uint64_t v24 = [v56 candidateIdentifier];
                    int v25 = [v23 objectForKeyedSubscript:v24];
                    uint64_t v26 = [v25 objectForKeyedSubscript:v53];
                    v27 = [v26 objectForKeyedSubscript:v52];
                    uint64_t v28 = [v27 objectForKeyedSubscript:v22];
                    v29 = v28;
                    if (!v28) {
                      uint64_t v28 = &unk_1EF675B28;
                    }
                    v60 += [v28 intValue];

                    v30 = [v54 candidateTimeIntervalSums];
                    v31 = [v30 objectForKeyedSubscript:v53];
                    v32 = [v31 objectForKeyedSubscript:v58];
                    v33 = [v32 objectForKeyedSubscript:v52];
                    v34 = v33;
                    if (!v33) {
                      v33 = &unk_1EF675B28;
                    }
                    int v20 = [v33 intValue] + v59;
                  }
                  uint64_t v57 = [v51 countByEnumeratingWithState:&v61 objects:v69 count:16];
                }
                while (v57);
              }
              else
              {
                int v60 = 0;
                int v20 = 0;
              }

              int v35 = [v47 intValue];
              int v36 = [v47 intValue];
              int v37 = v20 + [v46 intValue] * v36;
              uint64_t v18 = v44;
              uint64_t v17 = v48;
              uint64_t v19 = v50;
              if (v37 >= 1)
              {
                v38 = [NSNumber numberWithDouble:(double)(v35 + v60) / (double)v37];
                [v43 addFeatureWithIntValue:0 doubleValue:v38 stringValue:0 BOOLValue:0 timeBucket:0 forKey:v56];
              }
            }
            ++v19;
          }
          while (v19 != v17);
          uint64_t v17 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
        }
        while (v17);
      }

      v39 = v43;
      id v40 = v43;
      id v13 = v42;
    }
    else
    {
      id v40 = (id)MEMORY[0x1E4F1CC08];
      v39 = v43;
    }
  }
  else
  {
    id v40 = (id)MEMORY[0x1E4F1CC08];
  }

  return v40;
}

+ (id)hasEverInBucketWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v9 count])
  {
    uint64_t v12 = objc_opt_new();
    +[_PSHistogramFeatures virtualFeatureToDurableFeatureSourceMapping:v8];
    id v13 = BMMLSEDurableFeatureStorefeatureNameAsString();
    uint64_t v44 = +[_PSHistogramFeatures computeFactorNameForFeature:v13];

    int v43 = [v11 bucketHasEver];
    v39 = +[_PSHistogramFeatures fetchBucketNamesFromPredictionContextForFeatureName:v8 predictionContext:v10];
    if ([v39 count])
    {
      id v34 = v11;
      id v35 = v10;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v36 = v9;
      id obj = v9;
      uint64_t v14 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v50;
        uint64_t v37 = *(void *)v50;
        v38 = v12;
        do
        {
          uint64_t v17 = 0;
          uint64_t v40 = v15;
          do
          {
            if (*(void *)v50 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * v17);
            if ([v18 hasCandidateIdentifier])
            {
              uint64_t v42 = v17;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v19 = v39;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                char v22 = 0;
                uint64_t v23 = *(void *)v46;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v46 != v23) {
                      objc_enumerationMutation(v19);
                    }
                    if (v22)
                    {
                      BOOL v25 = 0;
                    }
                    else
                    {
                      uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                      v27 = [v18 candidateIdentifier];
                      uint64_t v28 = [v43 objectForKeyedSubscript:v27];
                      v29 = [v28 objectForKeyedSubscript:v44];
                      v30 = [v29 objectForKeyedSubscript:v26];
                      BOOL v25 = v30 != 0;
                    }
                    v22 |= v25;
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
                }
                while (v21);
              }
              else
              {
                char v22 = 0;
              }

              v31 = [NSNumber numberWithBool:v22 & 1];
              uint64_t v12 = v38;
              [v38 addFeatureWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:v31 timeBucket:0 forKey:v18];

              uint64_t v16 = v37;
              uint64_t v15 = v40;
              uint64_t v17 = v42;
            }
            ++v17;
          }
          while (v17 != v15);
          uint64_t v15 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v15);
      }

      id v32 = v12;
      id v10 = v35;
      id v9 = v36;
      id v11 = v34;
    }
    else
    {
      id v32 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v32 = (id)MEMORY[0x1E4F1CC08];
  }

  return v32;
}

+ (id)fetchBucketNamesFromPredictionContextForFeatureName:(int)a3 predictionContext:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_opt_new();
  switch(a3)
  {
    case 524:
    case 525:
    case 526:
    case 527:
    case 528:
    case 529:
    case 530:
    case 531:
    case 532:
    case 533:
    case 644:
      v7 = [v5 suggestionDate];

      if (v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        id v9 = [v5 suggestionDate];
        id v10 = [v8 components:96 fromDate:v9];

        uint64_t v11 = [v10 hour];
        goto LABEL_51;
      }
      goto LABEL_80;
    case 534:
    case 535:
    case 536:
    case 537:
    case 538:
    case 539:
    case 540:
    case 541:
    case 542:
    case 543:
    case 645:
      uint64_t v12 = [v5 suggestionDate];

      if (v12)
      {
        uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        id v13 = NSNumber;
        id v10 = [v5 suggestionDate];
        uint64_t v14 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v8, "isDateInWeekend:", v10));
        goto LABEL_52;
      }
      goto LABEL_80;
    case 544:
    case 545:
    case 546:
    case 547:
    case 548:
    case 549:
    case 550:
    case 551:
    case 552:
    case 553:
    case 646:
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v8 = objc_msgSend(v5, "locationUUIDs", 0);
      uint64_t v15 = [v8 countByEnumeratingWithState:&v64 objects:v92 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v65 != v17) {
              objc_enumerationMutation(v8);
            }
            if (*(void *)(*((void *)&v64 + 1) + 8 * i)) {
              objc_msgSend(v6, "addObject:");
            }
          }
          uint64_t v16 = [v8 countByEnumeratingWithState:&v64 objects:v92 count:16];
        }
        while (v16);
      }
      break;
    case 554:
    case 555:
    case 556:
    case 557:
    case 558:
    case 559:
    case 560:
    case 561:
    case 562:
    case 563:
    case 647:
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      uint64_t v8 = [v5 attachments];
      uint64_t v19 = [v8 countByEnumeratingWithState:&v88 objects:v98 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v89 != v21) {
              objc_enumerationMutation(v8);
            }
            uint64_t v23 = *(void **)(*((void *)&v88 + 1) + 8 * j);
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            uint64_t v24 = [v23 peopleInPhoto];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:v97 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v85;
              do
              {
                for (uint64_t k = 0; k != v26; ++k)
                {
                  if (*(void *)v85 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  if (*(void *)(*((void *)&v84 + 1) + 8 * k)) {
                    objc_msgSend(v6, "addObject:");
                  }
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v84 objects:v97 count:16];
              }
              while (v26);
            }
          }
          uint64_t v20 = [v8 countByEnumeratingWithState:&v88 objects:v98 count:16];
        }
        while (v20);
      }
      break;
    case 564:
    case 565:
    case 566:
    case 567:
    case 568:
    case 569:
    case 570:
    case 571:
    case 572:
    case 573:
    case 648:
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v8 = [v5 attachments];
      uint64_t v29 = [v8 countByEnumeratingWithState:&v68 objects:v93 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v69;
        do
        {
          for (uint64_t m = 0; m != v30; ++m)
          {
            if (*(void *)v69 != v31) {
              objc_enumerationMutation(v8);
            }
            v33 = *(void **)(*((void *)&v68 + 1) + 8 * m);
            id v34 = [v33 contentURL];

            if (v34)
            {
              id v35 = [v33 contentURL];
              id v36 = [v35 baseURL];
              uint64_t v37 = [v36 absoluteString];

              v38 = [v33 contentURL];
              v39 = [v38 absoluteString];

              if (v37) {
                [v6 addObject:v37];
              }
              if (v39) {
                [v6 addObject:v39];
              }
            }
          }
          uint64_t v30 = [v8 countByEnumeratingWithState:&v68 objects:v93 count:16];
        }
        while (v30);
      }
      break;
    case 574:
    case 575:
    case 576:
    case 577:
    case 578:
    case 579:
    case 580:
    case 581:
    case 582:
    case 583:
    case 649:
      uint64_t v40 = [v5 bundleID];

      if (!v40) {
        goto LABEL_80;
      }
      uint64_t v8 = [v5 bundleID];
      [v6 addObject:v8];
      break;
    case 604:
    case 605:
    case 606:
    case 607:
    case 608:
    case 609:
    case 610:
    case 611:
    case 612:
    case 613:
    case 652:
      v41 = [v5 suggestionDate];

      if (!v41) {
        goto LABEL_80;
      }
      uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v42 = [v5 suggestionDate];
      id v10 = [v8 components:512 fromDate:v42];

      uint64_t v11 = [v10 weekday];
LABEL_51:
      uint64_t v14 = [NSNumber numberWithInteger:v11];
LABEL_52:
      int v43 = v14;
      uint64_t v44 = [v14 stringValue];
      [v6 addObject:v44];

      break;
    case 614:
    case 615:
    case 616:
    case 617:
    case 618:
    case 619:
    case 620:
    case 621:
    case 622:
    case 623:
    case 653:
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      uint64_t v8 = [v5 attachments];
      uint64_t v45 = [v8 countByEnumeratingWithState:&v80 objects:v96 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v81;
        do
        {
          for (uint64_t n = 0; n != v46; ++n)
          {
            if (*(void *)v81 != v47) {
              objc_enumerationMutation(v8);
            }
            long long v49 = *(void **)(*((void *)&v80 + 1) + 8 * n);
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v50 = [v49 photoSceneDescriptors];
            uint64_t v51 = [v50 countByEnumeratingWithState:&v76 objects:v95 count:16];
            if (v51)
            {
              uint64_t v52 = v51;
              uint64_t v53 = *(void *)v77;
              do
              {
                for (iuint64_t i = 0; ii != v52; ++ii)
                {
                  if (*(void *)v77 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  if (*(void *)(*((void *)&v76 + 1) + 8 * ii)) {
                    objc_msgSend(v6, "addObject:");
                  }
                }
                uint64_t v52 = [v50 countByEnumeratingWithState:&v76 objects:v95 count:16];
              }
              while (v52);
            }
          }
          uint64_t v46 = [v8 countByEnumeratingWithState:&v80 objects:v96 count:16];
        }
        while (v46);
      }
      break;
    case 634:
    case 635:
    case 636:
    case 637:
    case 638:
    case 639:
    case 640:
    case 641:
    case 642:
    case 643:
    case 655:
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v8 = [v5 attachments];
      uint64_t v55 = [v8 countByEnumeratingWithState:&v72 objects:v94 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v73;
        do
        {
          for (juint64_t j = 0; jj != v56; ++jj)
          {
            if (*(void *)v73 != v57) {
              objc_enumerationMutation(v8);
            }
            int v59 = *(void **)(*((void *)&v72 + 1) + 8 * jj);
            int v60 = [v59 UTI];

            if (v60)
            {
              long long v61 = [v59 UTI];
              [v6 addObject:v61];
            }
          }
          uint64_t v56 = [v8 countByEnumeratingWithState:&v72 objects:v94 count:16];
        }
        while (v56);
      }
      break;
    default:
      goto LABEL_80;
  }

LABEL_80:
  long long v62 = [v6 allObjects];

  return v62;
}

+ (id)fetchIntervalStringForFeatureName:(int)a3
{
  [a1 bucketCounttimeIntervalForFeatureName:*(void *)&a3];

  return (id)BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalAsString();
}

+ (int)bucketCounttimeIntervalForFeatureName:(int)a3
{
  if ((a3 - 524) > 0x77) {
    return 0;
  }
  else {
    return dword_1A32652C0[a3 - 524];
  }
}

+ (int)virtualFeatureToDurableFeatureSourceMapping:(int)a3
{
  if ((a3 - 524) > 0x83) {
    return 0;
  }
  else {
    return dword_1A32654A0[a3 - 524];
  }
}

+ (id)computeFactorNameForFeature:(id)a3
{
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"SortedDescending"];
  if ([v4 count] == 2)
  {
    id v5 = [v3 componentsSeparatedByString:@"SortedDescending"];
    v6 = [v5 objectAtIndexedSubscript:1];

    v7 = [v6 componentsSeparatedByString:@"ShareEventList"];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v8 = @"Unknown";
  }
  id v9 = [(__CFString *)v8 componentsSeparatedByString:@"Photo"];

  if ([v9 count] == 2)
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:1];

    uint64_t v8 = (__CFString *)v10;
  }

  return v8;
}

@end