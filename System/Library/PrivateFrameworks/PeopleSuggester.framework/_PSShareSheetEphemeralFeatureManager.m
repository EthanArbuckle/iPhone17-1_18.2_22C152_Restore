@interface _PSShareSheetEphemeralFeatureManager
- (NSNumber)histogramSmoothingParameterK;
- (NSNumber)histogramSmoothingParameterV;
- (_PSShareSheetEphemeralFeatureManager)initWithContext:(id)a3 candidates:(id)a4 caches:(id)a5 store:(id)a6;
- (id)callFeatureFunctionWithFeature:(int)a3 histogramFeatureData:(id)a4;
- (id)computeFeaturesWithHistogramFeatures:(id)a3;
- (id)loadPSConfig;
- (void)setCandidates:(id)a3;
- (void)setContext:(id)a3;
- (void)setFeatureManagerProperties;
- (void)setHistogramSmoothingParameterK:(id)a3;
- (void)setHistogramSmoothingParameterV:(id)a3;
@end

@implementation _PSShareSheetEphemeralFeatureManager

- (_PSShareSheetEphemeralFeatureManager)initWithContext:(id)a3 candidates:(id)a4 caches:(id)a5 store:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_PSShareSheetEphemeralFeatureManager;
  v15 = [(_PSShareSheetEphemeralFeatureManager *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_candidates, a4);
    objc_storeStrong((id *)&v16->_caches, a5);
    objc_storeStrong((id *)&v16->_store, a6);
    v16->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v16->_lock);
    [(_PSShareSheetEphemeralFeatureManager *)v16 setFeatureManagerProperties];
    os_unfair_lock_unlock(&v16->_lock);
  }

  return v16;
}

- (id)loadPSConfig
{
  v2 = +[_PSConfig defaultConfig];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (void)setFeatureManagerProperties
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(_PSShareSheetEphemeralFeatureManager *)self loadPSConfig];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = (NSSet *)objc_opt_new();
    uint64_t v8 = [v6 objectForKeyedSubscript:@"featureList"];
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(NSNumber, "numberWithInt:", BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString(), v30);
          [(NSSet *)v7 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }

    features = self->_features;
    self->_features = v7;
    v19 = v7;

    v20 = NSNumber;
    v21 = [v6 objectForKeyedSubscript:@"histogramFeatureSmoothingK"];
    [v21 doubleValue];
    if (v22 == 0.0) {
      double v22 = 1.0;
    }
    objc_msgSend(v20, "numberWithDouble:", v22, v30);
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    histogramSmoothingParameterK = self->_histogramSmoothingParameterK;
    self->_histogramSmoothingParameterK = v23;

    v25 = NSNumber;
    v26 = [v6 objectForKeyedSubscript:@"histogramFeatureSmoothingV"];
    [v26 doubleValue];
    if (v27 == 0.0) {
      double v27 = 10.0;
    }
    v28 = [v25 numberWithDouble:v27];
    histogramSmoothingParameterV = self->_histogramSmoothingParameterV;
    self->_histogramSmoothingParameterV = v28;
  }
}

- (void)setCandidates:(id)a3
{
  id v4 = (NSSet *)a3;
  os_unfair_lock_lock(&self->_lock);
  candidates = self->_candidates;
  self->_candidates = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  id v4 = (_PSPredictionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)computeFeaturesWithHistogramFeatures:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(NSSet *)self->_features allObjects];
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke;
  v19[3] = &unk_1E5AE1950;
  v19[4] = self;
  id v20 = v4;
  id v9 = v4;
  v10 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v19);
  id v11 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_47);
  id v12 = (void *)[v8 initWithObjects:v10 forKeys:v11];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_3;
  v17[3] = &unk_1E5AE0708;
  id v13 = v5;
  id v18 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];
  os_unfair_lock_unlock(p_lock);
  uint64_t v14 = v18;
  id v15 = v13;

  return v15;
}

- (id)callFeatureFunctionWithFeature:(int)a3 histogramFeatureData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CC08];
  switch((int)v4)
  {
    case 507:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676608;
      goto LABEL_17;
    case 508:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676620;
      goto LABEL_17;
    case 509:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676638;
      goto LABEL_17;
    case 510:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676650;
      goto LABEL_17;
    case 511:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676710;
      goto LABEL_17;
    case 512:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676668;
      goto LABEL_17;
    case 513:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676698;
      goto LABEL_20;
    case 514:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF6766B0;
      goto LABEL_20;
    case 515:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF6766E0;
      goto LABEL_20;
    case 516:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF6766C8;
LABEL_17:
      uint64_t v12 = 0;
      goto LABEL_21;
    case 517:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF6766F8;
      goto LABEL_20;
    case 518:
      candidates = self->_candidates;
      caches = self->_caches;
      id v11 = &unk_1EF676680;
LABEL_20:
      uint64_t v12 = 1;
LABEL_21:
      uint64_t v8 = +[_PSLastCommunicatedFeatures lastCommunicationFromCandidates:candidates direction:v12 mechanisms:v11 caches:caches];
      goto LABEL_32;
    case 519:
    case 520:
    case 521:
    case 522:
    case 523:
    case 584:
    case 585:
    case 586:
    case 587:
    case 588:
    case 589:
    case 590:
    case 591:
    case 592:
    case 593:
    case 594:
    case 595:
    case 596:
    case 597:
    case 598:
    case 599:
    case 600:
    case 601:
    case 602:
    case 603:
    case 624:
    case 625:
    case 626:
    case 627:
    case 628:
    case 629:
    case 630:
    case 631:
    case 632:
    case 633:
      goto LABEL_33;
    case 524:
    case 526:
    case 528:
    case 530:
    case 532:
    case 534:
    case 536:
    case 538:
    case 540:
    case 542:
    case 544:
    case 546:
    case 548:
    case 550:
    case 552:
    case 554:
    case 556:
    case 558:
    case 560:
    case 562:
    case 564:
    case 566:
    case 568:
    case 570:
    case 572:
    case 574:
    case 576:
    case 578:
    case 580:
    case 582:
    case 604:
    case 606:
    case 608:
    case 610:
    case 612:
    case 614:
    case 616:
    case 618:
    case 620:
    case 622:
    case 634:
    case 636:
    case 638:
    case 640:
    case 642:
      uint64_t v8 = +[_PSHistogramFeatures conditionedProbabilityAcrossAllBucketsWithCandidates:self->_candidates featureName:v4 predictionContext:self->_context histogramFeatureData:v6 histogramSmoothingParameterK:self->_histogramSmoothingParameterK histogramSmoothingParameterV:self->_histogramSmoothingParameterV];
      goto LABEL_32;
    case 525:
    case 527:
    case 529:
    case 531:
    case 533:
    case 535:
    case 537:
    case 539:
    case 541:
    case 543:
    case 545:
    case 547:
    case 549:
    case 551:
    case 553:
    case 555:
    case 557:
    case 559:
    case 561:
    case 563:
    case 565:
    case 567:
    case 569:
    case 571:
    case 573:
    case 575:
    case 577:
    case 579:
    case 581:
    case 583:
    case 605:
    case 607:
    case 609:
    case 611:
    case 613:
    case 615:
    case 617:
    case 619:
    case 621:
    case 623:
    case 635:
    case 637:
    case 639:
    case 641:
    case 643:
      uint64_t v8 = +[_PSHistogramFeatures conditionedProbabilityAcrossAllCandidatesWithCandidates:self->_candidates featureName:v4 predictionContext:self->_context histogramFeatureData:v6 histogramSmoothingParameterK:self->_histogramSmoothingParameterK histogramSmoothingParameterV:self->_histogramSmoothingParameterV];
      goto LABEL_32;
    case 644:
    case 645:
    case 646:
    case 647:
    case 648:
    case 649:
    case 650:
    case 651:
    case 652:
    case 653:
    case 654:
    case 655:
      uint64_t v8 = +[_PSHistogramFeatures hasEverInBucketWithCandidates:self->_candidates featureName:v4 predictionContext:self->_context histogramFeatureData:v6];
LABEL_32:
      v7 = (void *)v8;
LABEL_33:

      return v7;
    default:
      switch((int)v4)
      {
        case 328:
          uint64_t v8 = +[_PSDeviceStateFeatures isInMeetingWithCandidates:self->_candidates caches:self->_caches];
          goto LABEL_32;
        case 329:
          id v13 = self->_candidates;
          uint64_t v14 = self->_caches;
          store = self->_store;
          uint64_t v16 = 0;
          goto LABEL_24;
        case 330:
          id v13 = self->_candidates;
          uint64_t v14 = self->_caches;
          store = self->_store;
          uint64_t v16 = 1;
LABEL_24:
          uint64_t v8 = +[_PSDeviceStateFeatures isInCallWithCandidates:v13 facetimeRequest:v16 caches:v14 store:store];
          goto LABEL_32;
        case 341:
          uint64_t v8 = +[_PSContentFeatures utiTypesFromPredictionContext:self->_context candidates:self->_candidates];
          goto LABEL_32;
        case 342:
          uint64_t v8 = +[_PSContentFeatures sourceAppFromPredictionContext:self->_context candidates:self->_candidates];
          goto LABEL_32;
        case 343:
          context = self->_context;
          id v18 = self->_candidates;
          uint64_t v19 = 0;
          goto LABEL_31;
        case 344:
          context = self->_context;
          id v18 = self->_candidates;
          uint64_t v19 = 1;
          goto LABEL_31;
        case 346:
          uint64_t v8 = +[_PSContentFeatures urlTopLevelDomainFromPredictionContext:self->_context candidates:self->_candidates];
          goto LABEL_32;
        case 349:
          context = self->_context;
          id v18 = self->_candidates;
          uint64_t v19 = 3;
LABEL_31:
          uint64_t v8 = +[_PSContentFeatures numberOfContentFromPredictionContext:context contentType:v19 candidates:v18];
          goto LABEL_32;
        default:
          goto LABEL_33;
      }
  }
}

- (NSNumber)histogramSmoothingParameterK
{
  return self->_histogramSmoothingParameterK;
}

- (void)setHistogramSmoothingParameterK:(id)a3
{
}

- (NSNumber)histogramSmoothingParameterV
{
  return self->_histogramSmoothingParameterV;
}

- (void)setHistogramSmoothingParameterV:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramSmoothingParameterV, 0);
  objc_storeStrong((id *)&self->_histogramSmoothingParameterK, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_caches, 0);
  objc_storeStrong((id *)&self->_candidates, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end