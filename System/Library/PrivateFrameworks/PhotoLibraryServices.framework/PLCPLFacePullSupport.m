@interface PLCPLFacePullSupport
+ (id)_disjointSetsByAddingSet:(id)a3 toSets:(id)a4;
+ (void)applyFacesChangesFromAssetChange:(id)a3 toAsset:(id)a4 inSyncContext:(id)a5;
- (BOOL)_canAssignFaceFromPerson:(id)a3 toPerson:(id)a4;
- (PLCPLFacePullSupport)initWithSyncContext:(id)a3 asset:(id)a4;
- (id)_applyAssetChange:(id)a3 toExistingFaces:(id)a4 withPolicy:(int64_t)a5;
- (id)_createFaceFromFaceRef:(id)a3 algorithmVersion:(int)a4;
- (int64_t)_policyForApplyingFaceChangesFromAssetChange:(id)a3;
- (void)_applyDimensionAndStateFromFaceReference:(id)a3 toDetectedFace:(id)a4;
- (void)_applyPersonFromFaceReference:(id)a3 toDetectedFace:(id)a4;
- (void)_finalizeFace:(id)a3 withFaceRef:(id)a4 applyDimensionAndState:(BOOL)a5;
- (void)_unlinkPersonIfVerifiedFromFace:(id)a3;
- (void)applyFacesChangesFromAssetChange:(id)a3;
- (void)dealloc;
@end

@implementation PLCPLFacePullSupport

+ (void)applyFacesChangesFromAssetChange:(id)a3 toAsset:(id)a4 inSyncContext:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x19F38D3B0]();
  v10 = [[PLCPLFacePullSupport alloc] initWithSyncContext:v8 asset:v7];
  [(PLCPLFacePullSupport *)v10 applyFacesChangesFromAssetChange:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_syncContext, 0);
}

- (void)_applyPersonFromFaceReference:(id)a3 toDetectedFace:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v48 = v6;
  uint64_t v8 = [v6 personIdentifier];
  uint64_t v45 = v8;
  v47 = v7;
  if (v8)
  {
    v9 = -[PLSyncContext personForUUID:](self->_syncContext, "personForUUID:", v8, v8);
    v10 = self;
    if (v9)
    {
      id v11 = [v7 personForFace];
      if ([(PLCPLFacePullSupport *)self _canAssignFaceFromPerson:v11 toPerson:v9])
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          v12 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [v48 pointerDescription];
            v14 = [v9 syncDescription];
            *(_DWORD *)buf = 138412546;
            v55 = v13;
            __int16 v56 = 2112;
            v57 = v14;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Applying faceRef %@ for %@", buf, 0x16u);
          }
        }
        uint64_t v15 = [v48 nameSource];
        [v7 setCloudNameSource:v15];
        if ((int)v15 >= 7)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v16 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = [v48 pointerDescription];
              *(_DWORD *)buf = 138412546;
              v55 = v17;
              __int16 v56 = 1024;
              LODWORD(v57) = v15;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%@ has unsupported name source %d, defaulting to not-set", buf, 0x12u);
            }
          }
          uint64_t v15 = 0;
        }
        [v7 setNameSource:v15];
        if ([v48 isKeyFace])
        {
          if (PLNameSourceIsSyncable([v7 nameSource]))
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v18 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = [v7 pointerDescription];
                v20 = [v9 pointerDescription];
                *(_DWORD *)buf = 138412546;
                v55 = v19;
                __int16 v56 = 2112;
                v57 = v20;
                _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Setting keyFace %@ to person %@", buf, 0x16u);
              }
            }
            [v7 setPersonBeingKeyFace:v9];
            [v9 setKeyFaceToPicked];
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            v27 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v48;
              _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Key faceRef %@ has invalid nameSource, keeping face, but dropping being key", buf, 0xCu);
            }
          }
        }
        [v7 setAssociatedPerson:v9];
        if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType])
        {
          __int16 v28 = [v48 detectionType];
          if (!v28)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v29 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v48;
                _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "FaceRef record has unknown detectionType, defaulting to Human detectionType %@", buf, 0xCu);
              }
            }
            __int16 v28 = 1;
          }
          [v7 setDetectionType:v28];
        }
      }
      else if (!*MEMORY[0x1E4F59AC0])
      {
        v24 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v48 pointerDescription];
          v26 = [v9 syncDescription];
          *(_DWORD *)buf = 138412546;
          v55 = v25;
          __int16 v56 = 2112;
          v57 = v26;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Unable to assign faceRef %@ to person %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        v23 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v48;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Unable to find person for faceRef %@", buf, 0xCu);
        }
      }
      [(PLCPLFacePullSupport *)self _unlinkPersonIfVerifiedFromFace:v7];
    }
  }
  else
  {
    v10 = self;
    if (!*MEMORY[0x1E4F59AC0])
    {
      v21 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(v48, "pointerDescription", 0);
        *(_DWORD *)buf = 138412290;
        v55 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "faceRef %@ has no person", buf, 0xCu);
      }
    }
    -[PLCPLFacePullSupport _unlinkPersonIfVerifiedFromFace:](v10, "_unlinkPersonIfVerifiedFromFace:", v7, v45);
  }
  v30 = (unsigned char *)MEMORY[0x1E4F59AC0];
  v31 = [v48 rejectedPersonIdentifiers];
  v32 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v31, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v33 = v31;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v39 = [(PLSyncContext *)v10->_syncContext personForUUID:v38];
        if (v39)
        {
          if (!*v30)
          {
            v40 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v39 syncDescription];
              [v48 pointerDescription];
              v43 = v42 = v10;
              *(_DWORD *)buf = 138412546;
              v55 = v41;
              __int16 v56 = 2112;
              v57 = v43;
              _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Adding rejectedPerson %@ for faceRef %@", buf, 0x16u);

              v10 = v42;
              v30 = (unsigned char *)MEMORY[0x1E4F59AC0];
            }
          }
          [v32 addObject:v39];
        }
        else if (!*v30)
        {
          v44 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v55 = v38;
            __int16 v56 = 2112;
            v57 = v48;
            _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Unable to find rejected person with UUID %@ for %@", buf, 0x16u);
          }
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v35);
  }

  [v47 setRejectedPersons:v32];
}

- (BOOL)_canAssignFaceFromPerson:(id)a3 toPerson:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 personUUID];
  v9 = [v7 personUUID];
  char v10 = [v8 isEqualToString:v9];

  if (v10) {
    goto LABEL_8;
  }
  if (![v7 graphVerified]) {
    goto LABEL_8;
  }
  syncContext = self->_syncContext;
  v12 = [v6 personUUID];
  LOBYTE(syncContext) = [(PLSyncContext *)syncContext personUUIDIsDeleted:v12];

  if (syncContext) {
    goto LABEL_8;
  }
  if (([v6 userVerified] & 1) == 0)
  {
    if ([v6 graphVerified])
    {
      BOOL v13 = !+[PLPerson person:v6 isBetterMergeTargetThanPerson:v7];
      goto LABEL_9;
    }
LABEL_8:
    LOBYTE(v13) = 1;
    goto LABEL_9;
  }
  LOBYTE(v13) = 0;
LABEL_9:

  return v13;
}

- (void)_unlinkPersonIfVerifiedFromFace:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 personForFace];
  v5 = v4;
  if (v4 && (([v4 userVerified] & 1) != 0 || objc_msgSend(v5, "graphVerified")))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v6 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v3 pointerDescription];
        uint64_t v8 = [v3 personForFace];
        v9 = [v8 syncDescription];
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2112;
        BOOL v13 = v9;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Unlinking face %@ from person %@", (uint8_t *)&v10, 0x16u);
      }
    }
    [v3 setPersonBeingKeyFace:0];
    [v3 setAssociatedPerson:0];
  }
}

- (void)_applyDimensionAndStateFromFaceReference:(id)a3 toDetectedFace:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  [v5 centerX];
  objc_msgSend(v8, "setCenterX:");
  [v5 centerY];
  objc_msgSend(v8, "setCenterY:");
  [v5 size];
  objc_msgSend(v8, "setSize:");
  objc_msgSend(v8, "setManual:", objc_msgSend(v5, "isManual"));
  [v5 bodyCenterX];
  objc_msgSend(v8, "setBodyCenterX:");
  [v5 bodyCenterY];
  objc_msgSend(v8, "setBodyCenterY:");
  [v5 bodyWidth];
  objc_msgSend(v8, "setBodyWidth:");
  [v5 bodyHeight];
  double v7 = v6;

  [v8 setBodyHeight:v7];
}

- (void)_finalizeFace:(id)a3 withFaceRef:(id)a4 applyDimensionAndState:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  if (v5) {
    [(PLCPLFacePullSupport *)self _applyDimensionAndStateFromFaceReference:v8 toDetectedFace:v9];
  }
  [(PLCPLFacePullSupport *)self _applyPersonFromFaceReference:v8 toDetectedFace:v9];
  [v9 setCloudLocalState:1];
  objc_msgSend(v9, "setSourceWidth:", -[PLSyncableAsset width](self->_currentAsset, "width"));
  objc_msgSend(v9, "setSourceHeight:", -[PLSyncableAsset height](self->_currentAsset, "height"));
}

- (id)_createFaceFromFaceRef:(id)a3 algorithmVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  syncContext = self->_syncContext;
  id v7 = a3;
  id v8 = [(PLSyncContext *)syncContext makeFace];
  [(PLCPLFacePullSupport *)self _finalizeFace:v8 withFaceRef:v7 applyDimensionAndState:1];

  [v8 setFaceAlgorithmVersion:v4];
  return v8;
}

- (id)_applyAssetChange:(id)a3 toExistingFaces:(id)a4 withPolicy:(int64_t)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v70 = a4;
  [MEMORY[0x1E4F1CA80] set];
  int64_t v67 = a5;
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"manual == NO"];
    int v10 = [v70 filteredSetUsingPredicate:v9];

    [v68 unionSet:v10];
  }
  v66 = v8;
  id v11 = [v8 faces];
  __int16 v12 = [v11 faces];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v72;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v72 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v71 + 1) + 8 * v16);
        v18 = [PLFaceDimension alloc];
        uint64_t v19 = [(PLSyncableAsset *)self->_currentAsset width];
        uint64_t v20 = [(PLSyncableAsset *)self->_currentAsset height];
        [v17 centerX];
        double v22 = v21;
        [v17 centerY];
        double v24 = v23;
        [v17 size];
        double v26 = v25;
        [v17 bodyCenterX];
        double v28 = v27;
        [v17 bodyCenterY];
        double v30 = v29;
        [v17 bodyWidth];
        double v32 = v31;
        [v17 bodyHeight];
        uint64_t v34 = [(PLFaceDimension *)v18 initWithSourceWidth:v19 sourceHeight:v20 centerX:v22 centerY:v24 size:v26 bodyCenterX:v28 bodyCenterY:v30 bodyWidth:v32 bodyHeight:v33];
        if ([v17 isManual])
        {
          uint64_t v35 = +[PLDetectedFace findExistingFaceMatchingDimension:v34 inFaces:v70 ignoreSourceAssetDimensions:1];
          if (v35)
          {
            uint64_t v36 = v35;
            if ([v35 manual])
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                v37 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  v38 = [v36 syncDescription];
                  *(_DWORD *)buf = 138412546;
                  id v76 = v38;
                  __int16 v77 = 2112;
                  id v78 = v17;
                  _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Updating manual face %@ with %@", buf, 0x16u);
                }
              }
              v39 = self;
              v40 = v36;
              v41 = v17;
              uint64_t v42 = 1;
            }
            else
            {
              if (v67)
              {
                if (v67 == 1)
                {
                  v48 = [(PLCPLFacePullSupport *)self _createFaceFromFaceRef:v17 algorithmVersion:0];
                  if (!*MEMORY[0x1E4F59AC0])
                  {
                    long long v52 = __CPLAssetsdOSLogDomain();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                    {
                      v53 = [v48 syncDescription];
                      *(_DWORD *)buf = 138412546;
                      id v76 = v53;
                      __int16 v77 = 2112;
                      id v78 = v17;
                      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "Made a new manual face %@ with %@", buf, 0x16u);
                    }
                  }
                  goto LABEL_62;
                }
                goto LABEL_61;
              }
              if (!*MEMORY[0x1E4F59AC0])
              {
                v54 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  v55 = [v36 syncDescription];
                  *(_DWORD *)buf = 138412546;
                  id v76 = v55;
                  __int16 v77 = 2112;
                  id v78 = v17;
                  _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Found existing face %@ matching %@", buf, 0x16u);
                }
              }
              v39 = self;
              v40 = v36;
              v41 = v17;
              uint64_t v42 = 0;
            }
            [(PLCPLFacePullSupport *)v39 _finalizeFace:v40 withFaceRef:v41 applyDimensionAndState:v42];
            __int16 v56 = v36;
            goto LABEL_48;
          }
          v48 = [(PLCPLFacePullSupport *)self _createFaceFromFaceRef:v17 algorithmVersion:0];
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v50 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              long long v51 = [v48 syncDescription];
              *(_DWORD *)buf = 138412546;
              id v76 = v51;
              __int16 v77 = 2112;
              id v78 = v17;
              _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_DEFAULT, "Made a new manual face %@ with %@", buf, 0x16u);
            }
          }
LABEL_35:
          uint64_t v36 = 0;
          goto LABEL_62;
        }
        id v43 = v17;
        if ([v43 hasCenterX])
        {
          [v43 centerX];
          BOOL v45 = v44 != 0.0;
        }
        else
        {
          BOOL v45 = 0;
        }
        int v46 = [v43 isTorsoOnly];
        if (([v43 hasNameSource] & 1) == 0)
        {

LABEL_28:
          if (*MEMORY[0x1E4F59AC0]) {
            goto LABEL_66;
          }
          v48 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v43;
            _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Dropping unexpected faceRef %@", buf, 0xCu);
          }
          goto LABEL_65;
        }
        int IsSyncable = PLNameSourceIsSyncable([v43 nameSource]);

        if ((v45 | v46) != 1 || !IsSyncable) {
          goto LABEL_28;
        }
        if (!v67)
        {
          uint64_t v57 = +[PLDetectedFace findExistingFaceMatchingDimension:v34 inFaces:v70 ignoreSourceAssetDimensions:1];
          if (v57)
          {
            uint64_t v58 = (void *)v57;
            if (!*MEMORY[0x1E4F59AC0])
            {
              v59 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                v60 = [v58 syncDescription];
                *(_DWORD *)buf = 138412546;
                id v76 = v60;
                __int16 v77 = 2112;
                id v78 = v43;
                _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, "Found existing face %@ matching %@", buf, 0x16u);
              }
            }
            [(PLCPLFacePullSupport *)self _finalizeFace:v58 withFaceRef:v43 applyDimensionAndState:0];
            __int16 v56 = v58;
LABEL_48:
            uint64_t v36 = v56;
            v48 = v56;
            goto LABEL_62;
          }
          if ([(PLSyncableAsset *)self->_currentAsset faceDetectionComplete])
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v61 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v76 = v43;
                _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_DEFAULT, "Face detection complete and a matching face for downloaded face is not found, dropping the face %@", buf, 0xCu);
              }
            }
            uint64_t v36 = 0;
LABEL_61:
            v48 = 0;
            goto LABEL_62;
          }
          v48 = -[PLCPLFacePullSupport _createFaceFromFaceRef:algorithmVersion:](self, "_createFaceFromFaceRef:algorithmVersion:", v43, [v66 facesVersion]);
          if (!*MEMORY[0x1E4F59AC0])
          {
            v62 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = [v48 syncDescription];
              *(_DWORD *)buf = 138412546;
              id v76 = v63;
              __int16 v77 = 2112;
              id v78 = v43;
              _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "Made a new detected face %@ with %@", buf, 0x16u);
            }
          }
          goto LABEL_35;
        }
        if (v67 != 1) {
          goto LABEL_66;
        }
        v48 = -[PLCPLFacePullSupport _createFaceFromFaceRef:algorithmVersion:](self, "_createFaceFromFaceRef:algorithmVersion:", v43, [v66 facesVersion]);
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_63;
        }
        uint64_t v36 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          long long v49 = [v48 syncDescription];
          *(_DWORD *)buf = 138412546;
          id v76 = v49;
          __int16 v77 = 2112;
          id v78 = v43;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Made a new detected face %@ with %@", buf, 0x16u);
        }
LABEL_62:

LABEL_63:
        if (!v48) {
          goto LABEL_66;
        }
        [v68 addObject:v48];
LABEL_65:

LABEL_66:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v64 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
      uint64_t v14 = v64;
    }
    while (v64);
  }

  return v68;
}

- (int64_t)_policyForApplyingFaceChangesFromAssetChange:(id)a3
{
  uint64_t v4 = [a3 facesAdjustmentsFingerprint];
  BOOL v5 = v4;
  if (v4)
  {
    int v6 = [v4 isEqualToString:*MEMORY[0x1E4F59730]];
    syncContext = self->_syncContext;
    id v8 = [(PLSyncableAsset *)self->_currentAsset cloudIdentifier];
    id v9 = [(PLSyncContext *)syncContext assetAdjustmentStateForCloudIdentifier:v8];

    int v10 = [v9 objectForKey:@"PLCPLAssetHasAdjustmentsKey"];
    int v11 = [v10 BOOLValue];

    __int16 v12 = [v9 objectForKey:@"PLCPLAssetAdjustmentFingerprintKey"];
    if (v6) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    int64_t v14 = !v13 && (v6 == v11 || ([v5 isEqualToString:v12] & 1) == 0);
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

- (void)applyFacesChangesFromAssetChange:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLSyncContext *)self->_syncContext serverSupportsVision])
  {
    int64_t v5 = [(PLCPLFacePullSupport *)self _policyForApplyingFaceChangesFromAssetChange:v4];
    int v6 = [(PLSyncableAsset *)self->_currentAsset detectedFaces];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isTrainingFace == YES"];
    uint64_t v8 = [v6 filteredSetUsingPredicate:v7];

    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isTrainingFace == NO"];
    double v30 = v6;
    int v10 = [v6 filteredSetUsingPredicate:v9];

    int v11 = [v4 faces];
    __int16 v12 = [v11 faces];
    uint64_t v13 = [v12 count];

    uint64_t v14 = [v10 count];
    uint64_t v15 = v14;
    uint64_t v16 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if ((v13 || v14 && v5 == 1) && !*MEMORY[0x1E4F59AC0])
    {
      v17 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = @"KeepLocal-MergeCloud";
        if (v5 == 1) {
          v18 = @"DropLocal-KeepCloud";
        }
        uint64_t v19 = v18;
        *(_DWORD *)buf = 138413058;
        double v32 = v19;
        __int16 v33 = 2048;
        uint64_t v34 = v13;
        __int16 v35 = 2048;
        uint64_t v36 = v15;
        __int16 v37 = 2112;
        id v38 = v4;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Applying face changes with policy %@ on %lu cloud faces, %lu local faces for asset change %@", buf, 0x2Au);

        uint64_t v16 = (unsigned char *)MEMORY[0x1E4F59AC0];
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    [v20 unionSet:v8];
    double v21 = [(PLCPLFacePullSupport *)self _applyAssetChange:v4 toExistingFaces:v10 withPolicy:v5];
    [v20 unionSet:v21];
    if ([v21 count] && !*v16)
    {
      double v22 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v21 count];
        *(_DWORD *)buf = 134217984;
        double v32 = (__CFString *)v23;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Keeping %ld faces after sync", buf, 0xCu);
      }
    }
    double v24 = (void *)v8;
    double v25 = v16;
    double v26 = [(PLSyncableAsset *)self->_currentAsset detectedFaces];
    double v27 = (void *)[v26 mutableCopy];

    [v27 minusSet:v20];
    if ([v27 count])
    {
      if (!*v25)
      {
        double v28 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [v27 count];
          *(_DWORD *)buf = 134217984;
          double v32 = (__CFString *)v29;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Deleting %lu faces", buf, 0xCu);
        }
      }
      [(PLSyncContext *)self->_syncContext deleteFaces:v27];
    }
    [(PLSyncableAsset *)self->_currentAsset setDetectedFaces:v20];
    if (v5 == 1 && [(PLSyncableAsset *)self->_currentAsset faceDetectionComplete]) {
      [(PLSyncableAsset *)self->_currentAsset markForNeedingFaceDetection];
    }
  }
}

- (void)dealloc
{
  syncContext = self->_syncContext;
  self->_syncContext = 0;

  currentAsset = self->_currentAsset;
  self->_currentAsset = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLCPLFacePullSupport;
  [(PLCPLFacePullSupport *)&v5 dealloc];
}

- (PLCPLFacePullSupport)initWithSyncContext:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCPLFacePullSupport;
  id v9 = [(PLCPLFacePullSupport *)&v13 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncContext, a3);
    objc_storeStrong((id *)&v10->_currentAsset, a4);
    int v11 = v10;
  }

  return v10;
}

+ (id)_disjointSetsByAddingSet:(id)a3 toSets:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "intersectsSet:", v14, (void)v16)) {
          [v8 unionSet:v14];
        }
        else {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v7 addObject:v8];
  return v7;
}

@end