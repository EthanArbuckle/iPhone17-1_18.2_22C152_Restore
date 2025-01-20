@interface WiFiAvailabilityEngine
- (NSSet)availableNetworks;
- (NSSet)providers;
- (NSSet)sources;
- (OS_dispatch_queue)queue;
- (WiFiAvailabilityEngine)initWithProviders:(id)a3 sources:(id)a4;
- (WiFiLexicon)wifiLexicon;
- (WiFiLocationProvider)locationProvider;
- (WiFiScanProvider)scanProvider;
- (double)availabilityMatchMaximumAge;
- (id)_createAvailabilityMatchForCandidate:(id)a3 scannedNetwork:(id)a4;
- (id)_findExistingAvailabilityMatchForScannedNetwork:(id)a3;
- (id)_findRelevantNetworkMatchForScannedNetwork:(id)a3;
- (id)availabilityChangedCallback;
- (id)findRecommendationForScannedNetwork:(id)a3;
- (id)findRecommendationsForScannedNetwork:(id)a3;
- (void)_findAvailabilityMatchesInSourcesForBSSIDS:(id)a3;
- (void)_handle3BarsRelevancyAdded:(id)a3 removed:(id)a4;
- (void)_handleCandidateMatches:(id)a3;
- (void)_handleScanResultCallback:(id)a3 error:(id)a4;
- (void)_handleWalletRelevancyAdded:(id)a3 removed:(id)a4;
- (void)_removeStaleMatches;
- (void)_setupProviderCallbacks:(id)a3;
- (void)_setupSourceCallbacks:(id)a3;
- (void)setAvailabilityChangedCallback:(id)a3;
- (void)setAvailabilityMatchMaximumAge:(double)a3;
- (void)setAvailableNetworks:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setProviders:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScanProvider:(id)a3;
- (void)setSources:(id)a3;
- (void)setWifiLexicon:(id)a3;
@end

@implementation WiFiAvailabilityEngine

- (id)_findRelevantNetworkMatchForScannedNetwork:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [(WiFiAvailabilityEngine *)self sources];
  uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v31)
  {
    id v32 = 0;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v7 = [v6 relevantNetworks];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v34;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              v13 = [v12 SSID];
              v14 = [v4 SSID];
              char v15 = [v13 isEqualToString:v14];

              if (v15) {
                goto LABEL_19;
              }
              v16 = [v4 BSSID];

              if (v16)
              {
                v17 = (void *)MEMORY[0x1E4F1CAD0];
                v18 = [v4 BSSID];
                v19 = objc_msgSend(v17, "setWithObjects:", v18, 0);
                char v20 = [v12 containsAccessPointMatchingBSSIDs:v19];

                if (v20) {
                  goto LABEL_19;
                }
              }
              v21 = [v4 essMembers];

              if (v21)
              {
                v22 = (void *)MEMORY[0x1E4F1CAD0];
                v23 = [v4 essMembers];
                v24 = [v22 setWithArray:v23];
                int v25 = [v12 containsAccessPointMatchingBSSIDs:v24];

                if (v25)
                {
LABEL_19:
                  id v26 = v12;

                  v27 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v42 = "-[WiFiAvailabilityEngine _findRelevantNetworkMatchForScannedNetwork:]";
                    __int16 v43 = 2112;
                    id v44 = v26;
                    __int16 v45 = 2112;
                    id v46 = v4;
                    _os_log_impl(&dword_1D3CCD000, v27, OS_LOG_TYPE_DEFAULT, "%s: relevant network %@ matched with scanned network %@", buf, 0x20u);
                  }
                  id v32 = v26;
                  goto LABEL_22;
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v47 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_22:
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v31);
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (NSSet)sources
{
  return self->_sources;
}

- (void)_handleScanResultCallback:(id)a3 error:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v6;
  uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v31)
  {
    uint64_t v9 = *(void *)v37;
    v27 = v7;
    v28 = self;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D9440170]();
        uint64_t v13 = [v11 SSID];
        if (v13)
        {
          v14 = (void *)v13;
          char v15 = [v11 SSID];
          uint64_t v16 = [v15 length];

          if (v16)
          {
            v17 = [(WiFiAvailabilityEngine *)self _findExistingAvailabilityMatchForScannedNetwork:v11];
            if (v17)
            {
              v18 = [MEMORY[0x1E4F1C9C8] date];
              [v17 setMatchedAt:v18];

              [v7 addObject:v17];
            }
            v19 = [(WiFiAvailabilityEngine *)self _findRelevantNetworkMatchForScannedNetwork:v11];
            if (v19)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v42 = "-[WiFiAvailabilityEngine _handleScanResultCallback:error:]";
                __int16 v43 = 2112;
                id v44 = v19;
                __int16 v45 = 2112;
                id v46 = v11;
                _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: found relevant network match (%@) for scanned network %@", buf, 0x20u);
              }
              uint64_t v20 = [(WiFiAvailabilityEngine *)self _createAvailabilityMatchForCandidate:v19 scannedNetwork:v11];

              [v7 addObject:v20];
              v17 = (void *)v20;
            }
            else if (v17)
            {
              [v7 addObject:v17];
            }
            else
            {
              v17 = [v11 BSSID];
              if (v17) {
                [v8 setObject:v11 forKey:v17];
              }
              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              v21 = [v11 essMembers];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v33;
                do
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v33 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    [v8 setObject:v11 forKey:*(void *)(*((void *)&v32 + 1) + 8 * j)];
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
                }
                while (v23);
              }

              v7 = v27;
              self = v28;
            }

            uint64_t v9 = v29;
          }
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v31);
  }

  if ([v8 count]) {
    [(WiFiAvailabilityEngine *)self _findAvailabilityMatchesInSourcesForBSSIDS:v8];
  }
  if ([v7 count]) {
    [(WiFiAvailabilityEngine *)self _handleCandidateMatches:v7];
  }
  [(WiFiAvailabilityEngine *)self _removeStaleMatches];
}

- (void)_removeStaleMatches
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9440170](self, a2);
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(WiFiAvailabilityEngine *)self availableNetworks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 matchedAt];
        [v4 timeIntervalSinceDate:v12];
        double v14 = v13;
        [(WiFiAvailabilityEngine *)self availabilityMatchMaximumAge];
        double v16 = v15;

        if (v14 > v16)
        {
          [v3 addObject:v11];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            int v25 = "-[WiFiAvailabilityEngine _removeStaleMatches]";
            __int16 v26 = 2112;
            v27 = v11;
            _os_log_impl(&dword_1D3CCD000, v9, OS_LOG_TYPE_DEFAULT, "%s: expired match %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    v17 = [(WiFiAvailabilityEngine *)self availableNetworks];
    v18 = (void *)[v17 mutableCopy];

    [v18 minusSet:v3];
    [(WiFiAvailabilityEngine *)self setAvailableNetworks:v18];
  }
}

- (id)_findExistingAvailabilityMatchForScannedNetwork:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(WiFiAvailabilityEngine *)self availableNetworks];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToScannedNetwork:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_findAvailabilityMatchesInSourcesForBSSIDS:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(WiFiAvailabilityEngine *)self sources];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = (void *)MEMORY[0x1D9440170]();
          long long v11 = (void *)MEMORY[0x1E4F1CAD0];
          long long v12 = [v4 allKeys];
          long long v13 = [v11 setWithArray:v12];

          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __69__WiFiAvailabilityEngine__findAvailabilityMatchesInSourcesForBSSIDS___block_invoke;
          v15[3] = &unk_1E69BE5E8;
          id v16 = v4;
          v17 = self;
          v18 = v9;
          [v9 fetchCandidateNetworksMatchingBSSIDs:v13 completionHandler:v15];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)_handleCandidateMatches:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1D9440170]();
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__10;
  long long v38 = __Block_byref_object_dispose__10;
  id v39 = 0;
  v28 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    int v25 = MEMORY[0x1E4F14500];
    __int16 v26 = "%s: no candidates";
    goto LABEL_16;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [(WiFiAvailabilityEngine *)self availableNetworks];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v12 = [v11 matchedAt];
        [v6 timeIntervalSinceDate:v12];
        double v14 = v13;
        [(WiFiAvailabilityEngine *)self availabilityMatchMaximumAge];
        BOOL v16 = v14 < v15;

        if (v16) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v8);
  }

  uint64_t v17 = [v5 mutableCopy];
  v18 = (void *)v35[5];
  v35[5] = v17;

  long long v19 = (void *)v35[5];
  long long v20 = [(WiFiAvailabilityEngine *)self availableNetworks];
  [v19 minusSet:v20];

  long long v21 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];
  [(WiFiAvailabilityEngine *)self setAvailableNetworks:v21];

  long long v22 = [(WiFiAvailabilityEngine *)self availabilityChangedCallback];
  BOOL v23 = v22 == 0;

  if (v23)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    int v25 = MEMORY[0x1E4F14500];
    __int16 v26 = "%s: no availability callback provided";
    goto LABEL_16;
  }
  if (![(id)v35[5] count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    int v25 = MEMORY[0x1E4F14500];
    __int16 v26 = "%s: no change to available networks";
LABEL_16:
    _os_log_impl(&dword_1D3CCD000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
    goto LABEL_17;
  }
  uint64_t v24 = [(WiFiAvailabilityEngine *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WiFiAvailabilityEngine__handleCandidateMatches___block_invoke;
  block[3] = &unk_1E69BD5B0;
  block[4] = self;
  block[5] = &v34;
  dispatch_async(v24, block);

LABEL_17:
  _Block_object_dispose(&v34, 8);
}

- (NSSet)availableNetworks
{
  return self->_availableNetworks;
}

- (void)setAvailableNetworks:(id)a3
{
}

- (id)availabilityChangedCallback
{
  return self->_availabilityChangedCallback;
}

void __50__WiFiAvailabilityEngine__setupProviderCallbacks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleScanResultCallback:v6 error:v5];
}

void __69__WiFiAvailabilityEngine__findAvailabilityMatchesInSourcesForBSSIDS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v23 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v5;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fetched matches %@", buf, 0x16u);
    }
    __int16 v26 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v23);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v25 = v5;
    id v7 = v5;
    uint64_t v28 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v28)
    {
      uint64_t v8 = *(void *)v30;
      uint64_t v9 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v7);
          }
          long long v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v12 = (void *)MEMORY[0x1D9440170]();
          double v13 = [v7 objectForKey:v11];
          double v14 = [*(id *)(a1 + 32) objectForKey:v11];
          if (v14)
          {
            double v15 = +[WiFiAvailabilityMatch matchWithNetwork:v13 scannedNetwork:v14];
            if (v15)
            {
              v27 = v12;
              BOOL v16 = [*(id *)(a1 + 40) wifiLexicon];
              if (v16)
              {
                uint64_t v17 = [*(id *)(a1 + 40) wifiLexicon];
                [v15 SSID];
                uint64_t v18 = a1;
                id v19 = v7;
                v21 = uint64_t v20 = v8;
                objc_msgSend(v15, "setUnwantedNetworkName:", objc_msgSend(v17, "stringContainsUnwantedWords:", v21));

                uint64_t v8 = v20;
                id v7 = v19;
                a1 = v18;
                uint64_t v9 = MEMORY[0x1E4F14500];
              }
              else
              {
                [v15 setUnwantedNetworkName:0];
              }

              [v26 addObject:v15];
              objc_opt_class();
              long long v12 = v27;
              if (objc_opt_isKindOfClass())
              {
                long long v22 = [v14 SSID];
                [v13 setSSID:v22];

                long long v12 = v27;
              }
            }
            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315651;
              uint64_t v34 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
              __int16 v35 = 2113;
              uint64_t v36 = (uint64_t)v13;
              __int16 v37 = 2113;
              long long v38 = v14;
              _os_log_impl(&dword_1D3CCD000, v9, OS_LOG_TYPE_DEFAULT, "%s: failed to create match for candidate %{private}@, scanned %{private}@", buf, 0x20u);
            }
          }
          else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315907;
            uint64_t v34 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
            __int16 v35 = 2160;
            uint64_t v36 = 1752392040;
            __int16 v37 = 2112;
            long long v38 = v11;
            __int16 v39 = 2113;
            long long v40 = v13;
            _os_log_impl(&dword_1D3CCD000, v9, OS_LOG_TYPE_DEFAULT, "%s: missing scan match for bssid %{mask.hash}@, candidate %{private}@", buf, 0x2Au);
          }
        }
        uint64_t v28 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v28);
    }

    [*(id *)(a1 + 40) _handleCandidateMatches:v26];
    id v6 = v24;
    id v5 = v25;
  }
}

- (WiFiAvailabilityEngine)initWithProviders:(id)a3 sources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    if ([v6 count]
      && [v8 count]
      && (v24.receiver = self,
          v24.super_class = (Class)WiFiAvailabilityEngine,
          (self = [(WiFiAvailabilityEngine *)&v24 init]) != 0))
    {
      uint64_t v10 = (NSSet *)[v6 copy];
      providers = self->_providers;
      self->_providers = v10;

      long long v12 = (NSSet *)[v8 copy];
      sources = self->_sources;
      self->_sources = v12;

      double v14 = [MEMORY[0x1E4F1CAD0] set];
      availableNetworks = self->_availableNetworks;
      self->_availableNetworks = v14;

      BOOL v16 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__WiFiAvailabilityEngine_initWithProviders_sources___block_invoke;
      block[3] = &unk_1E69BC8D8;
      uint64_t v17 = self;
      id v23 = v17;
      dispatch_async(v16, block);

      uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.WiFiPolicy.availability-engine", v18);
      queue = v17->_queue;
      v17->_queue = (OS_dispatch_queue *)v19;

      v17->_availabilityMatchMaximumAge = 600.0;
      [(WiFiAvailabilityEngine *)v17 _setupProviderCallbacks:self->_providers];
      [(WiFiAvailabilityEngine *)v17 _setupSourceCallbacks:self->_sources];
      self = v17;

      uint64_t v9 = self;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t __52__WiFiAvailabilityEngine_initWithProviders_sources___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(WiFiLexicon);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 72);
  *(void *)(v4 + 72) = v2;

  return MEMORY[0x1F41817F8](v2, v5, v3);
}

- (void)_setupProviderCallbacks:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v6)
  {
    p_locationProvider = (id *)&self->_locationProvider;
    uint64_t v7 = *(void *)v17;
    p_scanProvider = &self->_scanProvider;
    uint64_t v9 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v22 = "-[WiFiAvailabilityEngine _setupProviderCallbacks:]";
          __int16 v23 = 2112;
          objc_super v24 = v11;
          _os_log_impl(&dword_1D3CCD000, v9, OS_LOG_TYPE_DEFAULT, "%s: provider %@", buf, 0x16u);
        }
        if ([v11 conformsToProtocol:&unk_1F2BC2700])
        {
          id v12 = objc_storeWeak((id *)p_scanProvider, v11);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __50__WiFiAvailabilityEngine__setupProviderCallbacks___block_invoke;
          v14[3] = &unk_1E69BCC20;
          objc_copyWeak(&v15, &location);
          [v11 addScanResultsCallback:v14];

          objc_destroyWeak(&v15);
        }
        else if ([v11 conformsToProtocol:&unk_1F2BC2760])
        {
          objc_storeWeak(p_locationProvider, v11);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

- (void)_setupSourceCallbacks:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v26 = "-[WiFiAvailabilityEngine _setupSourceCallbacks:]";
          __int16 v27 = 2112;
          uint64_t v28 = v7;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: source %@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (NSClassFromString(&cfstr_Wftwalletsourc.isa), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke;
          v19[3] = &unk_1E69BE5C0;
          objc_copyWeak(&v20, (id *)buf);
          [v7 setRelevancyHandler:v19];
          uint64_t v8 = [v7 relevantNetworks];
          uint64_t v9 = [v8 count];

          if (v9)
          {
            id WeakRetained = objc_loadWeakRetained((id *)buf);
            long long v11 = [v7 relevantNetworks];
            [WeakRetained _handleWalletRelevancyAdded:v11 removed:0];
          }
          objc_destroyWeak(&v20);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (NSClassFromString(&cfstr_Wft3barssource.isa), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke_2;
          v17[3] = &unk_1E69BE5C0;
          objc_copyWeak(&v18, (id *)buf);
          [v7 setRelevancyHandler:v17];
          id v12 = [v7 relevantNetworks];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            id v14 = objc_loadWeakRetained((id *)buf);
            id v15 = [v7 relevantNetworks];
            [v14 _handle3BarsRelevancyAdded:v15 removed:0];
          }
          objc_destroyWeak(&v18);
        }
        objc_destroyWeak((id *)buf);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v4);
  }
}

void __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleWalletRelevancyAdded:v6 removed:v5];
}

void __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handle3BarsRelevancyAdded:v6 removed:v5];
}

- (void)setAvailabilityMatchMaximumAge:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_double availabilityMatchMaximumAge = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    double availabilityMatchMaximumAge = self->_availabilityMatchMaximumAge;
    int v5 = 136315394;
    id v6 = "-[WiFiAvailabilityEngine setAvailabilityMatchMaximumAge:]";
    __int16 v7 = 2048;
    double v8 = availabilityMatchMaximumAge;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: setting new max age %f", (uint8_t *)&v5, 0x16u);
  }
}

void __50__WiFiAvailabilityEngine__handleCandidateMatches___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) availabilityChangedCallback];
  v2[2](v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)_createAvailabilityMatchForCandidate:(id)a3 scannedNetwork:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = +[WiFiAvailabilityMatch matchWithNetwork:v6 scannedNetwork:v7];
  if (v8 && [v6 source] == 2)
  {
    uint64_t v9 = [(WiFiAvailabilityEngine *)self wifiLexicon];
    if (v9)
    {
      uint64_t v10 = [(WiFiAvailabilityEngine *)self wifiLexicon];
      long long v11 = [v8 SSID];
      objc_msgSend(v8, "setUnwantedNetworkName:", objc_msgSend(v10, "stringContainsUnwantedWords:", v11));
    }
    else
    {
      [v8 setUnwantedNetworkName:0];
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v8 SSID];
      int v14 = 136315906;
      id v15 = "-[WiFiAvailabilityEngine _createAvailabilityMatchForCandidate:scannedNetwork:]";
      __int16 v16 = 2112;
      long long v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: unwanted network name %@ for candidate %@ scanned %@", (uint8_t *)&v14, 0x2Au);
    }
  }

  return v8;
}

- (void)_handleWalletRelevancyAdded:(id)a3 removed:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[WiFiAvailabilityEngine _handleWalletRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: wallet networks became relevant: %@", (uint8_t *)&v7, 0x16u);
  }
  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[WiFiAvailabilityEngine _handleWalletRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: wallet networks no longer relevant: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_handle3BarsRelevancyAdded:(id)a3 removed:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[WiFiAvailabilityEngine _handle3BarsRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: 3bars networks became relevant: %@", (uint8_t *)&v7, 0x16u);
  }
  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[WiFiAvailabilityEngine _handle3BarsRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: 3bars networks no longer relevant: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)findRecommendationForScannedNetwork:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WiFiAvailabilityEngine *)self findRecommendationsForScannedNetwork:v4];
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      __int16 v9 = "-[WiFiAvailabilityEngine findRecommendationForScannedNetwork:]";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: matches %@, for network %@", (uint8_t *)&v8, 0x20u);
    }
    id v6 = [v5 anyObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)findRecommendationsForScannedNetwork:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WiFiAvailabilityEngine *)self availableNetworks];

  if (v5)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(WiFiAvailabilityEngine *)self availableNetworks];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v11 isEqualToScannedNetwork:v4])
          {
            [v5 addObject:v11];
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  if ([v5 count]) {
    __int16 v12 = v5;
  }
  else {
    __int16 v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (double)availabilityMatchMaximumAge
{
  return self->_availabilityMatchMaximumAge;
}

- (NSSet)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (void)setSources:(id)a3
{
}

- (void)setAvailabilityChangedCallback:(id)a3
{
}

- (WiFiScanProvider)scanProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanProvider);

  return (WiFiScanProvider *)WeakRetained;
}

- (void)setScanProvider:(id)a3
{
}

- (WiFiLocationProvider)locationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationProvider);

  return (WiFiLocationProvider *)WeakRetained;
}

- (void)setLocationProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (WiFiLexicon)wifiLexicon
{
  return self->_wifiLexicon;
}

- (void)setWifiLexicon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiLexicon, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_locationProvider);
  objc_destroyWeak((id *)&self->_scanProvider);
  objc_storeStrong(&self->_availabilityChangedCallback, 0);
  objc_storeStrong((id *)&self->_availableNetworks, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_providers, 0);
}

@end