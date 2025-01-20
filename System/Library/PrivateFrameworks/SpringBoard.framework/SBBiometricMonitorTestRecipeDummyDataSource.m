@interface SBBiometricMonitorTestRecipeDummyDataSource
- (BOOL)matchRunning;
- (BOOL)poseIsMarginal;
- (BOOL)presenceDetectRunning;
- (void)addObserver:(id)a3;
- (void)cycleState;
- (void)removeObserver:(id)a3;
@end

@implementation SBBiometricMonitorTestRecipeDummyDataSource

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSMutableSet *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)presenceDetectRunning
{
  return (self->_state < 4uLL) & (0xEu >> (self->_state & 0xF));
}

- (BOOL)matchRunning
{
  return self->_state == 3;
}

- (void)cycleState
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  switch(self->_state)
  {
    case 0:
      self->_state = 1;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v4 = [v3 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v73 != v6) {
              objc_enumerationMutation(v3);
            }
            id v8 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v8 biometricMonitorDataSourcePresenceDetectionStarted:self];
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v72 objects:v83 count:16];
        }
        while (v5);
      }
      goto LABEL_81;
    case 1:
      self->_state = 2;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v9 = [v3 countByEnumeratingWithState:&v68 objects:v82 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v69 != v11) {
              objc_enumerationMutation(v3);
            }
            v13 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v13 biometricMonitorDataSourcePresenceDetectionSucceeded:self];
            }
          }
          uint64_t v10 = [v3 countByEnumeratingWithState:&v68 objects:v82 count:16];
        }
        while (v10);
      }
      goto LABEL_81;
    case 2:
      self->_state = 3;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v14 = [v3 countByEnumeratingWithState:&v64 objects:v81 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v65;
        do
        {
          for (uint64_t k = 0; k != v15; ++k)
          {
            if (*(void *)v65 != v16) {
              objc_enumerationMutation(v3);
            }
            v18 = *(void **)(*((void *)&v64 + 1) + 8 * k);
            if (objc_opt_respondsToSelector()) {
              [v18 biometricMonitorDataSourceMatchingStarted:self];
            }
          }
          uint64_t v15 = [v3 countByEnumeratingWithState:&v64 objects:v81 count:16];
        }
        while (v15);
      }
      goto LABEL_81;
    case 3:
      self->_state = 4;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v19 = [v3 countByEnumeratingWithState:&v60 objects:v80 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v61;
        do
        {
          for (uint64_t m = 0; m != v20; ++m)
          {
            if (*(void *)v61 != v21) {
              objc_enumerationMutation(v3);
            }
            v23 = *(void **)(*((void *)&v60 + 1) + 8 * m);
            if (objc_opt_respondsToSelector()) {
              [v23 biometricMonitorDataSourceMatchingSucceeded:self];
            }
          }
          uint64_t v20 = [v3 countByEnumeratingWithState:&v60 objects:v80 count:16];
        }
        while (v20);
      }
      goto LABEL_81;
    case 4:
      self->_state = 5;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v24 = [v3 countByEnumeratingWithState:&v56 objects:v79 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v57;
        do
        {
          for (uint64_t n = 0; n != v25; ++n)
          {
            if (*(void *)v57 != v26) {
              objc_enumerationMutation(v3);
            }
            v28 = *(void **)(*((void *)&v56 + 1) + 8 * n);
            if (objc_opt_respondsToSelector()) {
              [v28 biometricMonitorDataSourceMatchingFailed:self];
            }
          }
          uint64_t v25 = [v3 countByEnumeratingWithState:&v56 objects:v79 count:16];
        }
        while (v25);
      }
      goto LABEL_81;
    case 5:
      self->_state = 6;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v29 = [v3 countByEnumeratingWithState:&v52 objects:v78 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v53;
        do
        {
          for (iuint64_t i = 0; ii != v30; ++ii)
          {
            if (*(void *)v53 != v31) {
              objc_enumerationMutation(v3);
            }
            v33 = *(void **)(*((void *)&v52 + 1) + 8 * ii);
            if (objc_opt_respondsToSelector()) {
              [v33 biometricMonitorDataSourceMatchingFailed:self];
            }
          }
          uint64_t v30 = [v3 countByEnumeratingWithState:&v52 objects:v78 count:16];
        }
        while (v30);
      }
      goto LABEL_81;
    case 6:
      self->_state = 7;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v34 = [v3 countByEnumeratingWithState:&v48 objects:v77 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v49;
        do
        {
          for (juint64_t j = 0; jj != v35; ++jj)
          {
            if (*(void *)v49 != v36) {
              objc_enumerationMutation(v3);
            }
            v38 = *(void **)(*((void *)&v48 + 1) + 8 * jj);
            if (objc_opt_respondsToSelector()) {
              [v38 biometricMonitorDataSourceMatchingEnded:self];
            }
          }
          uint64_t v35 = [v3 countByEnumeratingWithState:&v48 objects:v77 count:16];
        }
        while (v35);
      }
      goto LABEL_81;
    case 7:
      self->_state = 0;
      self->_poseIsMarginal ^= 1u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v3 = (void *)[(NSMutableSet *)self->_observers copy];
      uint64_t v39 = [v3 countByEnumeratingWithState:&v44 objects:v76 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v45;
        do
        {
          for (kuint64_t k = 0; kk != v40; ++kk)
          {
            if (*(void *)v45 != v41) {
              objc_enumerationMutation(v3);
            }
            v43 = *(void **)(*((void *)&v44 + 1) + 8 * kk);
            if (objc_opt_respondsToSelector()) {
              [v43 biometricMonitorDataSourcePoseUpdated:self];
            }
          }
          uint64_t v40 = [v3 countByEnumeratingWithState:&v44 objects:v76 count:16];
        }
        while (v40);
      }
LABEL_81:

      break;
    default:
      return;
  }
}

- (BOOL)poseIsMarginal
{
  return self->_poseIsMarginal;
}

- (void).cxx_destruct
{
}

@end